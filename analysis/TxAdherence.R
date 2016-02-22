
## Calculate treatment adherence parameters for models

# Starting values = iPrEx
props <- c(0.5, 0.25, 0.25)
hr <-    1 - c(0.0, 0.25, 0.92)

sum(props * hr)

## Liu model

# overall with original weighting
props <- c(0.15, 0.15, 0.70)
sum(props * hr)

# With Grant Lancet HR numbers

hr <- c(1, 0.69, 0.19, 0.05)

# by Race

props.white <- c(0.0887 + 0.0169, 0.0249, 0.0394, 0.8301)
sum(props.white * hr)

props.black <- c(0.28 + 0.0363, 0.1144, 0.1604, 0.4089)
sum(props.black * hr)

props.adjusted <- (props.white + props.black) / 2
round(props.adjusted, 3)
sum(props.adjusted * hr)

