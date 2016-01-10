function mop = testmop( testname, dimension )
%Get test multi-objective problems from a given name.
%   The method get testing or benchmark problems for Multi-Objective
%   Optimization. The implemented problems included ZDT, OKA, KNO.
%   User get the corresponding test problem, which is an instance of class
%   mop, by passing the problem name and optional dimension parameters.

mop=struct('name',[],'od',[],'pd',[],'domain',[],'func',[]);
switch lower(testname)
%     case 'kno1'
%         mop=kno1(mop);
    case 'zdt1'
        mop=zdt1(mop, dimension);
    case 'zdt2'
        mop=zdt2(mop, dimension);
    case 'zdt3'
        mop=zdt3(mop, dimension);
    case 'zdt4'
        mop=zdt4(mop, dimension);
    case 'zdt6'
        mop=zdt6(mop, dimension);
    case 'dtlz1'
        mop=dtlz1(mop, dimension);
    otherwise 
        error('Undefined test problem name');                
end 
end

% %KNO1 function generator
% function p=kno1(p)
%  p.name='KNO1';
%  p.od = 2;
%  p.pd = 2;
%  p.domain= [0 3;0 3];
%  p.func = @evaluate;
%  
%     %KNO1 evaluation function.
%     function y = evaluate(x)
%       y=zeros(2,1);
% 	  c = x(1)+x(2);
% 	  f = 9-(3*sin(2.5*c^0.5) + 3*sin(4*c) + 5 *sin(2*c+2));
% 	  g = (pi/2.0)*(x(1)-x(2)+3.0)/6.0;
% 	  y(1)= 20-(f*cos(g));
% 	  y(2)= 20-(f*sin(g)); 
%     end
% end

%ZDT1 function generator
function p=zdt1(p,dim)
 p.name='ZDT1';
 p.pd=dim;
 p.od=2;
 p.domain=[zeros(dim,1) ones(dim,1)];
 p.func=@evaluate;
 
    %ZDT1 evaluation function.
    function y=evaluate(x)
        y=zeros(2,1);
        y(1) = x(1);
    	su = sum(x)-x(1);    
		g = 1 + 9 * su / (dim - 1);
		y(2) =g*(1 - sqrt(x(1) / g));
    end
end

function p=zdt2(p,dim)
p.name='ZDT2';
p.pd=dim;
p.od=2;
p.domain=[zeros(dim,1) ones(dim,1)];
p.func=@evaluate;
 
    %ZDT2 evaluation function.
    function y=evaluate(x)
        y=zeros(2,1);
        y(1) = x(1);
        su = sum(x)-x(1);
		g = 1 + 9 * su / (dim - 1);
		y(2) =g*(1 - (x(1)/g)^2);
    end
end

function p=zdt3(p,dim)
p.name='ZDT3';
p.pd=dim;
p.od=2;
p.domain=[zeros(dim,1) ones(dim,1)];
p.func=@evaluate;
 
    %ZDT3 evaluation function.
    function y=evaluate(x)
        y=zeros(2,1);
        y(1) = x(1);
    	su = sum(x)-x(1);    
		g = 1 + 9 * su / (dim - 1);
		y(2) =g*(1 - sqrt(x(1)/g)-(x(1)/g)*sin(10*pi*x(1)));
    end
end

function p=zdt4(p,dim)
p.name='ZDT4';
p.pd=dim;
p.od=2;
p.domain=[[0;-5;-5;-5;-5;-5;-5;-5;-5;-5] [1;5;5;5;5;5;5;5;5;5]];
p.func=@evaluate;
 
    %ZDT4 evaluation function.
    function y=evaluate(x)
        vg=x(2:10,:);
        y=zeros(2,1);
        su = sum(x)-x(1);
        y(1) = x(1);
		g = 1 + 9 *10+sum(vg.^2-10*cos(4*pi*vg));
		y(2) =g*(1-sqrt(x(1)/g));
    end
end

function p=zdt6(p,dim)
p.name='ZDT6';
p.pd=dim;
p.od=2;
p.domain=[zeros(dim,1) ones(dim,1)];
p.func=@evaluate;
 
    %ZDT6 evaluation function.
    function y=evaluate(x)
        vg=x(2:10,:);
        y=zeros(2,1);
        su = sum(x)-x(1);
		g = 1 + 9*(su/9)^0.25;
        y(1) = 1-(exp(-4*x(1)))*(sin(6*pi*x(1)))^6;
		y(2) =g*(1-(y(1)/g)^2);
    end
end

function p=dtlz1(p,dim)
p.name='DTLZ1';
p.pd=dim;
p.od=3;
p.domain=[zeros(dim,1) ones(dim,1)];
p.func=@evaluate;
 
    %ZDT6 evaluation function.
    function y=evaluate(x)
        vg=x(3:dim,:);
        y=zeros(3,1);   
		g = 100*(5+sum((vg-0.5).^2-cos(20*pi*(vg-0.5))));
        y(1) = 0.5*x(1)*x(2)*(1+g);
		y(2) = 0.5*x(1)*(1-x(2))*(1+g);
        y(3) = 0.5*(1-x(1))*(1+g);
    end
end

 