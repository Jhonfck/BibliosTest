#input date, Date returnDate, Integer penaltyDays
#output resultcode, amount
import org.codehaus.groovy.runtime.TimeCategory
import groovy.time.TimeDuration

println "returnDate "+returnDate
println "date "+date
Calendar calendar1 = Calendar.getInstance();
Calendar calendar2 = Calendar.getInstance();
	  
      calendar1.setTime(date); // Configuramos la fecha que se recibe
      calendar2.setTime(returnDate);

if (calendar1.before(calendar2) || calendar1.equals(calendar2)){
println "success"
return["resultcode":"success"]

} else {
// TimeDuration differenceInDays = TimeCategory.minus(date,returnDate)
long fechaActual = date.getTime()
long fechaRetorno = returnDate.getTime()
int dias = ((fechaActual - fechaRetorno) / (1000 * 60 * 60 * 24))+1


//int diferencia = ( calendar1.getTime() - calendar2.getTime() )/MILLSECS_PER_DAY;
 println "dias "+dias+ " class "+dias.getClass()
 println "penalty "+penaltyDays +" class " + penaltyDays.getClass()
 int amount = (dias * penaltyDays);

println "error"
return["resultcode":"error","amount":amount]

}

