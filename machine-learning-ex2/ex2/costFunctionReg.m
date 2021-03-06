function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta);
reg = 0;

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

  for i = 1:m,

    h = sigmoid(theta' * X(i, :)');
    J = J + (-y(i) * log(h) - (1 - y(i)) * log(1 - h));
   
  end;
  
  for k = 2:n,
    reg = reg + theta(k)^2;
  end; 

  J = (1 / m) * J + (lambda/(2*m)) * reg; 

  

  for q = 1:size(theta),
    der = 0;
    for i = 1:m,
      h = sigmoid(theta' * X(i, :)');
      der = der + ((h - y(i)) * X(i, q));
      
    end;
   
    if(q > 1),
      grad(q) = (1/m) * der + (lambda / m) * theta(q);
    else,
      grad(q) = (1/m) * der;
    end;
  end;



% =============================================================

end
