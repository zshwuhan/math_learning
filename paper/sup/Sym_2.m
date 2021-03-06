n = 1;
m = 18;
A = randn(1, m);
sub = nchoosek(1:m, 2);
original = 0;
for i = 1:size(sub, 1)
  original = original + prod(A(sub(i, :)));
end

optimized = (60 * (sum((repmat(sum(A', 1), 1, m) .* A), 2)) + -60 * (sum((A .* A)', 1))) / 120;
normalization = sum(abs(original(:)));
assert(sum(abs(original(:) - optimized(:))) / normalization < 1e-10);