package cronjob;

import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.mysql.cj.util.TimeUtil;

/**
 * Application Lifecycle Listener implementation class Listener
 *
 */
@WebListener
public class Listener implements ServletContextListener {
 
	private Thread t = null;
    private ServletContext context;
    
    public void contextInitialized(ServletContextEvent contextEvent) {
        t =  new Thread(){
            //task
            public void run(){                
                try {
                    while(true){
                    	
                         new SendmailJob().sendmail();
                         Thread.sleep(1000*60*10);
                    }
                } catch (InterruptedException e) {}
            }            
        };
        t.start();
        //context = contextEvent.getServletContext();
        // you can set a context variable just like this
        //context.setAttribute("TEST", "TEST_VALUE");
    }
    public void contextDestroyed(ServletContextEvent contextEvent) {
        // context is destroyed interrupts the thread
        t.interrupt();
    }            
}
	

