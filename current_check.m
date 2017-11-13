function t=current_check(pos_matrix,current_pos)
t=-1;
for i=1:length(pos_matrix)
   if(pos_matrix(i)>=current_pos)
      t=pos_matrix(i); 
      break;
   end
    
end


end