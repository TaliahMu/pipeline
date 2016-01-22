%{
pre.Settings (lookup) # Settings for the NMF algorithm
name                   : varchar(200) # unique name for the configuration
-----
p=2                    : int          # initial order of autoregressive system (p = 0 no dynamics, p=1 just decay, p = 2, both rise and decay)
merge_thr=.8           : double       # merging threshold
max_iter=2             : int          # maximum number of iterations
tau = 4                : double       # std of gaussian kernel (size of neuron)
fudge_factor=0.98      : double       # bias correction for AR coefficients
temporal_iter=2        : int          # number of block-coordinate descent steps
deconv_method          : varchar(100) # activity deconvolution method
search_method          : varchar(100) # param for updating spatial components
dist                   : int          # param for updating spatial components
density                : double       # neurons per slice per mm^2
se                     : int          # morphological element for dilation passed to strel
%}

classdef Settings < dj.Relvar
    methods
        function prepare(self)
            key = struct(...
                'name', 'epnev_demo', ...
                'search_method','ellipse','dist',3,...
                'deconv_method','constrained_foopsi',...
                'temporal_iter',2,...
                'fudge_factor',0.98,...
                'merge_thr',0.8,...
                'p', 2, ...
                'max_iter', 2, ...
                'density', 400, ...
                'se', 4 ...
                );
            insert(self, key)

            key = struct(...
                'name', 'epnev_recommend', ...
                'search_method','ellipse','dist',3,...
                'deconv_method','constrained_foopsi',...
                'temporal_iter',2,...
                'fudge_factor',0.98,...
                'merge_thr',0.9,...
                'p', 2, ...
                'max_iter', 2, ...
                'density', 400, ...
                'se', 3 ... 
                );
            insert(self, key)
        end
        
    end
    
end