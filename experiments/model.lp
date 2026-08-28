\ Model lp_from_json
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x7fd21899bdc7297f
Minimize
  0.9 f[production1_transient1] + f[production2_transient1]
   + 1.1 f[production3_customer1] + 0.9 f[production4_transient2]
   + f[production5_transient2] + 1.1 f[production6_customer2]
   + 0.9 f[production7_transient3] + f[production8_transient3]
   + 1.1 f[production9_customer3] + 0.9 f[production10_transient4]
   + f[production11_transient4] + 1.1 f[production12_customer4]
   + 0.9 f[production13_transient5] + f[production14_transient5]
   + 1.1 f[production15_customer5] + 0.9 f[production16_transient6]
   + f[production17_transient6] + 1.1 f[production18_customer6]
   + 0.9 f[production19_transient7] + f[production20_transient7]
   + 1.1 f[production21_customer7] + 0.9 f[production22_transient8]
   + f[production23_transient8] + 1.1 f[production24_customer8]
   + 0.9 f[production25_transient9] + f[production26_transient9]
   + 1.1 f[production27_customer9] + 0.9 f[production28_transient10]
   + f[production29_transient10] + 1.1 f[production30_customer10]
Subject To
 fc[transient1]: f[production1_transient1] + f[production2_transient1]
   - f[transient1_customer1] - f[transient1_transient2] = 0
 fc[customer1]: - f[production3_customer1] - f[transient1_customer1]
   <= -1.1
 fc[transient2]: f[production4_transient2] + f[production5_transient2]
   - f[transient2_customer2] + f[transient1_transient2]
   - f[transient2_transient3] = 0
 fc[customer2]: - f[production6_customer2] - f[transient2_customer2]
   <= -1.1
 fc[transient3]: f[production7_transient3] + f[production8_transient3]
   - f[transient3_customer3] + f[transient2_transient3]
   - f[transient3_transient4] = 0
 fc[customer3]: - f[production9_customer3] - f[transient3_customer3]
   <= -1.1
 fc[transient4]: f[production10_transient4] + f[production11_transient4]
   - f[transient4_customer4] + f[transient3_transient4]
   - f[transient4_transient5] = 0
 fc[customer4]: - f[production12_customer4] - f[transient4_customer4]
   <= -1.1
 fc[transient5]: f[production13_transient5] + f[production14_transient5]
   - f[transient5_customer5] + f[transient4_transient5]
   - f[transient5_transient6] = 0
 fc[customer5]: - f[production15_customer5] - f[transient5_customer5]
   <= -1.1
 fc[transient6]: f[production16_transient6] + f[production17_transient6]
   - f[transient6_customer6] + f[transient5_transient6]
   - f[transient6_transient7] = 0
 fc[customer6]: - f[production18_customer6] - f[transient6_customer6]
   <= -1.1
 fc[transient7]: f[production19_transient7] + f[production20_transient7]
   - f[transient7_customer7] + f[transient6_transient7]
   - f[transient7_transient8] = 0
 fc[customer7]: - f[production21_customer7] - f[transient7_customer7]
   <= -1.1
 fc[transient8]: f[production22_transient8] + f[production23_transient8]
   - f[transient8_customer8] + f[transient7_transient8]
   - f[transient8_transient9] = 0
 fc[customer8]: - f[production24_customer8] - f[transient8_customer8]
   <= -1.1
 fc[transient9]: f[production25_transient9] + f[production26_transient9]
   - f[transient9_customer9] + f[transient8_transient9]
   - f[transient9_transient10] = 0
 fc[customer9]: - f[production27_customer9] - f[transient9_customer9]
   <= -1.1
 fc[transient10]: f[production28_transient10] + f[production29_transient10]
   - f[transient10_customer10] + f[transient9_transient10] = 0
 fc[customer10]: - f[production30_customer10] - f[transient10_customer10]
   <= -1.1
 f[production1_transient1]_outer_lin_approx_0: - p[production1]
   + p[transient1] + 0.6666666666666666 f[production1_transient1]
   <= 0.1111111111111111
 f[production1_transient1]_outer_lin_approx_1: - p[production1]
   + p[transient1] + 1.333333333333333 f[production1_transient1]
   <= 0.4444444444444444
 f[production1_transient1]_outer_lin_approx_2: - p[production1]
   + p[transient1] + 2 f[production1_transient1] <= 1
 f[production1_transient1]_outer_lin_approx_3: - p[production1]
   + p[transient1] + 0.75 f[production1_transient1] <= 0.140625
 f[production1_transient1]_outer_lin_approx_4: - p[production1]
   + p[transient1] + f[production1_transient1] <= 0.25
 f[production1_transient1]_outer_lin_approx_5: - p[production1]
   + p[transient1] + 1.020131507124624 f[production1_transient1]
   <= 0.2601670729570891
 f[production1_transient1]_outer_lin_approx_6: - p[production1]
   + p[transient1] + f[production1_transient1] <= 0.25
 f[production2_transient1]_outer_lin_approx_0: - p[production2]
   + p[transient1] + 0.4714045207910317 f[production2_transient1]
   <= 0.0555555555555556
 f[production2_transient1]_outer_lin_approx_1: - p[production2]
   + p[transient1] + 0.9428090415820635 f[production2_transient1]
   <= 0.2222222222222223
 f[production2_transient1]_outer_lin_approx_2: - p[production2]
   + p[transient1] + 1.414213562373095 f[production2_transient1] <= 0.5
 f[production2_transient1]_outer_lin_approx_3: - p[production2]
   + p[transient1] + 0.6642135623730954 f[production2_transient1]
   <= 0.1102949141100895
 f[production2_transient1]_outer_lin_approx_4: - p[production2]
   + p[transient1] + 0.2426406871192874 f[production2_transient1]
   <= 0.01471862576143
 f[production2_transient1]_outer_lin_approx_5: - p[production2]
   + p[transient1] <= 0
 f[production2_transient1]_outer_lin_approx_6: - p[production2]
   + p[transient1] + 0.0104076400856603 f[production2_transient1]
   <= 2.70797e-05
 f[production3_customer1]_outer_lin_approx_0: - p[production3]
   + p[customer1] + 0.4714045207910317 f[production3_customer1]
   <= 0.0555555555555556
 f[production3_customer1]_outer_lin_approx_1: - p[production3]
   + p[customer1] + 0.9428090415820635 f[production3_customer1]
   <= 0.2222222222222223
 f[production3_customer1]_outer_lin_approx_2: - p[production3]
   + p[customer1] + 1.414213562373095 f[production3_customer1] <= 0.5
 f[production3_customer1]_outer_lin_approx_3: - p[production3]
   + p[customer1] + 0.785786437626905 f[production3_customer1]
   <= 0.1543650813895955
 f[production3_customer1]_outer_lin_approx_4: - p[production3]
   + p[customer1] + 1.139339828220179 f[production3_customer1]
   <= 0.3245238110421965
 f[production3_customer1]_outer_lin_approx_5: - p[production3]
   + p[customer1] + 1.181134278804681 f[production3_customer1]
   <= 0.3487695461418633
 f[production3_customer1]_outer_lin_approx_6: - p[production3]
   + p[customer1] + 1.198265393319057 f[production3_customer1]
   <= 0.3589599882065188
 f[transient1_customer1]_outer_lin_approx_0: - p[transient1] + p[customer1]
   + 0.4714045207910317 f[transient1_customer1] <= 0.0555555555555556
 f[transient1_customer1]_outer_lin_approx_1: - p[transient1] + p[customer1]
   + 0.9428090415820635 f[transient1_customer1] <= 0.2222222222222223
 f[transient1_customer1]_outer_lin_approx_2: - p[transient1] + p[customer1]
   + 1.414213562373095 f[transient1_customer1] <= 0.5
 f[transient1_customer1]_outer_lin_approx_3: - p[transient1] + p[customer1]
   + 1.414213562373095 f[transient1_customer1] <= 0.5
 f[transient1_customer1]_outer_lin_approx_4: - p[transient1] + p[customer1]
   + 1.060660171779822 f[transient1_customer1] <= 0.28125
 f[transient1_customer1]_outer_lin_approx_5: - p[transient1] + p[customer1]
   + 1.018865721195319 f[transient1_customer1] <= 0.2595218394567146
 f[transient1_customer1]_outer_lin_approx_6: - p[transient1] + p[customer1]
   + 1.001734606680943 f[transient1_customer1] <= 0.2508680555555559
 f[production4_transient2]_outer_lin_approx_0: - p[production4]
   + p[transient2] + 0.6666666666666666 f[production4_transient2]
   <= 0.1111111111111111
 f[production4_transient2]_outer_lin_approx_1: - p[production4]
   + p[transient2] + 1.333333333333333 f[production4_transient2]
   <= 0.4444444444444444
 f[production4_transient2]_outer_lin_approx_2: - p[production4]
   + p[transient2] + 2 f[production4_transient2] <= 1
 f[production4_transient2]_outer_lin_approx_3: - p[production4]
   + p[transient2] + 0.75 f[production4_transient2] <= 0.140625
 f[production4_transient2]_outer_lin_approx_4: - p[production4]
   + p[transient2] + f[production4_transient2] <= 0.25
 f[production4_transient2]_outer_lin_approx_5: - p[production4]
   + p[transient2] + 1.020131507124623 f[production4_transient2]
   <= 0.2601670729570889
 f[production4_transient2]_outer_lin_approx_6: - p[production4]
   + p[transient2] + f[production4_transient2] <= 0.25
 f[production5_transient2]_outer_lin_approx_0: - p[production5]
   + p[transient2] + 0.4714045207910317 f[production5_transient2]
   <= 0.0555555555555556
 f[production5_transient2]_outer_lin_approx_1: - p[production5]
   + p[transient2] + 0.9428090415820635 f[production5_transient2]
   <= 0.2222222222222223
 f[production5_transient2]_outer_lin_approx_2: - p[production5]
   + p[transient2] + 1.414213562373095 f[production5_transient2] <= 0.5
 f[production5_transient2]_outer_lin_approx_3: - p[production5]
   + p[transient2] + 0.6642135623730954 f[production5_transient2]
   <= 0.1102949141100895
 f[production5_transient2]_outer_lin_approx_4: - p[production5]
   + p[transient2] <= 0
 f[production5_transient2]_outer_lin_approx_5: - p[production5]
   + p[transient2] <= 0
 f[production5_transient2]_outer_lin_approx_6: - p[production5]
   + p[transient2] <= 0
 f[production6_customer2]_outer_lin_approx_0: - p[production6]
   + p[customer2] + 0.4714045207910317 f[production6_customer2]
   <= 0.0555555555555556
 f[production6_customer2]_outer_lin_approx_1: - p[production6]
   + p[customer2] + 0.9428090415820635 f[production6_customer2]
   <= 0.2222222222222223
 f[production6_customer2]_outer_lin_approx_2: - p[production6]
   + p[customer2] + 1.414213562373095 f[production6_customer2] <= 0.5
 f[production6_customer2]_outer_lin_approx_3: - p[production6]
   + p[customer2] + 0.785786437626905 f[production6_customer2]
   <= 0.1543650813895955
 f[production6_customer2]_outer_lin_approx_4: - p[production6]
   + p[customer2] + 1.139339828220179 f[production6_customer2]
   <= 0.3245238110421965
 f[production6_customer2]_outer_lin_approx_5: - p[production6]
   + p[customer2] + 1.181134278804681 f[production6_customer2]
   <= 0.3487695461418632
 f[production6_customer2]_outer_lin_approx_6: - p[production6]
   + p[customer2] + 1.198265393319057 f[production6_customer2]
   <= 0.3589599882065188
 f[transient2_customer2]_outer_lin_approx_0: - p[transient2] + p[customer2]
   + 0.4714045207910317 f[transient2_customer2] <= 0.0555555555555556
 f[transient2_customer2]_outer_lin_approx_1: - p[transient2] + p[customer2]
   + 0.9428090415820635 f[transient2_customer2] <= 0.2222222222222223
 f[transient2_customer2]_outer_lin_approx_2: - p[transient2] + p[customer2]
   + 1.414213562373095 f[transient2_customer2] <= 0.5
 f[transient2_customer2]_outer_lin_approx_3: - p[transient2] + p[customer2]
   + 1.414213562373095 f[transient2_customer2] <= 0.5
 f[transient2_customer2]_outer_lin_approx_4: - p[transient2] + p[customer2]
   + 1.060660171779822 f[transient2_customer2] <= 0.28125
 f[transient2_customer2]_outer_lin_approx_5: - p[transient2] + p[customer2]
   + 1.01886572119532 f[transient2_customer2] <= 0.2595218394567147
 f[transient2_customer2]_outer_lin_approx_6: - p[transient2] + p[customer2]
   + 1.001734606680943 f[transient2_customer2] <= 0.2508680555555559
 f[transient1_transient2]_outer_lin_approx_0: - p[transient1]
   + p[transient2] + 0.4714045207910317 f[transient1_transient2]
   <= 0.0555555555555556
 f[transient1_transient2]_outer_lin_approx_1: - p[transient1]
   + p[transient2] + 0.9428090415820635 f[transient1_transient2]
   <= 0.2222222222222223
 f[transient1_transient2]_outer_lin_approx_2: - p[transient1]
   + p[transient2] + 1.414213562373095 f[transient1_transient2] <= 0.5
 f[transient1_transient2]_outer_lin_approx_3: - p[transient1]
   + p[transient2] <= 0
 f[transient1_transient2]_outer_lin_approx_4: - p[transient1]
   + p[transient2] + 0.1819805153394656 f[transient1_transient2]
   <= 0.00827922699080437
 f[transient1_transient2]_outer_lin_approx_5: - p[transient1]
   + p[transient2] + 0.00126578592930524 f[transient1_transient2]
   <= 4.00554e-07
 f[transient1_transient2]_outer_lin_approx_6: - p[transient1]
   + p[transient2] + 0.00867303340471692 f[transient1_transient2]
   <= 1.88054e-05
 f[production7_transient3]_outer_lin_approx_0: - p[production7]
   + p[transient3] + 0.6666666666666666 f[production7_transient3]
   <= 0.1111111111111111
 f[production7_transient3]_outer_lin_approx_1: - p[production7]
   + p[transient3] + 1.333333333333333 f[production7_transient3]
   <= 0.4444444444444444
 f[production7_transient3]_outer_lin_approx_2: - p[production7]
   + p[transient3] + 2 f[production7_transient3] <= 1
 f[production7_transient3]_outer_lin_approx_3: - p[production7]
   + p[transient3] + 0.75 f[production7_transient3] <= 0.140625
 f[production7_transient3]_outer_lin_approx_4: - p[production7]
   + p[transient3] + f[production7_transient3] <= 0.25
 f[production7_transient3]_outer_lin_approx_5: - p[production7]
   + p[transient3] + 1.020131507124623 f[production7_transient3]
   <= 0.2601670729570889
 f[production7_transient3]_outer_lin_approx_6: - p[production7]
   + p[transient3] + f[production7_transient3] <= 0.25
 f[production8_transient3]_outer_lin_approx_0: - p[production8]
   + p[transient3] + 0.4714045207910317 f[production8_transient3]
   <= 0.0555555555555556
 f[production8_transient3]_outer_lin_approx_1: - p[production8]
   + p[transient3] + 0.9428090415820635 f[production8_transient3]
   <= 0.2222222222222223
 f[production8_transient3]_outer_lin_approx_2: - p[production8]
   + p[transient3] + 1.414213562373095 f[production8_transient3] <= 0.5
 f[production8_transient3]_outer_lin_approx_3: - p[production8]
   + p[transient3] + 0.6642135623730954 f[production8_transient3]
   <= 0.1102949141100895
 f[production8_transient3]_outer_lin_approx_4: - p[production8]
   + p[transient3] <= 0
 f[production8_transient3]_outer_lin_approx_5: - p[production8]
   + p[transient3] <= 0
 f[production8_transient3]_outer_lin_approx_6: - p[production8]
   + p[transient3] <= 0
 f[production9_customer3]_outer_lin_approx_0: - p[production9]
   + p[customer3] + 0.4714045207910317 f[production9_customer3]
   <= 0.0555555555555556
 f[production9_customer3]_outer_lin_approx_1: - p[production9]
   + p[customer3] + 0.9428090415820635 f[production9_customer3]
   <= 0.2222222222222223
 f[production9_customer3]_outer_lin_approx_2: - p[production9]
   + p[customer3] + 1.414213562373095 f[production9_customer3] <= 0.5
 f[production9_customer3]_outer_lin_approx_3: - p[production9]
   + p[customer3] + 0.785786437626905 f[production9_customer3]
   <= 0.1543650813895955
 f[production9_customer3]_outer_lin_approx_4: - p[production9]
   + p[customer3] + 1.139339828220179 f[production9_customer3]
   <= 0.3245238110421965
 f[production9_customer3]_outer_lin_approx_5: - p[production9]
   + p[customer3] + 1.181134278804681 f[production9_customer3]
   <= 0.3487695461418632
 f[production9_customer3]_outer_lin_approx_6: - p[production9]
   + p[customer3] + 1.198265393319057 f[production9_customer3]
   <= 0.3589599882065188
 f[transient3_customer3]_outer_lin_approx_0: - p[transient3] + p[customer3]
   + 0.4714045207910317 f[transient3_customer3] <= 0.0555555555555556
 f[transient3_customer3]_outer_lin_approx_1: - p[transient3] + p[customer3]
   + 0.9428090415820635 f[transient3_customer3] <= 0.2222222222222223
 f[transient3_customer3]_outer_lin_approx_2: - p[transient3] + p[customer3]
   + 1.414213562373095 f[transient3_customer3] <= 0.5
 f[transient3_customer3]_outer_lin_approx_3: - p[transient3] + p[customer3]
   + 1.414213562373095 f[transient3_customer3] <= 0.5
 f[transient3_customer3]_outer_lin_approx_4: - p[transient3] + p[customer3]
   + 1.060660171779822 f[transient3_customer3] <= 0.28125
 f[transient3_customer3]_outer_lin_approx_5: - p[transient3] + p[customer3]
   + 1.01886572119532 f[transient3_customer3] <= 0.2595218394567147
 f[transient3_customer3]_outer_lin_approx_6: - p[transient3] + p[customer3]
   + 1.001734606680943 f[transient3_customer3] <= 0.2508680555555559
 f[transient2_transient3]_outer_lin_approx_0: - p[transient2]
   + p[transient3] + 0.4714045207910317 f[transient2_transient3]
   <= 0.0555555555555556
 f[transient2_transient3]_outer_lin_approx_1: - p[transient2]
   + p[transient3] + 0.9428090415820635 f[transient2_transient3]
   <= 0.2222222222222223
 f[transient2_transient3]_outer_lin_approx_2: - p[transient2]
   + p[transient3] + 1.414213562373095 f[transient2_transient3] <= 0.5
 f[transient2_transient3]_outer_lin_approx_3: - p[transient2]
   + p[transient3] <= 0
 f[transient2_transient3]_outer_lin_approx_4: - p[transient2]
   + p[transient3] + 0.1213203435596437 f[transient2_transient3]
   <= 0.0036796564403575
 f[transient2_transient3]_outer_lin_approx_5: - p[transient2]
   + p[transient3] + 0.00253157185861099 f[transient2_transient3]
   <= 1.60221e-06
 f[transient2_transient3]_outer_lin_approx_6: - p[transient2]
   + p[transient3] + 0.00693842672377354 f[transient2_transient3]
   <= 1.20354e-05
 f[production10_transient4]_outer_lin_approx_0: - p[production10]
   + p[transient4] + 0.6666666666666666 f[production10_transient4]
   <= 0.1111111111111111
 f[production10_transient4]_outer_lin_approx_1: - p[production10]
   + p[transient4] + 1.333333333333333 f[production10_transient4]
   <= 0.4444444444444444
 f[production10_transient4]_outer_lin_approx_2: - p[production10]
   + p[transient4] + 2 f[production10_transient4] <= 1
 f[production10_transient4]_outer_lin_approx_3: - p[production10]
   + p[transient4] + 0.75 f[production10_transient4] <= 0.140625
 f[production10_transient4]_outer_lin_approx_4: - p[production10]
   + p[transient4] + f[production10_transient4] <= 0.25
 f[production10_transient4]_outer_lin_approx_5: - p[production10]
   + p[transient4] + 1.020131507124623 f[production10_transient4]
   <= 0.2601670729570889
 f[production10_transient4]_outer_lin_approx_6: - p[production10]
   + p[transient4] + f[production10_transient4] <= 0.25
 f[production11_transient4]_outer_lin_approx_0: - p[production11]
   + p[transient4] + 0.4714045207910317 f[production11_transient4]
   <= 0.0555555555555556
 f[production11_transient4]_outer_lin_approx_1: - p[production11]
   + p[transient4] + 0.9428090415820635 f[production11_transient4]
   <= 0.2222222222222223
 f[production11_transient4]_outer_lin_approx_2: - p[production11]
   + p[transient4] + 1.414213562373095 f[production11_transient4] <= 0.5
 f[production11_transient4]_outer_lin_approx_3: - p[production11]
   + p[transient4] + 0.6642135623730954 f[production11_transient4]
   <= 0.1102949141100895
 f[production11_transient4]_outer_lin_approx_4: - p[production11]
   + p[transient4] <= 0
 f[production11_transient4]_outer_lin_approx_5: - p[production11]
   + p[transient4] <= 0
 f[production11_transient4]_outer_lin_approx_6: - p[production11]
   + p[transient4] <= 0
 f[production12_customer4]_outer_lin_approx_0: - p[production12]
   + p[customer4] + 0.4714045207910317 f[production12_customer4]
   <= 0.0555555555555556
 f[production12_customer4]_outer_lin_approx_1: - p[production12]
   + p[customer4] + 0.9428090415820635 f[production12_customer4]
   <= 0.2222222222222223
 f[production12_customer4]_outer_lin_approx_2: - p[production12]
   + p[customer4] + 1.414213562373095 f[production12_customer4] <= 0.5
 f[production12_customer4]_outer_lin_approx_3: - p[production12]
   + p[customer4] + 0.785786437626905 f[production12_customer4]
   <= 0.1543650813895955
 f[production12_customer4]_outer_lin_approx_4: - p[production12]
   + p[customer4] + 1.139339828220179 f[production12_customer4]
   <= 0.3245238110421965
 f[production12_customer4]_outer_lin_approx_5: - p[production12]
   + p[customer4] + 1.181134278804681 f[production12_customer4]
   <= 0.3487695461418632
 f[production12_customer4]_outer_lin_approx_6: - p[production12]
   + p[customer4] + 1.198265393319057 f[production12_customer4]
   <= 0.3589599882065188
 f[transient4_customer4]_outer_lin_approx_0: - p[transient4] + p[customer4]
   + 0.4714045207910317 f[transient4_customer4] <= 0.0555555555555556
 f[transient4_customer4]_outer_lin_approx_1: - p[transient4] + p[customer4]
   + 0.9428090415820635 f[transient4_customer4] <= 0.2222222222222223
 f[transient4_customer4]_outer_lin_approx_2: - p[transient4] + p[customer4]
   + 1.414213562373095 f[transient4_customer4] <= 0.5
 f[transient4_customer4]_outer_lin_approx_3: - p[transient4] + p[customer4]
   + 1.414213562373095 f[transient4_customer4] <= 0.5
 f[transient4_customer4]_outer_lin_approx_4: - p[transient4] + p[customer4]
   + 1.060660171779822 f[transient4_customer4] <= 0.28125
 f[transient4_customer4]_outer_lin_approx_5: - p[transient4] + p[customer4]
   + 1.01886572119532 f[transient4_customer4] <= 0.2595218394567147
 f[transient4_customer4]_outer_lin_approx_6: - p[transient4] + p[customer4]
   + 1.001734606680943 f[transient4_customer4] <= 0.2508680555555559
 f[transient3_transient4]_outer_lin_approx_0: - p[transient3]
   + p[transient4] + 0.4714045207910317 f[transient3_transient4]
   <= 0.0555555555555556
 f[transient3_transient4]_outer_lin_approx_1: - p[transient3]
   + p[transient4] + 0.9428090415820635 f[transient3_transient4]
   <= 0.2222222222222223
 f[transient3_transient4]_outer_lin_approx_2: - p[transient3]
   + p[transient4] + 1.414213562373095 f[transient3_transient4] <= 0.5
 f[transient3_transient4]_outer_lin_approx_3: - p[transient3]
   + p[transient4] <= 0
 f[transient3_transient4]_outer_lin_approx_4: - p[transient3]
   + p[transient4] + 0.0606601717798219 f[transient3_transient4]
   <= 9.1991411008937401e-04
 f[transient3_transient4]_outer_lin_approx_5: - p[transient3]
   + p[transient4] + 0.00379735778791544 f[transient3_transient4]
   <= 3.60498e-06
 f[transient3_transient4]_outer_lin_approx_6: - p[transient3]
   + p[transient4] + 0.00520382 f[transient3_transient4] <= 6.76994e-06
 f[production13_transient5]_outer_lin_approx_0: - p[production13]
   + p[transient5] + 0.6666666666666666 f[production13_transient5]
   <= 0.1111111111111111
 f[production13_transient5]_outer_lin_approx_1: - p[production13]
   + p[transient5] + 1.333333333333333 f[production13_transient5]
   <= 0.4444444444444444
 f[production13_transient5]_outer_lin_approx_2: - p[production13]
   + p[transient5] + 2 f[production13_transient5] <= 1
 f[production13_transient5]_outer_lin_approx_3: - p[production13]
   + p[transient5] + 0.75 f[production13_transient5] <= 0.140625
 f[production13_transient5]_outer_lin_approx_4: - p[production13]
   + p[transient5] + f[production13_transient5] <= 0.25
 f[production13_transient5]_outer_lin_approx_5: - p[production13]
   + p[transient5] + 1.020131507124623 f[production13_transient5]
   <= 0.2601670729570889
 f[production13_transient5]_outer_lin_approx_6: - p[production13]
   + p[transient5] + f[production13_transient5] <= 0.25
 f[production14_transient5]_outer_lin_approx_0: - p[production14]
   + p[transient5] + 0.4714045207910317 f[production14_transient5]
   <= 0.0555555555555556
 f[production14_transient5]_outer_lin_approx_1: - p[production14]
   + p[transient5] + 0.9428090415820635 f[production14_transient5]
   <= 0.2222222222222223
 f[production14_transient5]_outer_lin_approx_2: - p[production14]
   + p[transient5] + 1.414213562373095 f[production14_transient5] <= 0.5
 f[production14_transient5]_outer_lin_approx_3: - p[production14]
   + p[transient5] + 0.6642135623730954 f[production14_transient5]
   <= 0.1102949141100895
 f[production14_transient5]_outer_lin_approx_4: - p[production14]
   + p[transient5] + 0.0606601717798219 f[production14_transient5]
   <= 9.1991411008937401e-04
 f[production14_transient5]_outer_lin_approx_5: - p[production14]
   + p[transient5] <= 0
 f[production14_transient5]_outer_lin_approx_6: - p[production14]
   + p[transient5] <= 0
 f[production15_customer5]_outer_lin_approx_0: - p[production15]
   + p[customer5] + 0.4714045207910317 f[production15_customer5]
   <= 0.0555555555555556
 f[production15_customer5]_outer_lin_approx_1: - p[production15]
   + p[customer5] + 0.9428090415820635 f[production15_customer5]
   <= 0.2222222222222223
 f[production15_customer5]_outer_lin_approx_2: - p[production15]
   + p[customer5] + 1.414213562373095 f[production15_customer5] <= 0.5
 f[production15_customer5]_outer_lin_approx_3: - p[production15]
   + p[customer5] + 0.785786437626905 f[production15_customer5]
   <= 0.1543650813895955
 f[production15_customer5]_outer_lin_approx_4: - p[production15]
   + p[customer5] + 1.139339828220179 f[production15_customer5]
   <= 0.3245238110421965
 f[production15_customer5]_outer_lin_approx_5: - p[production15]
   + p[customer5] + 1.181134278804681 f[production15_customer5]
   <= 0.3487695461418632
 f[production15_customer5]_outer_lin_approx_6: - p[production15]
   + p[customer5] + 1.198265393319057 f[production15_customer5]
   <= 0.3589599882065188
 f[transient5_customer5]_outer_lin_approx_0: - p[transient5] + p[customer5]
   + 0.4714045207910317 f[transient5_customer5] <= 0.0555555555555556
 f[transient5_customer5]_outer_lin_approx_1: - p[transient5] + p[customer5]
   + 0.9428090415820635 f[transient5_customer5] <= 0.2222222222222223
 f[transient5_customer5]_outer_lin_approx_2: - p[transient5] + p[customer5]
   + 1.414213562373095 f[transient5_customer5] <= 0.5
 f[transient5_customer5]_outer_lin_approx_3: - p[transient5] + p[customer5]
   + 1.414213562373095 f[transient5_customer5] <= 0.5
 f[transient5_customer5]_outer_lin_approx_4: - p[transient5] + p[customer5]
   + 1.060660171779822 f[transient5_customer5] <= 0.28125
 f[transient5_customer5]_outer_lin_approx_5: - p[transient5] + p[customer5]
   + 1.01886572119532 f[transient5_customer5] <= 0.2595218394567147
 f[transient5_customer5]_outer_lin_approx_6: - p[transient5] + p[customer5]
   + 1.001734606680943 f[transient5_customer5] <= 0.2508680555555559
 f[transient4_transient5]_outer_lin_approx_0: - p[transient4]
   + p[transient5] + 0.4714045207910317 f[transient4_transient5]
   <= 0.0555555555555556
 f[transient4_transient5]_outer_lin_approx_1: - p[transient4]
   + p[transient5] + 0.9428090415820635 f[transient4_transient5]
   <= 0.2222222222222223
 f[transient4_transient5]_outer_lin_approx_2: - p[transient4]
   + p[transient5] + 1.414213562373095 f[transient4_transient5] <= 0.5
 f[transient4_transient5]_outer_lin_approx_3: - p[transient4]
   + p[transient5] <= 0
 f[transient4_transient5]_outer_lin_approx_4: - p[transient4]
   + p[transient5] <= 0
 f[transient4_transient5]_outer_lin_approx_5: - p[transient4]
   + p[transient5] + 0.00506314371721969 f[transient4_transient5]
   <= 6.40886e-06
 f[transient4_transient5]_outer_lin_approx_6: - p[transient4]
   + p[transient5] + 0.00346921336188677 f[transient4_transient5]
   <= 3.00886e-06
 f[production16_transient6]_outer_lin_approx_0: - p[production16]
   + p[transient6] + 0.6666666666666666 f[production16_transient6]
   <= 0.1111111111111111
 f[production16_transient6]_outer_lin_approx_1: - p[production16]
   + p[transient6] + 1.333333333333333 f[production16_transient6]
   <= 0.4444444444444444
 f[production16_transient6]_outer_lin_approx_2: - p[production16]
   + p[transient6] + 2 f[production16_transient6] <= 1
 f[production16_transient6]_outer_lin_approx_3: - p[production16]
   + p[transient6] + 0.75 f[production16_transient6] <= 0.140625
 f[production16_transient6]_outer_lin_approx_4: - p[production16]
   + p[transient6] + f[production16_transient6] <= 0.25
 f[production16_transient6]_outer_lin_approx_5: - p[production16]
   + p[transient6] + 1.020131507124623 f[production16_transient6]
   <= 0.2601670729570887
 f[production16_transient6]_outer_lin_approx_6: - p[production16]
   + p[transient6] + f[production16_transient6] <= 0.25
 f[production17_transient6]_outer_lin_approx_0: - p[production17]
   + p[transient6] + 0.4714045207910317 f[production17_transient6]
   <= 0.0555555555555556
 f[production17_transient6]_outer_lin_approx_1: - p[production17]
   + p[transient6] + 0.9428090415820635 f[production17_transient6]
   <= 0.2222222222222223
 f[production17_transient6]_outer_lin_approx_2: - p[production17]
   + p[transient6] + 1.414213562373095 f[production17_transient6] <= 0.5
 f[production17_transient6]_outer_lin_approx_3: - p[production17]
   + p[transient6] + 0.7071067811865471 f[production17_transient6]
   <= 0.125
 f[production17_transient6]_outer_lin_approx_4: - p[production17]
   + p[transient6] + 0.0606601717798219 f[production17_transient6]
   <= 9.1991411008937401e-04
 f[production17_transient6]_outer_lin_approx_5: - p[production17]
   + p[transient6] <= 0
 f[production17_transient6]_outer_lin_approx_6: - p[production17]
   + p[transient6] <= 0
 f[production18_customer6]_outer_lin_approx_0: - p[production18]
   + p[customer6] + 0.4714045207910317 f[production18_customer6]
   <= 0.0555555555555556
 f[production18_customer6]_outer_lin_approx_1: - p[production18]
   + p[customer6] + 0.9428090415820635 f[production18_customer6]
   <= 0.2222222222222223
 f[production18_customer6]_outer_lin_approx_2: - p[production18]
   + p[customer6] + 1.414213562373095 f[production18_customer6] <= 0.5
 f[production18_customer6]_outer_lin_approx_3: - p[production18]
   + p[customer6] + 0.785786437626905 f[production18_customer6]
   <= 0.1543650813895955
 f[production18_customer6]_outer_lin_approx_4: - p[production18]
   + p[customer6] + 1.139339828220179 f[production18_customer6]
   <= 0.3245238110421965
 f[production18_customer6]_outer_lin_approx_5: - p[production18]
   + p[customer6] + 1.181134278804681 f[production18_customer6]
   <= 0.3487695461418632
 f[production18_customer6]_outer_lin_approx_6: - p[production18]
   + p[customer6] + 1.198265393319057 f[production18_customer6]
   <= 0.3589599882065188
 f[transient6_customer6]_outer_lin_approx_0: - p[transient6] + p[customer6]
   + 0.4714045207910317 f[transient6_customer6] <= 0.0555555555555556
 f[transient6_customer6]_outer_lin_approx_1: - p[transient6] + p[customer6]
   + 0.9428090415820635 f[transient6_customer6] <= 0.2222222222222223
 f[transient6_customer6]_outer_lin_approx_2: - p[transient6] + p[customer6]
   + 1.414213562373095 f[transient6_customer6] <= 0.5
 f[transient6_customer6]_outer_lin_approx_3: - p[transient6] + p[customer6]
   + 1.414213562373095 f[transient6_customer6] <= 0.5
 f[transient6_customer6]_outer_lin_approx_4: - p[transient6] + p[customer6]
   + 1.060660171779822 f[transient6_customer6] <= 0.28125
 f[transient6_customer6]_outer_lin_approx_5: - p[transient6] + p[customer6]
   + 1.01886572119532 f[transient6_customer6] <= 0.2595218394567147
 f[transient6_customer6]_outer_lin_approx_6: - p[transient6] + p[customer6]
   + 1.001734606680943 f[transient6_customer6] <= 0.2508680555555559
 f[transient5_transient6]_outer_lin_approx_0: - p[transient5]
   + p[transient6] + 0.4714045207910317 f[transient5_transient6]
   <= 0.0555555555555556
 f[transient5_transient6]_outer_lin_approx_1: - p[transient5]
   + p[transient6] + 0.9428090415820635 f[transient5_transient6]
   <= 0.2222222222222223
 f[transient5_transient6]_outer_lin_approx_2: - p[transient5]
   + p[transient6] + 1.414213562373095 f[transient5_transient6] <= 0.5
 f[transient5_transient6]_outer_lin_approx_3: - p[transient5]
   + p[transient6] <= 0
 f[transient5_transient6]_outer_lin_approx_4: - p[transient5]
   + p[transient6] <= 0
 f[transient5_transient6]_outer_lin_approx_5: - p[transient5]
   + p[transient6] + 0.00632892964652398 f[transient5_transient6]
   <= 1.00138e-05
 f[transient5_transient6]_outer_lin_approx_6: - p[transient5]
   + p[transient6] + 0.00173460668094338 f[transient5_transient6]
   <= 7.52215e-07
 f[production19_transient7]_outer_lin_approx_0: - p[production19]
   + p[transient7] + 0.6666666666666666 f[production19_transient7]
   <= 0.1111111111111111
 f[production19_transient7]_outer_lin_approx_1: - p[production19]
   + p[transient7] + 1.333333333333333 f[production19_transient7]
   <= 0.4444444444444444
 f[production19_transient7]_outer_lin_approx_2: - p[production19]
   + p[transient7] + 2 f[production19_transient7] <= 1
 f[production19_transient7]_outer_lin_approx_3: - p[production19]
   + p[transient7] + 0.75 f[production19_transient7] <= 0.140625
 f[production19_transient7]_outer_lin_approx_4: - p[production19]
   + p[transient7] + f[production19_transient7] <= 0.25
 f[production19_transient7]_outer_lin_approx_5: - p[production19]
   + p[transient7] + 1.019339304040531 f[production19_transient7]
   <= 0.2597631541904584
 f[production19_transient7]_outer_lin_approx_6: - p[production19]
   + p[transient7] + f[production19_transient7] <= 0.25
 f[production20_transient7]_outer_lin_approx_0: - p[production20]
   + p[transient7] + 0.4714045207910317 f[production20_transient7]
   <= 0.0555555555555556
 f[production20_transient7]_outer_lin_approx_1: - p[production20]
   + p[transient7] + 0.9428090415820635 f[production20_transient7]
   <= 0.2222222222222223
 f[production20_transient7]_outer_lin_approx_2: - p[production20]
   + p[transient7] + 1.414213562373095 f[production20_transient7] <= 0.5
 f[production20_transient7]_outer_lin_approx_3: - p[production20]
   + p[transient7] + 0.7071067811865471 f[production20_transient7]
   <= 0.125
 f[production20_transient7]_outer_lin_approx_4: - p[production20]
   + p[transient7] + 0.0606601717798219 f[production20_transient7]
   <= 9.1991411008937401e-04
 f[production20_transient7]_outer_lin_approx_5: - p[production20]
   + p[transient7] <= 0
 f[production20_transient7]_outer_lin_approx_6: - p[production20]
   + p[transient7] + 0.00346921336188677 f[production20_transient7]
   <= 3.00886e-06
 f[production21_customer7]_outer_lin_approx_0: - p[production21]
   + p[customer7] + 0.4714045207910317 f[production21_customer7]
   <= 0.0555555555555556
 f[production21_customer7]_outer_lin_approx_1: - p[production21]
   + p[customer7] + 0.9428090415820635 f[production21_customer7]
   <= 0.2222222222222223
 f[production21_customer7]_outer_lin_approx_2: - p[production21]
   + p[customer7] + 1.414213562373095 f[production21_customer7] <= 0.5
 f[production21_customer7]_outer_lin_approx_3: - p[production21]
   + p[customer7] + 0.785786437626905 f[production21_customer7]
   <= 0.1543650813895955
 f[production21_customer7]_outer_lin_approx_4: - p[production21]
   + p[customer7] + 1.139339828220179 f[production21_customer7]
   <= 0.3245238110421965
 f[production21_customer7]_outer_lin_approx_5: - p[production21]
   + p[customer7] + 1.180504085110237 f[production21_customer7]
   <= 0.3483974737404895
 f[production21_customer7]_outer_lin_approx_6: - p[production21]
   + p[customer7] + 1.198265393319057 f[production21_customer7]
   <= 0.3589599882065188
 f[transient7_customer7]_outer_lin_approx_0: - p[transient7] + p[customer7]
   + 0.4714045207910317 f[transient7_customer7] <= 0.0555555555555556
 f[transient7_customer7]_outer_lin_approx_1: - p[transient7] + p[customer7]
   + 0.9428090415820635 f[transient7_customer7] <= 0.2222222222222223
 f[transient7_customer7]_outer_lin_approx_2: - p[transient7] + p[customer7]
   + 1.414213562373095 f[transient7_customer7] <= 0.5
 f[transient7_customer7]_outer_lin_approx_3: - p[transient7] + p[customer7]
   + 1.414213562373095 f[transient7_customer7] <= 0.5
 f[transient7_customer7]_outer_lin_approx_4: - p[transient7] + p[customer7]
   + 1.060660171779822 f[transient7_customer7] <= 0.28125
 f[transient7_customer7]_outer_lin_approx_5: - p[transient7] + p[customer7]
   + 1.019495914889763 f[transient7_customer7] <= 0.2598429801192288
 f[transient7_customer7]_outer_lin_approx_6: - p[transient7] + p[customer7]
   + 1.001734606680943 f[transient7_customer7] <= 0.2508680555555559
 f[transient6_transient7]_outer_lin_approx_0: - p[transient6]
   + p[transient7] + 0.4714045207910317 f[transient6_transient7]
   <= 0.0555555555555556
 f[transient6_transient7]_outer_lin_approx_1: - p[transient6]
   + p[transient7] + 0.9428090415820635 f[transient6_transient7]
   <= 0.2222222222222223
 f[transient6_transient7]_outer_lin_approx_2: - p[transient6]
   + p[transient7] + 1.414213562373095 f[transient6_transient7] <= 0.5
 f[transient6_transient7]_outer_lin_approx_3: - p[transient6]
   + p[transient7] + 0.0428932188134518 f[transient6_transient7]
   <= 0.000459957
 f[transient6_transient7]_outer_lin_approx_4: - p[transient6]
   + p[transient7] <= 0
 f[transient6_transient7]_outer_lin_approx_5: - p[transient6]
   + p[transient7] + 0.00759471557582754 f[transient6_transient7]
   <= 1.44199e-05
 f[transient6_transient7]_outer_lin_approx_6: - p[transient6]
   + p[transient7] <= 0
 f[production22_transient8]_outer_lin_approx_0: - p[production22]
   + p[transient8] + 0.6666666666666666 f[production22_transient8]
   <= 0.1111111111111111
 f[production22_transient8]_outer_lin_approx_1: - p[production22]
   + p[transient8] + 1.333333333333333 f[production22_transient8]
   <= 0.4444444444444444
 f[production22_transient8]_outer_lin_approx_2: - p[production22]
   + p[transient8] + 2 f[production22_transient8] <= 1
 f[production22_transient8]_outer_lin_approx_3: - p[production22]
   + p[transient8] + 0.75 f[production22_transient8] <= 0.140625
 f[production22_transient8]_outer_lin_approx_4: - p[production22]
   + p[transient8] + f[production22_transient8] <= 0.25
 f[production22_transient8]_outer_lin_approx_5: - p[production22]
   + p[transient8] + 1.015283880129642 f[production22_transient8]
   <= 0.2577003393127751
 f[production22_transient8]_outer_lin_approx_6: - p[production22]
   + p[transient8] + f[production22_transient8] <= 0.25
 f[production23_transient8]_outer_lin_approx_0: - p[production23]
   + p[transient8] + 0.4714045207910317 f[production23_transient8]
   <= 0.0555555555555556
 f[production23_transient8]_outer_lin_approx_1: - p[production23]
   + p[transient8] + 0.9428090415820635 f[production23_transient8]
   <= 0.2222222222222223
 f[production23_transient8]_outer_lin_approx_2: - p[production23]
   + p[transient8] + 1.414213562373095 f[production23_transient8] <= 0.5
 f[production23_transient8]_outer_lin_approx_3: - p[production23]
   + p[transient8] + 0.7071067811865471 f[production23_transient8]
   <= 0.125
 f[production23_transient8]_outer_lin_approx_4: - p[production23]
   + p[transient8] + 0.0606601717798219 f[production23_transient8]
   <= 9.1991411008937401e-04
 f[production23_transient8]_outer_lin_approx_5: - p[production23]
   + p[transient8] <= 0
 f[production23_transient8]_outer_lin_approx_6: - p[production23]
   + p[transient8] <= 0
 f[production24_customer8]_outer_lin_approx_0: - p[production24]
   + p[customer8] + 0.4714045207910317 f[production24_customer8]
   <= 0.0555555555555556
 f[production24_customer8]_outer_lin_approx_1: - p[production24]
   + p[customer8] + 0.9428090415820635 f[production24_customer8]
   <= 0.2222222222222223
 f[production24_customer8]_outer_lin_approx_2: - p[production24]
   + p[customer8] + 1.414213562373095 f[production24_customer8] <= 0.5
 f[production24_customer8]_outer_lin_approx_3: - p[production24]
   + p[customer8] + 0.785786437626905 f[production24_customer8]
   <= 0.1543650813895955
 f[production24_customer8]_outer_lin_approx_4: - p[production24]
   + p[customer8] + 1.139339828220179 f[production24_customer8]
   <= 0.3245238110421965
 f[production24_customer8]_outer_lin_approx_5: - p[production24]
   + p[customer8] + 1.177278015143764 f[production24_customer8]
   <= 0.3464958812352103
 f[production24_customer8]_outer_lin_approx_6: - p[production24]
   + p[customer8] + 1.198265393319057 f[production24_customer8]
   <= 0.3589599882065188
 f[transient8_customer8]_outer_lin_approx_0: - p[transient8] + p[customer8]
   + 0.4714045207910317 f[transient8_customer8] <= 0.0555555555555556
 f[transient8_customer8]_outer_lin_approx_1: - p[transient8] + p[customer8]
   + 0.9428090415820635 f[transient8_customer8] <= 0.2222222222222223
 f[transient8_customer8]_outer_lin_approx_2: - p[transient8] + p[customer8]
   + 1.414213562373095 f[transient8_customer8] <= 0.5
 f[transient8_customer8]_outer_lin_approx_3: - p[transient8] + p[customer8]
   + 1.414213562373095 f[transient8_customer8] <= 0.5
 f[transient8_customer8]_outer_lin_approx_4: - p[transient8] + p[customer8]
   + 1.060660171779822 f[transient8_customer8] <= 0.28125
 f[transient8_customer8]_outer_lin_approx_5: - p[transient8] + p[customer8]
   + 1.022721984856236 f[transient8_customer8] <= 0.2614900645770697
 f[transient8_customer8]_outer_lin_approx_6: - p[transient8] + p[customer8]
   + 1.001734606680943 f[transient8_customer8] <= 0.2508680555555559
 f[transient7_transient8]_outer_lin_approx_0: - p[transient7]
   + p[transient8] + 0.4714045207910317 f[transient7_transient8]
   <= 0.0555555555555556
 f[transient7_transient8]_outer_lin_approx_1: - p[transient7]
   + p[transient8] + 0.9428090415820635 f[transient7_transient8]
   <= 0.2222222222222223
 f[transient7_transient8]_outer_lin_approx_2: - p[transient7]
   + p[transient8] + 1.414213562373095 f[transient7_transient8] <= 0.5
 f[transient7_transient8]_outer_lin_approx_3: - p[transient7]
   + p[transient8] + 0.0857864376269035 f[transient7_transient8]
   <= 0.00183982822017865
 f[transient7_transient8]_outer_lin_approx_4: - p[transient7]
   + p[transient8] <= 0
 f[transient7_transient8]_outer_lin_approx_5: - p[transient7]
   + p[transient8] + 0.00743810472659464 f[transient7_transient8]
   <= 1.38314e-05
 f[transient7_transient8]_outer_lin_approx_6: - p[transient7]
   + p[transient8] + 0.00173460668094338 f[transient7_transient8]
   <= 7.52215e-07
 f[production25_transient9]_outer_lin_approx_0: - p[production25]
   + p[transient9] + 0.6666666666666666 f[production25_transient9]
   <= 0.1111111111111111
 f[production25_transient9]_outer_lin_approx_1: - p[production25]
   + p[transient9] + 1.333333333333333 f[production25_transient9]
   <= 0.4444444444444444
 f[production25_transient9]_outer_lin_approx_2: - p[production25]
   + p[transient9] + 2 f[production25_transient9] <= 1
 f[production25_transient9]_outer_lin_approx_3: - p[production25]
   + p[transient9] + 0.75 f[production25_transient9] <= 0.140625
 f[production25_transient9]_outer_lin_approx_4: - p[production25]
   + p[transient9] + f[production25_transient9] <= 0.25
 f[production25_transient9]_outer_lin_approx_5: - p[production25]
   + p[transient9] + 1.019426528364739 f[production25_transient9]
   <= 0.2598076116834461
 f[production25_transient9]_outer_lin_approx_6: - p[production25]
   + p[transient9] + f[production25_transient9] <= 0.25
 f[production26_transient9]_outer_lin_approx_0: - p[production26]
   + p[transient9] + 0.4714045207910317 f[production26_transient9]
   <= 0.0555555555555556
 f[production26_transient9]_outer_lin_approx_1: - p[production26]
   + p[transient9] + 0.9428090415820635 f[production26_transient9]
   <= 0.2222222222222223
 f[production26_transient9]_outer_lin_approx_2: - p[production26]
   + p[transient9] + 1.414213562373095 f[production26_transient9] <= 0.5
 f[production26_transient9]_outer_lin_approx_3: - p[production26]
   + p[transient9] + 0.7071067811865471 f[production26_transient9]
   <= 0.125
 f[production26_transient9]_outer_lin_approx_4: - p[production26]
   + p[transient9] + 0.1213203435596437 f[production26_transient9]
   <= 0.0036796564403575
 f[production26_transient9]_outer_lin_approx_5: - p[production26]
   + p[transient9] <= 0
 f[production26_transient9]_outer_lin_approx_6: - p[production26]
   + p[transient9] + 0.00173460668094316 f[production26_transient9]
   <= 7.52215e-07
 f[production27_customer9]_outer_lin_approx_0: - p[production27]
   + p[customer9] + 0.4714045207910317 f[production27_customer9]
   <= 0.0555555555555556
 f[production27_customer9]_outer_lin_approx_1: - p[production27]
   + p[customer9] + 0.9428090415820635 f[production27_customer9]
   <= 0.2222222222222223
 f[production27_customer9]_outer_lin_approx_2: - p[production27]
   + p[customer9] + 1.414213562373095 f[production27_customer9] <= 0.5
 f[production27_customer9]_outer_lin_approx_3: - p[production27]
   + p[customer9] + 0.785786437626905 f[production27_customer9]
   <= 0.1543650813895955
 f[production27_customer9]_outer_lin_approx_4: - p[production27]
   + p[customer9] + 1.139339828220179 f[production27_customer9]
   <= 0.3245238110421965
 f[production27_customer9]_outer_lin_approx_5: - p[production27]
   + p[customer9] + 1.180573471635261 f[production27_customer9]
   <= 0.3484384304822331
 f[production27_customer9]_outer_lin_approx_6: - p[production27]
   + p[customer9] + 1.198265393319057 f[production27_customer9]
   <= 0.3589599882065189
 f[transient9_customer9]_outer_lin_approx_0: - p[transient9] + p[customer9]
   + 0.4714045207910317 f[transient9_customer9] <= 0.0555555555555556
 f[transient9_customer9]_outer_lin_approx_1: - p[transient9] + p[customer9]
   + 0.9428090415820635 f[transient9_customer9] <= 0.2222222222222223
 f[transient9_customer9]_outer_lin_approx_2: - p[transient9] + p[customer9]
   + 1.414213562373095 f[transient9_customer9] <= 0.5
 f[transient9_customer9]_outer_lin_approx_3: - p[transient9] + p[customer9]
   + 1.414213562373095 f[transient9_customer9] <= 0.5
 f[transient9_customer9]_outer_lin_approx_4: - p[transient9] + p[customer9]
   + 1.060660171779822 f[transient9_customer9] <= 0.28125
 f[transient9_customer9]_outer_lin_approx_5: - p[transient9] + p[customer9]
   + 1.019426528364739 f[transient9_customer9] <= 0.2598076116834461
 f[transient9_customer9]_outer_lin_approx_6: - p[transient9] + p[customer9]
   + 1.001734606680943 f[transient9_customer9] <= 0.2508680555555557
 f[transient8_transient9]_outer_lin_approx_0: - p[transient8]
   + p[transient9] + 0.4714045207910317 f[transient8_transient9]
   <= 0.0555555555555556
 f[transient8_transient9]_outer_lin_approx_1: - p[transient8]
   + p[transient9] + 0.9428090415820635 f[transient8_transient9]
   <= 0.2222222222222223
 f[transient8_transient9]_outer_lin_approx_2: - p[transient8]
   + p[transient9] + 1.414213562373095 f[transient8_transient9] <= 0.5
 f[transient8_transient9]_outer_lin_approx_3: - p[transient8]
   + p[transient9] + 0.1286796564403553 f[transient8_transient9]
   <= 0.00413961349540197
 f[transient8_transient9]_outer_lin_approx_4: - p[transient8]
   + p[transient9] <= 0
 f[transient8_transient9]_outer_lin_approx_5: - p[transient8]
   + p[transient9] <= 0
 f[transient8_transient9]_outer_lin_approx_6: - p[transient8]
   + p[transient9] <= 0
 f[production28_transient10]_outer_lin_approx_0: - p[production28]
   + p[transient10] + 0.6666666666666666 f[production28_transient10]
   <= 0.1111111111111111
 f[production28_transient10]_outer_lin_approx_1: - p[production28]
   + p[transient10] + 1.333333333333333 f[production28_transient10]
   <= 0.4444444444444444
 f[production28_transient10]_outer_lin_approx_2: - p[production28]
   + p[transient10] + 2 f[production28_transient10] <= 1
 f[production28_transient10]_outer_lin_approx_3: - p[production28]
   + p[transient10] + 0.75 f[production28_transient10] <= 0.140625
 f[production28_transient10]_outer_lin_approx_4: - p[production28]
   + p[transient10] + f[production28_transient10] <= 0.25
 f[production28_transient10]_outer_lin_approx_5: - p[production28]
   + p[transient10] + 1.019426528364739 f[production28_transient10]
   <= 0.2598076116834461
 f[production28_transient10]_outer_lin_approx_6: - p[production28]
   + p[transient10] + f[production28_transient10] <= 0.25
 f[production29_transient10]_outer_lin_approx_0: - p[production29]
   + p[transient10] + 0.4714045207910317 f[production29_transient10]
   <= 0.0555555555555556
 f[production29_transient10]_outer_lin_approx_1: - p[production29]
   + p[transient10] + 0.9428090415820635 f[production29_transient10]
   <= 0.2222222222222223
 f[production29_transient10]_outer_lin_approx_2: - p[production29]
   + p[transient10] + 1.414213562373095 f[production29_transient10] <= 0.5
 f[production29_transient10]_outer_lin_approx_3: - p[production29]
   + p[transient10] + 0.4926406871192883 f[production29_transient10]
   <= 0.0606737116513411
 f[production29_transient10]_outer_lin_approx_4: - p[production29]
   + p[transient10] <= 0
 f[production29_transient10]_outer_lin_approx_5: - p[production29]
   + p[transient10] <= 0
 f[production29_transient10]_outer_lin_approx_6: - p[production29]
   + p[transient10] + 0.00173460668094338 f[production29_transient10]
   <= 7.52215e-07
 f[production30_customer10]_outer_lin_approx_0: - p[production30]
   + p[customer10] + 0.4714045207910317 f[production30_customer10]
   <= 0.0555555555555556
 f[production30_customer10]_outer_lin_approx_1: - p[production30]
   + p[customer10] + 0.9428090415820635 f[production30_customer10]
   <= 0.2222222222222223
 f[production30_customer10]_outer_lin_approx_2: - p[production30]
   + p[customer10] + 1.414213562373095 f[production30_customer10] <= 0.5
 f[production30_customer10]_outer_lin_approx_3: - p[production30]
   + p[customer10] + 0.785786437626905 f[production30_customer10]
   <= 0.1543650813895955
 f[production30_customer10]_outer_lin_approx_4: - p[production30]
   + p[customer10] + 1.139339828220179 f[production30_customer10]
   <= 0.3245238110421965
 f[production30_customer10]_outer_lin_approx_5: - p[production30]
   + p[customer10] + 1.180573471635261 f[production30_customer10]
   <= 0.3484384304822331
 f[production30_customer10]_outer_lin_approx_6: - p[production30]
   + p[customer10] + 1.198265393319057 f[production30_customer10]
   <= 0.3589599882065188
 f[transient10_customer10]_outer_lin_approx_0: - p[transient10]
   + p[customer10] + 0.4714045207910317 f[transient10_customer10]
   <= 0.0555555555555556
 f[transient10_customer10]_outer_lin_approx_1: - p[transient10]
   + p[customer10] + 0.9428090415820635 f[transient10_customer10]
   <= 0.2222222222222223
 f[transient10_customer10]_outer_lin_approx_2: - p[transient10]
   + p[customer10] + 1.414213562373095 f[transient10_customer10] <= 0.5
 f[transient10_customer10]_outer_lin_approx_3: - p[transient10]
   + p[customer10] + 1.414213562373095 f[transient10_customer10] <= 0.5
 f[transient10_customer10]_outer_lin_approx_4: - p[transient10]
   + p[customer10] + 1.060660171779822 f[transient10_customer10]
   <= 0.28125
 f[transient10_customer10]_outer_lin_approx_5: - p[transient10]
   + p[customer10] + 1.019426528364739 f[transient10_customer10]
   <= 0.2598076116834461
 f[transient10_customer10]_outer_lin_approx_6: - p[transient10]
   + p[customer10] + 1.001734606680943 f[transient10_customer10]
   <= 0.2508680555555559
 f[transient9_transient10]_outer_lin_approx_0: - p[transient9]
   + p[transient10] + 0.4714045207910317 f[transient9_transient10]
   <= 0.0555555555555556
 f[transient9_transient10]_outer_lin_approx_1: - p[transient9]
   + p[transient10] + 0.9428090415820635 f[transient9_transient10]
   <= 0.2222222222222223
 f[transient9_transient10]_outer_lin_approx_2: - p[transient9]
   + p[transient10] + 1.414213562373095 f[transient9_transient10] <= 0.5
 f[transient9_transient10]_outer_lin_approx_3: - p[transient9]
   + p[transient10] + 0.171572875253807 f[transient9_transient10]
   <= 0.00735931288071461
 f[transient9_transient10]_outer_lin_approx_4: - p[transient9]
   + p[transient10] + 0.0606601717798219 f[transient9_transient10]
   <= 9.1991411008937401e-04
 f[transient9_transient10]_outer_lin_approx_5: - p[transient9]
   + p[transient10] <= 0
 f[transient9_transient10]_outer_lin_approx_6: - p[transient9]
   + p[transient10] <= 0
Bounds
 p[production1] <= 0.5
 p[production2] <= 0.5
 p[production3] <= 0.5
 p[production4] <= 0.5
 p[production5] <= 0.5
 p[production6] <= 0.5
 p[production7] <= 0.5
 p[production8] <= 0.5
 p[production9] <= 0.5
 p[production10] <= 0.5
 p[production11] <= 0.5
 p[production12] <= 0.5
 p[production13] <= 0.5
 p[production14] <= 0.5
 p[production15] <= 0.5
 p[production16] <= 0.5
 p[production17] <= 0.5
 p[production18] <= 0.5
 p[production19] <= 0.5
 p[production20] <= 0.5
 p[production21] <= 0.5
 p[production22] <= 0.5
 p[production23] <= 0.5
 p[production24] <= 0.5
 p[production25] <= 0.5
 p[production26] <= 0.5
 p[production27] <= 0.5
 p[production28] <= 0.5
 p[production29] <= 0.5
 p[production30] <= 0.5
 p[transient1] <= 0.5
 p[transient2] <= 0.5
 p[transient3] <= 0.5
 p[transient4] <= 0.5
 p[transient5] <= 0.5
 p[transient6] <= 0.5
 p[transient7] <= 0.5
 p[transient8] <= 0.5
 p[transient9] <= 0.5
 p[transient10] <= 0.5
 p[customer1] <= 0.5
 p[customer2] <= 0.5
 p[customer3] <= 0.5
 p[customer4] <= 0.5
 p[customer5] <= 0.5
 p[customer6] <= 0.5
 p[customer7] <= 0.5
 p[customer8] <= 0.5
 p[customer9] <= 0.5
 p[customer10] <= 0.5
 f[production1_transient1] <= 1
 f[production2_transient1] <= 0.7071067811865476
 f[production3_customer1] <= 0.7071067811865476
 f[transient1_customer1] <= 0.7071067811865476
 f[production4_transient2] <= 1
 f[production5_transient2] <= 0.7071067811865476
 f[production6_customer2] <= 0.7071067811865476
 f[transient2_customer2] <= 0.7071067811865476
 f[transient1_transient2] <= 0.7071067811865476
 f[production7_transient3] <= 1
 f[production8_transient3] <= 0.7071067811865476
 f[production9_customer3] <= 0.7071067811865476
 f[transient3_customer3] <= 0.7071067811865476
 f[transient2_transient3] <= 0.7071067811865476
 f[production10_transient4] <= 1
 f[production11_transient4] <= 0.7071067811865476
 f[production12_customer4] <= 0.7071067811865476
 f[transient4_customer4] <= 0.7071067811865476
 f[transient3_transient4] <= 0.7071067811865476
 f[production13_transient5] <= 1
 f[production14_transient5] <= 0.7071067811865476
 f[production15_customer5] <= 0.7071067811865476
 f[transient5_customer5] <= 0.7071067811865476
 f[transient4_transient5] <= 0.7071067811865476
 f[production16_transient6] <= 1
 f[production17_transient6] <= 0.7071067811865476
 f[production18_customer6] <= 0.7071067811865476
 f[transient6_customer6] <= 0.7071067811865476
 f[transient5_transient6] <= 0.7071067811865476
 f[production19_transient7] <= 1
 f[production20_transient7] <= 0.7071067811865476
 f[production21_customer7] <= 0.7071067811865476
 f[transient7_customer7] <= 0.7071067811865476
 f[transient6_transient7] <= 0.7071067811865476
 f[production22_transient8] <= 1
 f[production23_transient8] <= 0.7071067811865476
 f[production24_customer8] <= 0.7071067811865476
 f[transient8_customer8] <= 0.7071067811865476
 f[transient7_transient8] <= 0.7071067811865476
 f[production25_transient9] <= 1
 f[production26_transient9] <= 0.7071067811865476
 f[production27_customer9] <= 0.7071067811865476
 f[transient9_customer9] <= 0.7071067811865476
 f[transient8_transient9] <= 0.7071067811865476
 f[production28_transient10] <= 1
 f[production29_transient10] <= 0.7071067811865476
 f[production30_customer10] <= 0.7071067811865476
 f[transient10_customer10] <= 0.7071067811865476
 f[transient9_transient10] <= 0.7071067811865476
End
