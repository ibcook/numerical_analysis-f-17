%creates a table of values for 4 values of epsilon and 4 values of n for
%problem 7.5.1a
f=@(x) sqrt(x);
es=[.05,.001,10^-5, 10^-12];
ns=[1,2,8,10];
ints=[];
epss=[];
errs=[];
N=[];
for i=1:4
    for j=1:4
    [int,err]=adaptSimpson(0,1,es(i),ns(j),f);
    ints=[ints;int];
    errs=[errs;err];
    epss=[epss; es(i)];
    N=[N;ns(j)];
    end
end

T=table(ints,errs,epss,N,'VariableNames',{'NumericIntegral','ErrorBool','Epsilon','n'})
uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
    'RowName',T.Properties.RowNames);