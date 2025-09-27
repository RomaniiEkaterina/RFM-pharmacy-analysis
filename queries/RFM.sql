                                         
    with data as( 
     select distinct(card) as card,
     '2022-06-10' - max(datetime::date) as recency,
     count(datetime) as frequency,
     sum(sum(summ_with_disc)) over (order by sum(summ_with_disc) desc)/sum(sum(summ_with_disc))over() as monetary
     from bonuscheques
     group by card
     having char_length(card) < 14
             ),
                          RFM as (select 
                          case when  recency < 15 then '3' 
                          when  recency < 61 then '2' 
                          when  recency >= 61  then '1' end as recency,
                          case when frequency > 12 then '3' 
                          when frequency > 6 then '2' 
                          when frequency <7 then '1' end as frequency,
                          case when monetary <= 0.65 then '3' 
                          when monetary <= 0.9 then '2' 
                          when monetary >0.9 then '1' end as monetary
                          from data
                      )
                                             select  recency,  frequency,  monetary,  count (*)
                                             from rfm 
                                             group by recency,  frequency,   monetary
                                             order by monetary desc, Recency desc, frequency desc
                                                                            
                                             
                                             
                                             

     
     
     
                                        
                                 
                             
            
     
   

