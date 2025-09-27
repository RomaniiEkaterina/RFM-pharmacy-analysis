select case when char_length(card) > 13 then 'Покупки без записи карты'
else 'Количество активных бонусных карт' end, count(distinct card)
from bonuscheques b 
group by char_length(card)
              

     
     
     
     
                                        
                                 
                             
            
     
   
