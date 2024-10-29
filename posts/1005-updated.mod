source: mrgsolve::mwrite
mrgsolve: 1.5.2
format: yaml
version: 1.0
model: '1005'
prob:
- 1005 phase1 2 CMT like 1004 but diff. initial on V3
- Run
- file.show(system.file("nonmem", "1005", "1005.ctl", package = "mrgsolve"))
- for equivalent NONMEM control stream.
param:
  SEX: 1.0
  WT: 70.0
  THETA1: 8.51
  THETA2: 22.79098949
  THETA3: 0.07143366
  THETA4: 3.47450589
  THETA5: 113.27671224
  THETA6: 1.02435433
  THETA7: 1.19211818
init:
  GUT: 0.0
  CENT: 0.0
  PERIPH: 0.0
capture:
- CL
- Q
- V2
- V3
- KA
- ETA_1 = ETA(1)
- ETA_2 = ETA(2)
- ETA_3 = ETA(3)
- IPRED
omega:
  data:
    matrix1:
      row1: 0.21387884
      row2:
      - 0.1207702
      - 0.09451047
      row3:
      - -0.01162777
      - -0.03720637
      - 0.04656315
  labels:
    matrix1:
    - '.'
    - '.'
    - '.'
  names: '...'
sigma:
  data:
    matrix1:
      row1: 0.04917071
      row2:
      - 0.0
      - 0.20176885
  labels:
    matrix1:
    - '.'
    - '.'
  names: '...'
envir: []
plugin: base
update:
  start: 0.0
  end: 168.0
  delta: 1.0
  add: []
  atol: 1.0e-08
  rtol: 1.0e-05
  ss_atol: 1.0e-08
  ss_rtol: 0.0001
  maxsteps: 20000.0
  hmax: 0.0
  hmin: 0.0
  mxhnil: 2.0
  ixpr: 0.0
  mindt: 2.22044605e-15
  digits: -1.0
  tscale: 1.0
  outvars: IPRED
set: []
code:
- $PKMODEL
- depot = TRUE
- ncmt = 2
- ' '
- $PK
- double CL = THETA(1)*exp(ETA(1)) * pow(THETA(6),SEX) * pow(WT/70.0,THETA(7));
- double V2 = THETA(2)*exp(ETA(2));
- double KA = THETA(3)*exp(ETA(3));
- double Q  = THETA(4);
- double V3 = THETA(5);
- double S2 = V2;
- ' '
- $ERROR
- double F = CENT/S2;
- double Y = F*(1+EPS(1)) + EPS(2);
- double IPRED = F;
- ' '
