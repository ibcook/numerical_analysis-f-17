function [coef, xnode, error, pol]=NewtonInterp(f,a,b,n)
    %f will be a function handle, [a,b] the interval on which we
    %interpolate, and n the number of nodes
    xnode=linspace(a,b,n+1);
    coef=zeros(1,n+1);
    for i=1:n+1
        coef(i)=f(xnode(i));
    end
    
    for j=2:n+1
        for i=n+1:-1:j+1
            coef(i)=(coef(i)-coef(i-1))/(xnode(i)-xnode(i-j));
        end
    end
    
    xcomp=linspace(a,b,30);
    pol=zeros(size(xcomp));
    
   for k=1:30
    for i=1:n+1
            linprod=1;
            for j=1:i
                linprod=linprod*(xcomp(k)-xnode(j));
            end
            pol(k)=pol(k)+coef(i)*linprod;
     end
   end
    error=f(xcomp)-pol;
   
end
    
            