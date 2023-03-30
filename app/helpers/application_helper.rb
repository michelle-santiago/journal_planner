module ApplicationHelper
  def greet
   case Time.now.hour
   when 5..11 then 'Good Morning'       #5am-11:59am
   when 12..16 then 'Good Afternoon'    #12am-4:59pm                                       
   else
     'Good Evening'                     #5pm-4:59am
   end
  end
end
