function c=bisection(f,a,b)
if f(a)*f(b)>0  %checks if interval and function are compatible
    c='Intermediate Value Theorem does not guarantee a root in this interval. Try again';
elseif f(a)==0 %determines if the user is inattentive
    c=a;
elseif f(b)==0  %determines if the user is inattentive
    c=b;
else %starts the actual algorithm
    while (b-a)>2^-22
        c=(a+b)/2;
        if f(a)*f(c)<0 %If there are two roots, I favor the lesser one
            b=c;
        elseif f(c)*f(b)<0
            a=c;
        else
            break
        end
    end
end
end