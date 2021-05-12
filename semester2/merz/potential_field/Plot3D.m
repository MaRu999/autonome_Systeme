%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright by Hans-Georg Beyer (HGB)
% For teaching use only! It is not allowed to use 
% this program without written permission of HGB 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
function Plot3D(fkt_name, xl, xu, yl, yu, n_pts)
% fkt_name: name (string) of function f(x,y) to be plotted
% xl: lower x-value, xu: upper x-value
% yl: lower y-value, yu: upper y-value
% n_pts+1: number of data points sampled in each direction
  z=zeros(n_pts+1,n_pts+1);
  x=(xl:(xu-xl)/n_pts:xu);
  y=(yl:(yu-yl)/n_pts:yu);
  for j=1:n_pts+1
    for i=1:n_pts+1
      z(i,j) = feval(fkt_name, x(j), y(i));
    end
  end
  mesh(x, y, z)
end
