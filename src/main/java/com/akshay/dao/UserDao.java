/// using this class we can check user details which is present in our database 
package com.akshay.dao;
import com.akshay.entities.User;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

// Other imports...



public class UserDao {
        private SessionFactory factory;   ////  operation perform karne ke liye SessionFactory ki jarurt padti hai: 

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

        // get user by email and password :
    
        public User getUserByEmailandPassword(String userEmail, String userPassword)
        {
            User user = null;
            
            try{
            String query = "FROM User WHERE userEmail = :e and userPassword = :p";
            Session session = this.factory.openSession();
            Query yes = session.createQuery(query);
            yes.setParameter("e", userEmail);
            yes.setParameter("p", userPassword);

            user = (User)yes.getSingleResult();
            // user = (User)yes.getResultStream();
             
            session.close();
                    
            }catch(Exception exp)
            {
                exp.printStackTrace();
            }
            
            return user;

        }
        
        
}
