function [p,l,u] = factor(a)
u = a;  %Initially making u equal to given matrix.
k = length(a);  %determing the dimension of matrix.
l = eye(k,k);    %Initially defining l and p as identity matrices. 
p = eye(k,k);   
temp= zeros(k,k); %temporary matrix for matrix manipulation. 
for i= 1:k    %loop for k rows.
        [m,n] = max(abs(u(i:k,i))); %finding the absolute maximum value in column below the pivot value. 
        temp(n+i-1,:) = u(n+i-1,:);  %exchange of row with pivot value to the row with largest value using temporary matrix.
        u(n+i-1,:) = u(i,:);
        u(i,:) = temp(n+i-1,:);
        
        temp(n+i-1,:) = p(n+i-1,:);  %exchange of rows in indentity matrix using temporary matrix.
        p(n+i-1,:) = p(i,:);
        p(i,:) = temp(n+i-1,:);
        
        l(i:k,i) = u(i:k,i)./u(i,i); %dividing the pivot column by pivot value and equating it coloum of l matrix.
        if(i>1)
            for t = 1:i-1   %exchange of values in pivot column with respect to exchange of the rows using temporary matrix.    
                temp(i,t) =  l(i,t);
                l(i,t)= l(n+i-1,t);
                l(n+i-1,t) = temp(i,t);
            end
        end    
             
        if i ~= k
            if u(i+1,i)~=0  % condition to check if the value below pivot is not equal to zero from before.
                for (j= i+1:k)
                    u(j,:) = u(j,:) - (u(j,i)./u(i,i)) .* u(i,:);  % Making the value below pivot equal to zero by row operation. 
                end
            end   
        end   
end  
l(k,k) = 1;  %since the first loop runs only till k-1,the last value of l is assigned to one.
end