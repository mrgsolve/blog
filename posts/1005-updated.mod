source: mrgsolve::mwrite
mrgsolve: 2.0.0.9001
format: yaml
version: 1.0
model: '1005'
prob:
- 1005 phase1 2 CMT like 1004 but diff. initial on V3
- Run
- file.show(system.file("nonmem", "1005", "1005.ctl", package = "mrgsolve"))
- for equivalent NONMEM control stream.
param:
  THETA1: 8.51
  THETA2: 22.79098949
  THETA3: 0.07143366
  THETA4: 3.47450589
  THETA5: 113.27671224
  THETA6: 1.02435433
  THETA7: 1.19211818
  SEX: 1.0
  WT: 70.0
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
plugin:
- autodec
- base
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
- $PLUGIN
- autodec
- ' '
- $PKMODEL
- advan = 4
- ncmt = 2
- ' '
- $PK
- CL = THETA(1)*exp(ETA(1))*THETA(6)**SEX*(WT/70)**THETA(7);
- V2 = THETA(2)*exp(ETA(2));
- KA = THETA(3)*exp(ETA(3));
- Q  = THETA(4);
- V3 = THETA(5);
- S2 = V2;
- ' '
- $ERROR
- F = CENT/S2;
- Y = F*(1+EPS(1)) + EPS(2);
- IPRED = F;
- ' '
