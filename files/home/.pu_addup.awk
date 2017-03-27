BEGIN {
  split(columns,cols," ")
  for (i = 1; i <= length(cols); i++)
  if (!multiplier) { multiplier = 1.0 }
  if (!denominator) { denominator = 0 }
  coefficient = denominator ? 1/denominator : multiplier
  if (debug) { printf "cols[%d] = %d\n", i, cols[i] }
}
{
  for (i = 1; i <= length(cols); i++) {
    if (debug) { printf "line %d, column %d, value %d\n", NR, cols[i], $cols[i] }
    sum[i] += $cols[i]
    if ((NR == 1) && (sum[i] == 0)) { headers[i] = $cols[i]; }
  }
}
END {
  for (i = 1; i <= length(cols); i++) {
    if (headers[i]) { printf "%20f %s %s\n",  sum[i] * coefficient, (units ? units : ""), headers[i] }
    else { printf "Column %2d: %20d\n", cols[i], sum[i] }
  }
}
