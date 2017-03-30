BEGIN {
  split(columns,cols," ")
  for (i = 1; i < length(cols); i++)
  if (!multiplier) { multiplier = 1.0 }
  if (!units) { units = "" }
  if (!denominator) { denominator = 0 }
  coefficient = denominator ? 1/denominator : multiplier
  if (debug) { printf "cols[%d] = %d\n", i, cols[i] }
}
{
  if (debug) { printf "line %d\n", NR }
  for (i = 1; i <= length(cols); i++) {
    sum[i] += $cols[i]
    if ((NR == 1) && (sum[i] == 0)) { headers[i] = $cols[i]; }
    if (debug) {
      if (NR == 1 && headers[i]) {
        printf "    C[%d,%d] = %s\n", NR, cols[i], headers[i]
      } else {
        printf "    C[%d,%d] = %s\n", NR, cols[i], sum[i]
      }
    }
  }
}
END {
  for (i = 1; i <= length(cols); i++) {
    if (headers[i]) { printf "%20d %s   %s\n",  sum[i] * coefficient, units, headers[i] }
    else { printf "Column %2d: %20d\n", cols[i], sum[i] }
  }
}
