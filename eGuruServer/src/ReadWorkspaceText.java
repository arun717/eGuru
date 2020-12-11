import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

/**
 * Servlet implementation class ReadWorspaceText
 */
@WebServlet("/ReadWorspaceText")
public class ReadWorkspaceText extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadWorkspaceText() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

        String codefile = "/EclipseData/WorkspaceText.txt";
        String consolefile = "/EclipseData/ConsoleText.txt";

        ServletContext context = getServletContext();

        // First get the file InputStream using ServletContext.getResourceAsStream() method.
        InputStream is = context.getResourceAsStream(codefile);
        
        if (is != null) {
            InputStreamReader isr = new InputStreamReader(is);
            BufferedReader reader = new BufferedReader(isr);
            PrintWriter writer = response.getWriter();
            String text;
            StringBuffer sb=new StringBuffer();
            while ((text = reader.readLine()) != null) {
            	sb.append(text);      
            	sb.append("\n");     
            }
            System.out.println(sb.toString());
            
            StringBuffer sb2=new StringBuffer();
            InputStream is2 = context.getResourceAsStream(consolefile);
            if(is2 != null)
            {
            	InputStreamReader isr2 = new InputStreamReader(is2);
                BufferedReader reader2 = new BufferedReader(isr2);
                String text2;
                while ((text2 = reader2.readLine()) != null) {
                	sb2.append(text2);      
                	sb2.append("\n");     
                }
                System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
                System.out.println(sb2.toString());            	
            }
            else
            	System.out.println("error in reading the console txt file");
            
            

            writer.println("<html> <head> <meta NAME=\"viewport\" content=\"width=device-width, initial-scale=1\"> <style> #top, #bottom { position: fixed; LEFT: 0; RIGHT: 0; height: 50%; } #top { top: 0; background-color: lightyellow; } #bottom { bottom: 0; background-color: none; } #kryesore { overflow-y:scroll; } </style> </head> <body> <div id=\"top\" style=\"overflow-y: scroll; overflow-x: scroll;\">"
            		+ sb.toString()
            		+ "</div><br> <div id=\"bottom\" style=\"overflow-y: scroll; overflow-x: scroll;\">"
            		+ sb2.toString()
            		+ "</div> </body> </html>");
        }
        else
        	System.out.println("Error in reading the workspace code txt file");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
