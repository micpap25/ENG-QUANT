\ Model lp_from_json_pre
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0xa1db673b3e5bfef0
Minimize
  0.9 f[production1_transient1] + f[production2_transient1]
   + 1.1 f[production3_customer1] + 0.9 f[production4_transient2]
   + f[production5_transient2] + 1.1 f[production6_customer2]
Subject To
 fc[transient1]: f[production1_transient1] + f[production2_transient1]
   + f[production3_customer1] - f[transient1_transient2] = 1.1
 fc[transient2]: f[production4_transient2] + f[production5_transient2]
   + f[production6_customer2] + f[transient1_transient2] = 1.1
 f[production1_transient1]_outer_lin_approx_1: p[transient1]
   + 0.6666666666666666 f[production1_transient1] <= 0.6111111111111112
 f[production1_transient1]_outer_lin_approx_2: p[transient1]
   + 1.333333333333333 f[production1_transient1] <= 0.9444444444444444
 f[production1_transient1]_outer_lin_approx_3: p[transient1]
   + 2 f[production1_transient1] <= 1.5
 f[production2_transient1]_outer_lin_approx_1: p[transient1]
   + 0.4714045207910317 f[production2_transient1] <= 0.5555555555555556
 f[production2_transient1]_outer_lin_approx_2: p[transient1]
   + 0.9428090415820635 f[production2_transient1] <= 0.7222222222222223
 f[production2_transient1]_outer_lin_approx_3: p[transient1]
   + 1.414213562373095 f[production2_transient1] <= 1
 f[transient1_customer1]_outer_lin_approx_1: - p[transient1]
   - 0.4714045207910317 f[production3_customer1] <= -0.4629894173145793
 f[transient1_customer1]_outer_lin_approx_2: - p[transient1]
   - 0.9428090415820635 f[production3_customer1] <= -0.8148677235180475
 f[transient1_customer1]_outer_lin_approx_3: - p[transient1]
   - 1.414213562373095 f[production3_customer1] <= -1.055634918610405
 f[production4_transient2]_outer_lin_approx_1: p[transient2]
   + 0.6666666666666666 f[production4_transient2] <= 0.6111111111111112
 f[production4_transient2]_outer_lin_approx_2: p[transient2]
   + 1.333333333333333 f[production4_transient2] <= 0.9444444444444444
 f[production4_transient2]_outer_lin_approx_3: p[transient2]
   + 2 f[production4_transient2] <= 1.5
 f[production5_transient2]_outer_lin_approx_1: p[transient2]
   + 0.4714045207910317 f[production5_transient2] <= 0.5555555555555556
 f[production5_transient2]_outer_lin_approx_2: p[transient2]
   + 0.9428090415820635 f[production5_transient2] <= 0.7222222222222223
 f[production5_transient2]_outer_lin_approx_3: p[transient2]
   + 1.414213562373095 f[production5_transient2] <= 1
 f[transient2_customer2]_outer_lin_approx_1: - p[transient2]
   - 0.4714045207910317 f[production6_customer2] <= -0.4629894173145793
 f[transient2_customer2]_outer_lin_approx_2: - p[transient2]
   - 0.9428090415820635 f[production6_customer2] <= -0.8148677235180475
 f[transient2_customer2]_outer_lin_approx_3: - p[transient2]
   - 1.414213562373095 f[production6_customer2] <= -1.055634918610405
 f[transient1_transient2]_outer_lin_approx_0: - p[transient1]
   + p[transient2] <= 0
 f[transient1_transient2]_outer_lin_approx_1: - p[transient1]
   + p[transient2] + 0.4714045207910317 f[transient1_transient2]
   <= 0.0555555555555556
 f[transient1_transient2]_outer_lin_approx_2: - p[transient1]
   + p[transient2] + 0.9428090415820635 f[transient1_transient2]
   <= 0.2222222222222223
 f[transient1_transient2]_outer_lin_approx_3: - p[transient1]
   + p[transient2] + 1.414213562373095 f[transient1_transient2] <= 0.5
Bounds
 0.1470528557945294 <= p[transient1] <= 0.5
 0.1470528557945294 <= p[transient2] <= 0.5
 f[production1_transient1] <= 0.7100416666666667
 f[production2_transient1] <= 0.7071067811865476
 0.3915003255946389 <= f[production3_customer1] <= 0.7071067811865476
 f[production4_transient2] <= 0.7100416666666667
 f[production5_transient2] <= 0.7071067811865476
 0.3915003255946389 <= f[production6_customer2] <= 0.7071067811865476
 f[transient1_transient2] <= 0.603915121716831
End
