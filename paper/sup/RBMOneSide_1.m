n = 14;
m = 1;
A = randn(1, n);
nset = dec2bin(0:(2^(n) - 1));
original = 0;
for i = 1:size(nset, 1)
  v = logical(nset(i, :) - '0');
  original = original + (v * A') ^ 1;
end

optimized = 2^(n - 3) * (4 * (sum(A, 2)));
normalization = sum(abs(original(:)));
assert(sum(abs(original(:) - optimized(:))) / normalization < 1e-10);