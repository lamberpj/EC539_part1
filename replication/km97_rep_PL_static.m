function [residual, g1, g2, g3] = km97_rep_PL_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 4, 1);

%
% Model equations
%

T24 = params(6)/(y(2)+params(1)-y(2)/params(4));
lhs =y(2);
rhs =y(2)/params(4)+y(1)-params(5);
residual(1)= lhs-rhs;
lhs =y(1);
rhs =y(1)*(1-params(6))*params(2)+T24*(y(1)*(y(2)+params(3)*(1+x(1))+params(2)*params(1))-params(4)*y(3));
residual(2)= lhs-rhs;
lhs =y(3);
rhs =params(4)*y(3)+params(1)*(y(1)-y(1)*params(2))-y(1)*params(3)*(1+x(1));
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(2)-y(2)/params(4);
residual(4)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(4, 4);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-1);
  g1(1,2)=1-1/params(4);
  g1(2,1)=1-((1-params(6))*params(2)+T24*(y(2)+params(3)*(1+x(1))+params(2)*params(1)));
  g1(2,2)=(-((y(1)*(y(2)+params(3)*(1+x(1))+params(2)*params(1))-params(4)*y(3))*(-(params(6)*(1-1/params(4))))/((y(2)+params(1)-y(2)/params(4))*(y(2)+params(1)-y(2)/params(4)))+y(1)*T24));
  g1(2,3)=(-(T24*(-params(4))));
  g1(3,1)=(-(params(1)*(1-params(2))-params(3)*(1+x(1))));
  g1(3,3)=1-params(4);
  g1(4,2)=(-(1-1/params(4)));
  g1(4,4)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],4,16);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],4,64);
end
end
end
end
