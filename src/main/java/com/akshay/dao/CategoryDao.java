
package com.akshay.dao;

import com.akshay.entities.Category;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {
            
        private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
        
    //// saves the category tp database 
    
   
        public int saveCategory(Category cat)
        {
            
          
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            
             int catId = (int) session.save(cat);
            
            tx.commit();
            session.close();
            
            return catId;
            }
        
        
        public List<Category> getCategories()
        {
            Session session2 = this.factory.openSession();
            Query query = session2.createQuery("from Category");
            List<Category> list = query.getResultList();
            return list;
        }
        
        public Category getCategoryById(int cid)
        {
            Category cat=null;
            try{
                    Session session = this.factory.openSession();
                    cat = session.get(Category.class, cid);
                    session.close();
            }catch(Exception exp)
            {
                exp.printStackTrace();
            }
            
            return cat;
        }
        
}
