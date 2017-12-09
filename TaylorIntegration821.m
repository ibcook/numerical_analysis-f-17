function [t,x]=TaylorIntegration821(a,b,h,x0)
    t=a:h:b;
    x=zeros(size(t));
    x(1)=x0;
    for i=1:length(x)-1
        x1=x(i)+exp(t(i))+t(i)*x(i);
        x2=exp(t(i))+x(i)+(1+t(i))*x1;
        x3=2*x1+(1+t(i))*x2+exp(t(i));
        x4=3*x2+(1+t(i))*x3+exp(t(i));
        x(i+1)=x(i)+h*x1+h^2/2*x2+h^3/6*x3+ h^4/24*x4;
    end
end