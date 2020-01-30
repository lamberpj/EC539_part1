%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'km97_rep_PL';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('km97_rep_PL.log');
M_.exo_names = 'epsilon';
M_.exo_names_tex = 'epsilon';
M_.exo_names_long = 'epsilon';
M_.endo_names = 'k';
M_.endo_names_tex = 'k';
M_.endo_names_long = 'k';
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'b');
M_.endo_names_tex = char(M_.endo_names_tex, 'b');
M_.endo_names_long = char(M_.endo_names_long, 'b');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names_long = char(M_.endo_names_long, 'u');
M_.endo_partitions = struct();
M_.param_names = 'phi';
M_.param_names_tex = 'phi';
M_.param_names_long = 'phi';
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names_long = char(M_.param_names_long, 'lambda');
M_.param_names = char(M_.param_names, 'a');
M_.param_names_tex = char(M_.param_names_tex, 'a');
M_.param_names_long = char(M_.param_names_long, 'a');
M_.param_names = char(M_.param_names, 'R');
M_.param_names_tex = char(M_.param_names_tex, 'R');
M_.param_names_long = char(M_.param_names_long, 'R');
M_.param_names = char(M_.param_names, 'v');
M_.param_names_tex = char(M_.param_names_tex, 'v');
M_.param_names_long = char(M_.param_names_long, 'v');
M_.param_names = char(M_.param_names, 'pai');
M_.param_names_tex = char(M_.param_names_tex, 'pai');
M_.param_names_long = char(M_.param_names_long, 'pai');
M_.param_names = char(M_.param_names, 'kss');
M_.param_names_tex = char(M_.param_names_tex, 'kss');
M_.param_names_long = char(M_.param_names_long, 'kss');
M_.param_names = char(M_.param_names, 'qss');
M_.param_names_tex = char(M_.param_names_tex, 'qss');
M_.param_names_long = char(M_.param_names_long, 'qss');
M_.param_names = char(M_.param_names, 'bss');
M_.param_names_tex = char(M_.param_names_tex, 'bss');
M_.param_names_long = char(M_.param_names_long, 'bss');
M_.param_names = char(M_.param_names, 'uss');
M_.param_names_tex = char(M_.param_names_tex, 'uss');
M_.param_names_long = char(M_.param_names_long, 'uss');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 4;
M_.param_nbr = 10;
M_.orig_endo_nbr = 4;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('km97_rep_PL_static');
erase_compiled_function('km97_rep_PL_dynamic');
M_.orig_eq_nbr = 4;
M_.eq_nbr = 4;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 1 3 0;
 0 4 7;
 2 5 0;
 0 6 0;]';
M_.nstatic = 1;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 1;
M_.nspred   = 2;
M_.ndynamic   = 3;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(4, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(10, 1);
M_.NNZDerivatives = [18; 0; -1];
M_.params( 3 ) = 1;
a = M_.params( 3 );
M_.params( 4 ) = 1.01;
R = M_.params( 4 );
M_.params( 5 ) = 2;
v = M_.params( 5 );
M_.params( 6 ) = 0.1;
pai = M_.params( 6 );
M_.params( 1 ) = 20;
phi = M_.params( 1 );
M_.params( 2 ) = .975;
lambda = M_.params( 2 );
M_.params( 8 ) = M_.params(4)/(M_.params(4)-1)*(M_.params(6)*M_.params(3)-(1-M_.params(2))*(1-M_.params(4)+M_.params(4)*M_.params(6))*M_.params(1))/((1-M_.params(2))*(1-M_.params(4)+M_.params(4)*M_.params(6))+M_.params(6)*M_.params(2));
qss = M_.params( 8 );
M_.params( 7 ) = (M_.params(4)-1)*M_.params(8)/M_.params(4)+M_.params(5);
kss = M_.params( 7 );
M_.params( 9 ) = (M_.params(3)+M_.params(2)*M_.params(1)-M_.params(1))/(M_.params(4)-1)*M_.params(7);
bss = M_.params( 9 );
M_.params( 10 ) = (M_.params(4)-1)*M_.params(8)/M_.params(4);
uss = M_.params( 10 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = M_.params(8);
oo_.steady_state( 3 ) = M_.params(9);
oo_.steady_state( 1 ) = M_.params(7);
oo_.steady_state( 4 ) = M_.params(10);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
resid;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:1,'value',0.01) ];
M_.exo_det_length = 0;
options_.periods = 600;
perfect_foresight_setup;
perfect_foresight_solver;
figure
plot(k(1:30)/kss),hold on,plot(b(1:30)/bss,'r')
hold on,plot(q(1:30)/qss,'g')
hold on,plot(u(1:30)/uss,'m')
legend('k = K_{t}/K*','b = B_{t}/B*','q = q_{t}/q*','u = u_{t} / u*')
title('Figure 1: (based on Figure 3, p238, KM97)')
figure
subplot(221),plot(k(1:30)),title('k = K_{t}')
subplot(222),plot(b(1:30)),title('b = B_{t}')
subplot(223),plot(q(1:30)),title('q = q_{t}')
subplot(224),plot(u(1:30)),title('u = u_{t}')
sgtitle('Figure 2: In levels (i.e. not normalised by SS values) ')
figure
plot(k(1:100)/kss),hold on,plot(b(1:100)/bss,'r')
hold on,plot(q(1:100)/qss,'g')
hold on,plot(u(1:100)/uss,'m')
legend('k = K_{t}/K*','b = B_{t}/B*','q = q_{t}/q*','u = u_{t} / u*')
title('Figure 3: Longer time horizon / Return to SS')
save('km97_rep_PL_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('km97_rep_PL_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('km97_rep_PL_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('km97_rep_PL_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('km97_rep_PL_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('km97_rep_PL_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('km97_rep_PL_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
