# gtm-start-expired date

Variable to check if the Date you set expired or not arrive yet. Return true after the check the contorl with this conditions. 
Start at: return true if date control >= date today
End at: return true if date control <= date today


## Author

Roberto Quesada from SIDN and Datalítica (https://datalitica.es/)

## Release Notes
	
| Date  | Notes |
|-------|-------|
| 25 November 2019  | First version of the variable released. |

## Before start.
 
The date set in YYYY-MM-dd format
Create new Javascript variable to set actual date({{JS - getDateNow}}) and set the next script:
function(){
  var res="";
  var d = new Date(Date.now()),
      month = '' + (d.getMonth() + 1),
      day = '' + d.getDate(),
      year = d.getFullYear();

  if (month.length < 2) 
    month = '0' + month;
  if (day.length < 2) 
    day = '0' + day;

  res= [year, month, day].join('-');
  return res;
}


## Steps to use the template

- set today date like a js variable.
- set control (init or end date)
- set date control 

