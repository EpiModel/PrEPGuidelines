## Impact of CDC’s HIV Preexposure Prophylaxis Guidelines among Men Who Have Sex with Men in the United States

This repository holds the source to code to reproduce the analysis featured in our HIV transmission model among men who have sex with men, as described below. In that model, we investigated the epidemiological impact and efficiency of implementing HIV preexposure prophylaxis according to CDC's clinical practice guidelines.

<img src="https://github.com/statnet/PrEPGuidelines/raw/master/analysis/Fig1.jpg">

These models are written and executed in the R statistical software language. To run these files, it is necessary to first install our epidemic modeling software, [EpiModel](http://epimodel.org/), and our extension package specifically for modeling HIV transmission dynamics among MSM, [EpiModelHIV](http://github.com/statnet/EpiModelHIV).

In R:
```
install.packages("EpiModel")

# install devtools if necessary, install.packages("devtools")
devtools::install_github("statnet/tergmLite")
devtools::install_github("statnet/EpiModelHIV")
```

<img src="https://github.com/statnet/PrEPGuidelines/raw/master/analysis/Fig2.jpg">

## Citation

> Jenness SM, Goodreau SM, Rosenberg E, Beylerian EN, Hoover KW, Smith DK, Sullivan P. Impact of CDC’s HIV Preexposure Prophylaxis Guidelines among MSM in the United States. _Journal of Infectious Diseases._ 2016; 214(12): 1800--1807.

## Materials

* [Main Paper](http://jid.oxfordjournals.org/content/early/2016/07/12/infdis.jiw223.full)
* [Technical Appendix](http://jid.oxfordjournals.org/content/early/2016/07/12/infdis.jiw223/suppl/DC1)
* [Editorial Commentary by Dr. Jared Baeten](http://jid.oxfordjournals.org/content/early/2016/07/12/infdis.jiw224.full)
* [Web-Based Modeling Tool for Public Health Practice](https://prism.shinyapps.io/cdc-prep-guidelines)


<img src="https://github.com/statnet/PrEPGuidelines/raw/master/analysis/Fig3.jpg">

## Abstract

### Background
Preexposure prophylaxis (PrEP) is effective for preventing human immunodeficiency virus (HIV) infection among men who have sex with men (MSM) within trial settings. Population impact will depend on clinical indications for PrEP initiation, coverage levels, and drug adherence. No studies have estimated the impact of clinical practice guidelines for PrEP issued by the Centers for Disease Control and Prevention (CDC).

### Methods
Mathematical models of HIV transmission among MSM were used to estimate the percentage of infections averted (PIA) and the number needed to treat (NNT) under behavioral indications of the CDC’s PrEP guidelines. We modeled the contri- bution of these indications while varying treatment coverage and adherence.

### Results
At 40% coverage of indicated MSM over the next decade, application of CDC guidelines would avert 1162 infections per 100 000 person-years, 33.0% of expected infections. The predicted NNT for the guidelines would be 25. Increasing coverage and adherence jointly raise the PIA, but reductions to the NNT were associated with better adherence only.

### Conclusions
Implementation of CDC PrEP guidelines would result in strong and sustained reductions in HIV incidence among MSM in the United States. The guidelines strike a good balance between epidemiological impact (PIA) and efficiency (NNT) at plausible scale-up levels. Adherence counseling could maximize public health investment in PrEP by decreasing the NNT.
