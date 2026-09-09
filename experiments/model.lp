\ Model lp_from_json
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x6f3c23206024947a
Minimize
  0.9 f[production1_transient1] + f[production2_transient1]
   + 1.1 f[production3_customer1] + 0.9 f[production4_transient2]
   + f[production5_transient2] + 1.1 f[production6_customer2]
Subject To
 fc[transient1]: f[production1_transient1] + f[production2_transient1]
   - f[transient1_customer1] - f[transient1_transient2] = 0
 fc[customer1]: - f[production3_customer1] - f[transient1_customer1]
   = -1.1
 fc[transient2]: f[production4_transient2] + f[production5_transient2]
   - f[transient2_customer2] + f[transient1_transient2] = 0
 fc[customer2]: - f[production6_customer2] - f[transient2_customer2]
   = -1.1
 f[production1_transient1]_outer_lin_approx_0: - p[production1]
   + p[transient1] <= 0
 f[production1_transient1]_outer_lin_approx_1:
   0.6666666666666666 f[production1_transient1] <= 0.1111111111111111
 f[production1_transient1]_outer_lin_approx_2:
   1.333333333333333 f[production1_transient1] <= 0.4444444444444444
 f[production1_transient1]_outer_lin_approx_3: 2 f[production1_transient1]
   <= 1
 f[production2_transient1]_outer_lin_approx_0: - p[production2]
   + p[transient1] <= 0
 f[production2_transient1]_outer_lin_approx_1:
   0.4714045207910317 f[production2_transient1] <= 0.0555555555555556
 f[production2_transient1]_outer_lin_approx_2:
   0.9428090415820635 f[production2_transient1] <= 0.2222222222222223
 f[production2_transient1]_outer_lin_approx_3:
   1.414213562373095 f[production2_transient1] <= 0.5
 f[production3_customer1]_outer_lin_approx_0: - p[production3]
   + p[customer1] <= 0
 f[production3_customer1]_outer_lin_approx_1:
   0.4714045207910317 f[production3_customer1] <= 0.0555555555555556
 f[production3_customer1]_outer_lin_approx_2:
   0.9428090415820635 f[production3_customer1] <= 0.2222222222222223
 f[production3_customer1]_outer_lin_approx_3:
   1.414213562373095 f[production3_customer1] <= 0.5
 f[transient1_customer1]_outer_lin_approx_0: - p[transient1] + p[customer1]
   <= 0
 f[transient1_customer1]_outer_lin_approx_1:
   0.4714045207910317 f[transient1_customer1] <= 0.0555555555555556
 f[transient1_customer1]_outer_lin_approx_2:
   0.9428090415820635 f[transient1_customer1] <= 0.2222222222222223
 f[transient1_customer1]_outer_lin_approx_3:
   1.414213562373095 f[transient1_customer1] <= 0.5
 f[production4_transient2]_outer_lin_approx_0: - p[production4]
   + p[transient2] <= 0
 f[production4_transient2]_outer_lin_approx_1:
   0.6666666666666666 f[production4_transient2] <= 0.1111111111111111
 f[production4_transient2]_outer_lin_approx_2:
   1.333333333333333 f[production4_transient2] <= 0.4444444444444444
 f[production4_transient2]_outer_lin_approx_3: 2 f[production4_transient2]
   <= 1
 f[production5_transient2]_outer_lin_approx_0: - p[production5]
   + p[transient2] <= 0
 f[production5_transient2]_outer_lin_approx_1:
   0.4714045207910317 f[production5_transient2] <= 0.0555555555555556
 f[production5_transient2]_outer_lin_approx_2:
   0.9428090415820635 f[production5_transient2] <= 0.2222222222222223
 f[production5_transient2]_outer_lin_approx_3:
   1.414213562373095 f[production5_transient2] <= 0.5
 f[production6_customer2]_outer_lin_approx_0: - p[production6]
   + p[customer2] <= 0
 f[production6_customer2]_outer_lin_approx_1:
   0.4714045207910317 f[production6_customer2] <= 0.0555555555555556
 f[production6_customer2]_outer_lin_approx_2:
   0.9428090415820635 f[production6_customer2] <= 0.2222222222222223
 f[production6_customer2]_outer_lin_approx_3:
   1.414213562373095 f[production6_customer2] <= 0.5
 f[transient2_customer2]_outer_lin_approx_0: - p[transient2] + p[customer2]
   <= 0
 f[transient2_customer2]_outer_lin_approx_1: - p[transient2] + p[customer2]
   + 0.4714045207910317 f[transient2_customer2] <= 0.0555555555555556
 f[transient2_customer2]_outer_lin_approx_2:
   0.9428090415820635 f[transient2_customer2] <= 0.2222222222222223
 f[transient2_customer2]_outer_lin_approx_3:
   1.414213562373095 f[transient2_customer2] <= 0.5
 f[transient1_transient2]_outer_lin_approx_0: - p[transient1]
   + p[transient2] <= 0
 f[transient1_transient2]_outer_lin_approx_1:
   0.4714045207910317 f[transient1_transient2] <= 0.0555555555555556
 f[transient1_transient2]_outer_lin_approx_2:
   0.9428090415820635 f[transient1_transient2] <= 0.2222222222222223
 f[transient1_transient2]_outer_lin_approx_3:
   1.414213562373095 f[transient1_transient2] <= 0.5
Bounds
 p[production1] <= 0.5
 p[production2] <= 0.5
 p[production3] <= 0.5
 p[production4] <= 0.5
 p[production5] <= 0.5
 p[production6] <= 0.5
 p[transient1] <= 0.5
 p[transient2] <= 0.5
 p[customer1] <= 0.5
 p[customer2] <= 0.5
 f[production1_transient1] <= 1
 f[production2_transient1] <= 0.7071067811865476
 f[production3_customer1] <= 0.7071067811865476
 f[transient1_customer1] <= 0.7071067811865476
 f[production4_transient2] <= 1
 f[production5_transient2] <= 0.7071067811865476
 f[production6_customer2] <= 0.7071067811865476
 f[transient2_customer2] <= 0.7071067811865476
 f[transient1_transient2] <= 0.7071067811865476
End
