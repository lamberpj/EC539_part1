function [residual, g1, g2, g3] = km97_rep_PL_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(3, 1);
T26 = params(6)/(y(4)+params(1)-y(6)/params(4));
lhs =y(4);
rhs =y(6)/params(4)+y(3)-params(5);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =(1-params(6))*params(2)*y(1)+T26*(y(1)*(y(4)+params(3)*(1+x(it_, 1))+params(2)*params(1))-params(4)*y(2));
residual(2)= lhs-rhs;
lhs =y(5);
rhs =params(4)*y(2)+y(4)*(y(3)-y(1))+params(1)*(y(3)-params(2)*y(1))-y(1)*params(3)*(1+x(it_, 1));
residual(3)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(3, 7);

  %
  % Jacobian matrix
  %

T63 = (y(4)+params(1)-y(6)/params(4))*(y(4)+params(1)-y(6)/params(4));
  g1(1,3)=(-1);
  g1(1,4)=1;
  g1(1,6)=(-(1/params(4)));
  g1(2,1)=(-((1-params(6))*params(2)+T26*(y(4)+params(3)*(1+x(it_, 1))+params(2)*params(1))));
  g1(2,3)=1;
  g1(2,4)=(-((y(1)*(y(4)+params(3)*(1+x(it_, 1))+params(2)*params(1))-params(4)*y(2))*(-params(6))/T63+y(1)*T26));
  g1(2,6)=(-((y(1)*(y(4)+params(3)*(1+x(it_, 1))+params(2)*params(1))-params(4)*y(2))*(-(params(6)*(-(1/params(4)))))/T63));
  g1(2,2)=(-(T26*(-params(4))));
  g1(2,7)=(-(T26*y(1)*params(3)));
  g1(3,1)=(-((-y(4))+params(1)*(-params(2))-params(3)*(1+x(it_, 1))));
  g1(3,3)=(-(y(4)+params(1)));
  g1(3,4)=(-(y(3)-y(1)));
  g1(3,2)=(-params(4));
  g1(3,5)=1;
  g1(3,7)=y(1)*params(3);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],3,49);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],3,343);
end
end
end
end
