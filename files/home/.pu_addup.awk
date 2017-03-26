BEGIN {
  split(columns,cols," ")
  for (i = 1; i <= length(cols); i++)
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
    if (headers[i]) { printf "%10.1f Mb %10s\n",  sum[i]/1024, headers[i] }
    else { printf "Column %2d: %20d\n", cols[i], sum[i] }
  }
}
