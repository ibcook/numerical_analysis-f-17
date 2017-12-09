function [t,x]=TaylorIntegration826(a,b,h,x0)
    t=a:h:b;
    x=zeros(size(t));
    x(1)=x0;
    for i=1:length(x)-1
        x1=(t(i)+x(i))/(t(i)-x(i));
        x2=2*(t(i)*x1-x(i))/(t(i)-x(i))^2;
        x3=2/(t(i)-x(i))^3*(t(i)^2*x2+t(i)*(2*(x1-1)*x1-x(i)*x2)-2*x(i)*(x1-1));
        x4=2/(t(i)-x(i))^6*((x3+t(i)*x2)*(t(i)-x(i))+(t(i)*x3)*(1-x1)+2*(t(i)*x2)*(1-x1)-2*(t(i)*x1-x(i))*x3-x3*(t(i)-x(i)));
        x(i+1)=x(i)+h*x1+h^2/2*x2+h^3/6*x3+ h^4/24*x4;
        
    end
end