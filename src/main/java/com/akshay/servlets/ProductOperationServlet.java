/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.akshay.servlets;

import com.akshay.dao.CategoryDao;
import com.akshay.dao.ProductDao;
import com.akshay.entities.Category;
import com.akshay.entities.Product;
import com.akshay.helper.FactoryProvider;
import static com.google.common.base.CharMatcher.is;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
//            we need to add 2 servlet
//                    1 - add category
//                    2 - add product

                    String op = request.getParameter("operation");
                    
                    if(op.equals("addcategory"))
                    {
                    // fetching category data
                        // adding category
                        String title = request.getParameter("catTitle");    
                        String description = request.getParameter("catDescription");
                        
                        Category category = new Category();
                        category.setCategoryTitle(title);
                        category.setCategoryDescription(description);
                        
                        
                        /// category data save to database;
                        CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                        int catId = categoryDao.saveCategory(category);
                        //out.println("Category Save");
                        
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("message", "Category added successfully : " +  catId);
                        response.sendRedirect("admin.jsp");
                        return;
                        
                    }else if(op.trim().equals("addproduct"))
                    {
                        /// adding a product 
                        
                        String pName = request.getParameter("pTitle");
                        String pDesc = request.getParameter("pDescription");
                        int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                        int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                        int pQty = Integer.parseInt(request.getParameter("pQty"));
                        int catId = Integer.parseInt(request.getParameter("catId"));
                        
                        ///  for fetching file we use ----Part--- datatype
                        Part part = request.getPart("pImage");
                        
                        Product p = new Product();
                        p.setpName(pName);
                        p.setpDesc(pDesc);
                        p.setpPrice(pPrice);
                        p.setpDiscount(pDiscount);
                        p.setpQty(pQty);
                        p.setpPhoto(part.getSubmittedFileName());
                        
                        
                        /// get category by ID
                        CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                        Category category = cDao.getCategoryById(catId);
                        
                        /// this category is fetching dynamically from database:
                        p.setCategory(category);
                        
                        //picture uploading
                        // find out the path to upload the photo
                        String path = request.getRealPath("images") + File.separator + "products_imgs" + File.separator + part.getSubmittedFileName();
                        System.out.println(path);
                        
                        /// uploading code
                        try{
                        FileOutputStream fOs = new FileOutputStream(path);
                        
                        InputStream iS = part.getInputStream();
                        
                        byte []data=new byte[iS.available()];
                        iS.read(data);
                        
                        /// writing the data
                        fOs.write(data);
                        fOs.close();
                        }catch(Exception exp)
                        {
                            exp.printStackTrace();
                        }
                        // now we have to Save our Product into database :
                        ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                        pDao.saveProduct(p);
                        out.println("Product save auccess:");
                        
                        /// following code is perform a MESSAGE task on Admin Panel
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("message", "Product is added successfully!! ");
                        response.sendRedirect("admin.jsp");
                        return;
                    }

            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
