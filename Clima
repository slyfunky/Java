/*

@slyfunky

#######################################################################
# Helps
http://www.vogella.com/tutorials/JavaRegularExpressions/article.html
https://docs.oracle.com/javase/7/docs/api/java/util/regex/Pattern.html
http://en.wikipedia.org/wiki/Regular_expression
#######################################################################

# Terminal
renan@lab:~$ javac Clima.java
renan@lab:~$ java Clima
├ Cidade : Porto Alegre
├ Estado : RS
├ País : Brazil
│
├ Temperatura: 30°C
│ (Mín: 20°C, Máx: 32°C)
│
├ Vento 
│ (Velocidade: 5 km/h)
│ (Direção: SSW)
│
├ Umidade: 55%
├ Visibilidade: 11 km
├ Amanhecer: 5:18 AM
├ Anoitecer: 7:00 PM

*/

import java.net.URL;
import java.net.URLConnection;
//import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Clima
{
      
     public static void main(String[] args) //throws Exception
     {
         try
         {
             URL url = new URL("http://www.rssweather.com/wx/br/porto+alegre+aero-porto/wx.php");
             
             URLConnection rq = url.openConnection();
             rq.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2");
             
             InputStream resposta = rq.getInputStream();
             
             BufferedReader leitor = new BufferedReader(new InputStreamReader(resposta));
             
             String linha = leitor.readLine();

             String regex = "Temperature:\\s(\\d+.*?).+humidity\">(\\d+.*?)<.+windspeed\">(\\d+.*?)\\sKMH.+winddir\">(.*?)\\s.+dewpoint\">(\\d+.*?)&.+heatindex\">(\\d+.*?)&.+visibility\">\\s(\\d+.*?)\\skm.+<dd>(.*?)\\sAM.+<dd>(.*?)\\sPM";
             
             Pattern p = Pattern.compile(regex);
             Matcher m = p.matcher(linha);
             
             for (int n = 0; n < m.groupCount(); n++)
             {
                 if ((m.find() == true))
                 {
                     //System.out.println("├ Array : "+m.group(0));
                     //System.out.println("\t");
                     System.out.println("├ Temperatura: " +m.group(1) + "°C" );
                     System.out.println("│ (Mín: "+m.group(5) + "°C" + ", Máx: "+m.group(6) + "°C)");
                     System.out.println("│");
                     System.out.println("├ Vento ");
                     System.out.println("│ (Velocidade: " +m.group(3) + " km/h)");
                     System.out.println("│ (Direção: " +m.group(4) + ")");
                     System.out.println("│");                       System.out.println("├ Umidade: " +m.group(2) );
                     System.out.println("├ Visibilidade: " +m.group(7) + " km");
                     System.out.println("├ Amanhecer: " +m.group(8) + " AM");
                     System.out.println("├ Anoitecer: " +m.group(9) + " PM");
                 }
             }
             
          }
          catch (Exception erro)
          {
              System.out.println("\nErro .");
              //System.exit(0);
          }
          
     }

}

/*

# Regex
Temperature:\s(\d+.*?)
humidity">(\d+.*?)<
windspeed">(\d+.*?)\sKMH
winddir">(.*?)\s
dewpoint">(\d+.*?)&
heatindex">(\d+.*?)&
visibility">\s(\d+.*?)\skm
<dd>(.*?)\sAM
<dd>(.*?)\sPM

*/
