function [sum,err]= adaptSimpson(a,b,e,n,f)
    
    err=0;
    del=b-a; %length of interval
    sum=0; %initializes sum
    h=del/2; c=(a+b)/2; %initial subinterval length, initial midpoint
    k=1;
    fa=f(a); fb=f(b); fc=f(c);
    S=(fa+fc+fb)*h/3;
    v=[a,h,fa,fc,fb,S];
    while 1<=k && k<=n
        h=v(k,2)/2; %half length of subdivisions of current subinterval
        fy=f(v(k,1)+h); %function at left midpoint
        St=(v(k,3)+4*fy+v(k,4))*h/3; %Simpson on left
        fz=f(v(k,1)+3*h); %function at right midpoint
        Stt=(v(k,4)+4*fz+v(k,5))*h/3; %Simpson on Right
        if abs(St+Stt-v(k,6))<30*e*h/del %if local error tolerance is met
            sum=sum+St+Stt+(St+Stt-v(k,6))/15; %intervals considered small enough, adds to integral
            k=k-1; 
            if k<=0
                break %terminates, as a sufficiently accurate answer has been reached
            end
        else %otherwise subdivide and continue
            if k>=n
                disp('Cant reach desired precision in this few intervals'); %error message, 
                err=1;             %because the maximum number of subintervals has been exceeded
                break
            end
            fv=v(k,5); 
            v(k,:)=[v(k,1),h,v(k,3),fy,v(k,4),St];
            k=k+1;
            v(k,:)=[v(k-1,1)+2*h,h,v(k-1,5),fz,fv,Stt];
            %the preceeding lines prepare a new subdivision
        end
    end
    
    