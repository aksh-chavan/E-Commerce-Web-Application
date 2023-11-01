
package com.akshay.dao;

import com.akshay.entities.Product;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {
        private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
        
        public boolean saveProduct(Product product)
        {   
            boolean f = false;
            try{
                    Session session = this.factory.openSession();
                    Transaction tx = session.beginTransaction();
                    
                    session.save(product);
                    
                    tx.commit();
                    session.close();
                    f = true;
                
            }catch(Exception exp)
            {
            exp.printStackTrace();
            f = false;
            }
            
            return f;
        }
        
//        //// get all products
        
        public List<Product> getAllProducts(){

            Session ses = this.factory.openSession();
            Query query = ses.createQuery("from Product");
            List<Product> list = query.getResultList();
            return list;
}
        
        //// get all products by there ID :
        
         
        public List<Product> getAllProductsById(int cid){

            Session ses = this.factory.openSession();
            Query query = ses.createQuery("from Product as p where p.category.categoryId =: id");
            query.setParameter("id", cid); 
            List<Product> list = query.getResultList();
            return list;
}

        
}
