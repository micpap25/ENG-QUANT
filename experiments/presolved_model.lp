\ Model lp_from_json_pre
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x43b871172f38d630
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
   + f[production3_customer1] - f[transient1_transient2] = 1.1
 fc[transient2]: f[production4_transient2] + f[production5_transient2]
   + f[production6_customer2] + f[transient1_transient2]
   - f[transient2_transient3] = 1.1
 fc[transient3]: f[production7_transient3] + f[production8_transient3]
   + f[production9_customer3] + f[transient2_transient3]
   - f[transient3_transient4] = 1.1
 fc[transient4]: f[production10_transient4] + f[production11_transient4]
   + f[production12_customer4] + f[transient3_transient4]
   - f[transient4_transient5] = 1.1
 fc[transient5]: f[production13_transient5] + f[production14_transient5]
   + f[production15_customer5] + f[transient4_transient5]
   - f[transient5_transient6] = 1.1
 fc[transient6]: f[production16_transient6] + f[production17_transient6]
   + f[production18_customer6] + f[transient5_transient6]
   - f[transient6_transient7] = 1.1
 fc[transient7]: f[production19_transient7] + f[production20_transient7]
   + f[production21_customer7] + f[transient6_transient7]
   - f[transient7_transient8] = 1.1
 fc[transient8]: f[production22_transient8] + f[production23_transient8]
   + f[production24_customer8] + f[transient7_transient8]
   - f[transient8_transient9] = 1.1
 fc[transient9]: f[production25_transient9] + f[production26_transient9]
   + f[production27_customer9] + f[transient8_transient9]
   - f[transient9_transient10] = 1.1
 fc[transient10]: f[production28_transient10] + f[production29_transient10]
   + f[production30_customer10] + f[transient9_transient10] = 1.1
 f[production1_transient1]_outer_lin_approx_0: p[transient1]
   + 0.6666666666666666 f[production1_transient1] <= 0.6111111111111112
 f[production1_transient1]_outer_lin_approx_1: p[transient1]
   + 1.333333333333333 f[production1_transient1] <= 0.9444444444444444
 f[production1_transient1]_outer_lin_approx_2: p[transient1]
   + 2 f[production1_transient1] <= 1.5
 f[production1_transient1]_outer_lin_approx_3: p[transient1]
   + 0.75 f[production1_transient1] <= 0.640625
 f[production1_transient1]_outer_lin_approx_5: p[transient1]
   + 1.020131507124624 f[production1_transient1] <= 0.7601670729570891
 f[production1_transient1]_outer_lin_approx_6: p[transient1]
   + f[production1_transient1] <= 0.75
 f[production2_transient1]_outer_lin_approx_0: p[transient1]
   + 0.4714045207910317 f[production2_transient1] <= 0.5555555555555556
 f[production2_transient1]_outer_lin_approx_1: p[transient1]
   + 0.9428090415820635 f[production2_transient1] <= 0.7222222222222223
 f[production2_transient1]_outer_lin_approx_2: p[transient1]
   + 1.414213562373095 f[production2_transient1] <= 1
 f[production2_transient1]_outer_lin_approx_3: p[transient1]
   + 0.6642135623730954 f[production2_transient1] <= 0.6102949141100895
 f[production2_transient1]_outer_lin_approx_4: p[transient1]
   + 0.2426406871192874 f[production2_transient1] <= 0.51471862576143
 f[production2_transient1]_outer_lin_approx_6: p[transient1]
   + 0.0104076400856603 f[production2_transient1] <= 0.5000270797430382
 f[transient1_customer1]_outer_lin_approx_0: - p[transient1]
   - 0.4714045207910317 f[production3_customer1] <= -0.4629894173145793
 f[transient1_customer1]_outer_lin_approx_1: - p[transient1]
   - 0.9428090415820635 f[production3_customer1] <= -0.8148677235180475
 f[transient1_customer1]_outer_lin_approx_2: - p[transient1]
   - 1.414213562373095 f[production3_customer1] <= -1.055634918610405
 f[transient1_customer1]_outer_lin_approx_4: - p[transient1]
   - 1.060660171779822 f[production3_customer1] <= -0.8854761889578038
 f[transient1_customer1]_outer_lin_approx_5: - p[transient1]
   - 1.018865721195319 f[production3_customer1] <= -0.8612304538581369
 f[transient1_customer1]_outer_lin_approx_6: - p[transient1]
   - 1.001734606680943 f[production3_customer1] <= -0.8510400117934815
 f[production4_transient2]_outer_lin_approx_0: p[transient2]
   + 0.6666666666666666 f[production4_transient2] <= 0.6111111111111112
 f[production4_transient2]_outer_lin_approx_1: p[transient2]
   + 1.333333333333333 f[production4_transient2] <= 0.9444444444444444
 f[production4_transient2]_outer_lin_approx_2: p[transient2]
   + 2 f[production4_transient2] <= 1.5
 f[production4_transient2]_outer_lin_approx_3: p[transient2]
   + 0.75 f[production4_transient2] <= 0.640625
 f[production4_transient2]_outer_lin_approx_5: p[transient2]
   + 1.020131507124623 f[production4_transient2] <= 0.7601670729570889
 f[production4_transient2]_outer_lin_approx_6: p[transient2]
   + f[production4_transient2] <= 0.75
 f[production5_transient2]_outer_lin_approx_0: p[transient2]
   + 0.4714045207910317 f[production5_transient2] <= 0.5555555555555556
 f[production5_transient2]_outer_lin_approx_1: p[transient2]
   + 0.9428090415820635 f[production5_transient2] <= 0.7222222222222223
 f[production5_transient2]_outer_lin_approx_2: p[transient2]
   + 1.414213562373095 f[production5_transient2] <= 1
 f[production5_transient2]_outer_lin_approx_3: p[transient2]
   + 0.6642135623730954 f[production5_transient2] <= 0.6102949141100895
 f[transient2_customer2]_outer_lin_approx_0: - p[transient2]
   - 0.4714045207910317 f[production6_customer2] <= -0.4629894173145793
 f[transient2_customer2]_outer_lin_approx_1: - p[transient2]
   - 0.9428090415820635 f[production6_customer2] <= -0.8148677235180475
 f[transient2_customer2]_outer_lin_approx_2: - p[transient2]
   - 1.414213562373095 f[production6_customer2] <= -1.055634918610405
 f[transient2_customer2]_outer_lin_approx_4: - p[transient2]
   - 1.060660171779822 f[production6_customer2] <= -0.8854761889578038
 f[transient2_customer2]_outer_lin_approx_5: - p[transient2]
   - 1.01886572119532 f[production6_customer2] <= -0.861230453858137
 f[transient2_customer2]_outer_lin_approx_6: - p[transient2]
   - 1.001734606680943 f[production6_customer2] <= -0.8510400117934815
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
 f[production7_transient3]_outer_lin_approx_0: p[transient3]
   + 0.6666666666666666 f[production7_transient3] <= 0.6111111111111112
 f[production7_transient3]_outer_lin_approx_1: p[transient3]
   + 1.333333333333333 f[production7_transient3] <= 0.9444444444444444
 f[production7_transient3]_outer_lin_approx_2: p[transient3]
   + 2 f[production7_transient3] <= 1.5
 f[production7_transient3]_outer_lin_approx_3: p[transient3]
   + 0.75 f[production7_transient3] <= 0.640625
 f[production7_transient3]_outer_lin_approx_5: p[transient3]
   + 1.020131507124623 f[production7_transient3] <= 0.7601670729570889
 f[production7_transient3]_outer_lin_approx_6: p[transient3]
   + f[production7_transient3] <= 0.75
 f[production8_transient3]_outer_lin_approx_0: p[transient3]
   + 0.4714045207910317 f[production8_transient3] <= 0.5555555555555556
 f[production8_transient3]_outer_lin_approx_1: p[transient3]
   + 0.9428090415820635 f[production8_transient3] <= 0.7222222222222223
 f[production8_transient3]_outer_lin_approx_2: p[transient3]
   + 1.414213562373095 f[production8_transient3] <= 1
 f[production8_transient3]_outer_lin_approx_3: p[transient3]
   + 0.6642135623730954 f[production8_transient3] <= 0.6102949141100895
 f[transient3_customer3]_outer_lin_approx_0: - p[transient3]
   - 0.4714045207910317 f[production9_customer3] <= -0.4629894173145793
 f[transient3_customer3]_outer_lin_approx_1: - p[transient3]
   - 0.9428090415820635 f[production9_customer3] <= -0.8148677235180475
 f[transient3_customer3]_outer_lin_approx_2: - p[transient3]
   - 1.414213562373095 f[production9_customer3] <= -1.055634918610405
 f[transient3_customer3]_outer_lin_approx_4: - p[transient3]
   - 1.060660171779822 f[production9_customer3] <= -0.8854761889578038
 f[transient3_customer3]_outer_lin_approx_5: - p[transient3]
   - 1.01886572119532 f[production9_customer3] <= -0.861230453858137
 f[transient3_customer3]_outer_lin_approx_6: - p[transient3]
   - 1.001734606680943 f[production9_customer3] <= -0.8510400117934815
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
 f[production10_transient4]_outer_lin_approx_0: p[transient4]
   + 0.6666666666666666 f[production10_transient4] <= 0.6111111111111112
 f[production10_transient4]_outer_lin_approx_1: p[transient4]
   + 1.333333333333333 f[production10_transient4] <= 0.9444444444444444
 f[production10_transient4]_outer_lin_approx_2: p[transient4]
   + 2 f[production10_transient4] <= 1.5
 f[production10_transient4]_outer_lin_approx_3: p[transient4]
   + 0.75 f[production10_transient4] <= 0.640625
 f[production10_transient4]_outer_lin_approx_5: p[transient4]
   + 1.020131507124623 f[production10_transient4] <= 0.7601670729570889
 f[production10_transient4]_outer_lin_approx_6: p[transient4]
   + f[production10_transient4] <= 0.75
 f[production11_transient4]_outer_lin_approx_0: p[transient4]
   + 0.4714045207910317 f[production11_transient4] <= 0.5555555555555556
 f[production11_transient4]_outer_lin_approx_1: p[transient4]
   + 0.9428090415820635 f[production11_transient4] <= 0.7222222222222223
 f[production11_transient4]_outer_lin_approx_2: p[transient4]
   + 1.414213562373095 f[production11_transient4] <= 1
 f[production11_transient4]_outer_lin_approx_3: p[transient4]
   + 0.6642135623730954 f[production11_transient4] <= 0.6102949141100895
 f[transient4_customer4]_outer_lin_approx_0: - p[transient4]
   - 0.4714045207910317 f[production12_customer4] <= -0.4629894173145793
 f[transient4_customer4]_outer_lin_approx_1: - p[transient4]
   - 0.9428090415820635 f[production12_customer4] <= -0.8148677235180475
 f[transient4_customer4]_outer_lin_approx_2: - p[transient4]
   - 1.414213562373095 f[production12_customer4] <= -1.055634918610405
 f[transient4_customer4]_outer_lin_approx_4: - p[transient4]
   - 1.060660171779822 f[production12_customer4] <= -0.8854761889578038
 f[transient4_customer4]_outer_lin_approx_5: - p[transient4]
   - 1.01886572119532 f[production12_customer4] <= -0.861230453858137
 f[transient4_customer4]_outer_lin_approx_6: - p[transient4]
   - 1.001734606680943 f[production12_customer4] <= -0.8510400117934815
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
 f[production13_transient5]_outer_lin_approx_0: p[transient5]
   + 0.6666666666666666 f[production13_transient5] <= 0.6111111111111112
 f[production13_transient5]_outer_lin_approx_1: p[transient5]
   + 1.333333333333333 f[production13_transient5] <= 0.9444444444444444
 f[production13_transient5]_outer_lin_approx_2: p[transient5]
   + 2 f[production13_transient5] <= 1.5
 f[production13_transient5]_outer_lin_approx_3: p[transient5]
   + 0.75 f[production13_transient5] <= 0.640625
 f[production13_transient5]_outer_lin_approx_5: p[transient5]
   + 1.020131507124623 f[production13_transient5] <= 0.7601670729570889
 f[production13_transient5]_outer_lin_approx_6: p[transient5]
   + f[production13_transient5] <= 0.75
 f[production14_transient5]_outer_lin_approx_0: p[transient5]
   + 0.4714045207910317 f[production14_transient5] <= 0.5555555555555556
 f[production14_transient5]_outer_lin_approx_1: p[transient5]
   + 0.9428090415820635 f[production14_transient5] <= 0.7222222222222223
 f[production14_transient5]_outer_lin_approx_2: p[transient5]
   + 1.414213562373095 f[production14_transient5] <= 1
 f[production14_transient5]_outer_lin_approx_3: p[transient5]
   + 0.6642135623730954 f[production14_transient5] <= 0.6102949141100895
 f[production14_transient5]_outer_lin_approx_4: p[transient5]
   + 0.0606601717798219 f[production14_transient5] <= 0.5009199141100894
 f[transient5_customer5]_outer_lin_approx_0: - p[transient5]
   - 0.4714045207910317 f[production15_customer5] <= -0.4629894173145793
 f[transient5_customer5]_outer_lin_approx_1: - p[transient5]
   - 0.9428090415820635 f[production15_customer5] <= -0.8148677235180475
 f[transient5_customer5]_outer_lin_approx_3: - p[transient5]
   - 1.414213562373095 f[production15_customer5] <= -1.055634918610405
 f[transient5_customer5]_outer_lin_approx_4: - p[transient5]
   - 1.060660171779822 f[production15_customer5] <= -0.8854761889578038
 f[transient5_customer5]_outer_lin_approx_5: - p[transient5]
   - 1.01886572119532 f[production15_customer5] <= -0.861230453858137
 f[transient5_customer5]_outer_lin_approx_6: - p[transient5]
   - 1.001734606680943 f[production15_customer5] <= -0.8510400117934815
 f[transient4_transient5]_outer_lin_approx_0: - p[transient4]
   + p[transient5] + 0.4714045207910317 f[transient4_transient5]
   <= 0.0555555555555556
 f[transient4_transient5]_outer_lin_approx_1: - p[transient4]
   + p[transient5] + 0.9428090415820635 f[transient4_transient5]
   <= 0.2222222222222223
 f[transient4_transient5]_outer_lin_approx_2: - p[transient4]
   + p[transient5] + 1.414213562373095 f[transient4_transient5] <= 0.5
 f[transient4_transient5]_outer_lin_approx_4: - p[transient4]
   + p[transient5] <= 0
 f[transient4_transient5]_outer_lin_approx_5: - p[transient4]
   + p[transient5] + 0.00506314371721969 f[transient4_transient5]
   <= 6.40886e-06
 f[transient4_transient5]_outer_lin_approx_6: - p[transient4]
   + p[transient5] + 0.00346921336188677 f[transient4_transient5]
   <= 3.00886e-06
 f[production16_transient6]_outer_lin_approx_0: p[transient6]
   + 0.6666666666666666 f[production16_transient6] <= 0.6111111111111112
 f[production16_transient6]_outer_lin_approx_1: p[transient6]
   + 1.333333333333333 f[production16_transient6] <= 0.9444444444444444
 f[production16_transient6]_outer_lin_approx_2: p[transient6]
   + 2 f[production16_transient6] <= 1.5
 f[production16_transient6]_outer_lin_approx_3: p[transient6]
   + 0.75 f[production16_transient6] <= 0.640625
 f[production16_transient6]_outer_lin_approx_5: p[transient6]
   + 1.020131507124623 f[production16_transient6] <= 0.7601670729570887
 f[production16_transient6]_outer_lin_approx_6: p[transient6]
   + f[production16_transient6] <= 0.75
 f[production17_transient6]_outer_lin_approx_0: p[transient6]
   + 0.4714045207910317 f[production17_transient6] <= 0.5555555555555556
 f[production17_transient6]_outer_lin_approx_1: p[transient6]
   + 0.9428090415820635 f[production17_transient6] <= 0.7222222222222223
 f[production17_transient6]_outer_lin_approx_2: p[transient6]
   + 1.414213562373095 f[production17_transient6] <= 1
 f[production17_transient6]_outer_lin_approx_3: p[transient6]
   + 0.7071067811865471 f[production17_transient6] <= 0.625
 f[production17_transient6]_outer_lin_approx_4: p[transient6]
   + 0.0606601717798219 f[production17_transient6] <= 0.5009199141100894
 f[transient6_customer6]_outer_lin_approx_0: - p[transient6]
   - 0.4714045207910317 f[production18_customer6] <= -0.4629894173145793
 f[transient6_customer6]_outer_lin_approx_1: - p[transient6]
   - 0.9428090415820635 f[production18_customer6] <= -0.8148677235180475
 f[transient6_customer6]_outer_lin_approx_2: - p[transient6]
   - 1.414213562373095 f[production18_customer6] <= -1.055634918610405
 f[transient6_customer6]_outer_lin_approx_4: - p[transient6]
   - 1.060660171779822 f[production18_customer6] <= -0.8854761889578038
 f[transient6_customer6]_outer_lin_approx_5: - p[transient6]
   - 1.01886572119532 f[production18_customer6] <= -0.861230453858137
 f[transient6_customer6]_outer_lin_approx_6: - p[transient6]
   - 1.001734606680943 f[production18_customer6] <= -0.8510400117934815
 f[transient5_transient6]_outer_lin_approx_0: - p[transient5]
   + p[transient6] + 0.4714045207910317 f[transient5_transient6]
   <= 0.0555555555555556
 f[transient5_transient6]_outer_lin_approx_1: - p[transient5]
   + p[transient6] + 0.9428090415820635 f[transient5_transient6]
   <= 0.2222222222222223
 f[transient5_transient6]_outer_lin_approx_2: - p[transient5]
   + p[transient6] + 1.414213562373095 f[transient5_transient6] <= 0.5
 f[transient5_transient6]_outer_lin_approx_4: - p[transient5]
   + p[transient6] <= 0
 f[transient5_transient6]_outer_lin_approx_5: - p[transient5]
   + p[transient6] + 0.00632892964652398 f[transient5_transient6]
   <= 1.00138e-05
 f[transient5_transient6]_outer_lin_approx_6: - p[transient5]
   + p[transient6] + 0.00173460668094338 f[transient5_transient6]
   <= 7.52215e-07
 f[production19_transient7]_outer_lin_approx_0: p[transient7]
   + 0.6666666666666666 f[production19_transient7] <= 0.6111111111111112
 f[production19_transient7]_outer_lin_approx_1: p[transient7]
   + 1.333333333333333 f[production19_transient7] <= 0.9444444444444444
 f[production19_transient7]_outer_lin_approx_2: p[transient7]
   + 2 f[production19_transient7] <= 1.5
 f[production19_transient7]_outer_lin_approx_3: p[transient7]
   + 0.75 f[production19_transient7] <= 0.640625
 f[production19_transient7]_outer_lin_approx_5: p[transient7]
   + 1.019339304040531 f[production19_transient7] <= 0.7597631541904584
 f[production19_transient7]_outer_lin_approx_6: p[transient7]
   + f[production19_transient7] <= 0.75
 f[production20_transient7]_outer_lin_approx_0: p[transient7]
   + 0.4714045207910317 f[production20_transient7] <= 0.5555555555555556
 f[production20_transient7]_outer_lin_approx_1: p[transient7]
   + 0.9428090415820635 f[production20_transient7] <= 0.7222222222222223
 f[production20_transient7]_outer_lin_approx_2: p[transient7]
   + 1.414213562373095 f[production20_transient7] <= 1
 f[production20_transient7]_outer_lin_approx_3: p[transient7]
   + 0.7071067811865471 f[production20_transient7] <= 0.625
 f[production20_transient7]_outer_lin_approx_4: p[transient7]
   + 0.0606601717798219 f[production20_transient7] <= 0.5009199141100894
 f[production20_transient7]_outer_lin_approx_6: p[transient7]
   + 0.00346921336188677 f[production20_transient7] <= 0.5000030088603375
 f[transient7_customer7]_outer_lin_approx_0: - p[transient7]
   - 0.4714045207910317 f[production21_customer7] <= -0.4629894173145793
 f[transient7_customer7]_outer_lin_approx_1: - p[transient7]
   - 0.9428090415820635 f[production21_customer7] <= -0.8148677235180475
 f[transient7_customer7]_outer_lin_approx_2: - p[transient7]
   - 1.414213562373095 f[production21_customer7] <= -1.055634918610405
 f[transient7_customer7]_outer_lin_approx_4: - p[transient7]
   - 1.060660171779822 f[production21_customer7] <= -0.8854761889578038
 f[transient7_customer7]_outer_lin_approx_5: - p[transient7]
   - 1.019495914889763 f[production21_customer7] <= -0.8616025262595106
 f[transient7_customer7]_outer_lin_approx_6: - p[transient7]
   - 1.001734606680943 f[production21_customer7] <= -0.8510400117934815
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
 f[production22_transient8]_outer_lin_approx_0: p[transient8]
   + 0.6666666666666666 f[production22_transient8] <= 0.6111111111111112
 f[production22_transient8]_outer_lin_approx_1: p[transient8]
   + 1.333333333333333 f[production22_transient8] <= 0.9444444444444444
 f[production22_transient8]_outer_lin_approx_2: p[transient8]
   + 2 f[production22_transient8] <= 1.5
 f[production22_transient8]_outer_lin_approx_3: p[transient8]
   + 0.75 f[production22_transient8] <= 0.640625
 f[production22_transient8]_outer_lin_approx_5: p[transient8]
   + 1.015283880129642 f[production22_transient8] <= 0.757700339312775
 f[production22_transient8]_outer_lin_approx_6: p[transient8]
   + f[production22_transient8] <= 0.75
 f[production23_transient8]_outer_lin_approx_0: p[transient8]
   + 0.4714045207910317 f[production23_transient8] <= 0.5555555555555556
 f[production23_transient8]_outer_lin_approx_1: p[transient8]
   + 0.9428090415820635 f[production23_transient8] <= 0.7222222222222223
 f[production23_transient8]_outer_lin_approx_2: p[transient8]
   + 1.414213562373095 f[production23_transient8] <= 1
 f[production23_transient8]_outer_lin_approx_3: p[transient8]
   + 0.7071067811865471 f[production23_transient8] <= 0.625
 f[production23_transient8]_outer_lin_approx_4: p[transient8]
   + 0.0606601717798219 f[production23_transient8] <= 0.5009199141100894
 f[transient8_customer8]_outer_lin_approx_0: - p[transient8]
   - 0.4714045207910317 f[production24_customer8] <= -0.4629894173145793
 f[transient8_customer8]_outer_lin_approx_1: - p[transient8]
   - 0.9428090415820635 f[production24_customer8] <= -0.8148677235180475
 f[transient8_customer8]_outer_lin_approx_2: - p[transient8]
   - 1.414213562373095 f[production24_customer8] <= -1.055634918610405
 f[transient8_customer8]_outer_lin_approx_4: - p[transient8]
   - 1.060660171779822 f[production24_customer8] <= -0.8854761889578038
 f[transient8_customer8]_outer_lin_approx_5: - p[transient8]
   - 1.022721984856236 f[production24_customer8] <= -0.8635041187647898
 f[transient8_customer8]_outer_lin_approx_6: - p[transient8]
   - 1.001734606680943 f[production24_customer8] <= -0.8510400117934815
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
 f[production25_transient9]_outer_lin_approx_0: p[transient9]
   + 0.6666666666666666 f[production25_transient9] <= 0.6111111111111112
 f[production25_transient9]_outer_lin_approx_1: p[transient9]
   + 1.333333333333333 f[production25_transient9] <= 0.9444444444444444
 f[production25_transient9]_outer_lin_approx_2: p[transient9]
   + 2 f[production25_transient9] <= 1.5
 f[production25_transient9]_outer_lin_approx_3: p[transient9]
   + 0.75 f[production25_transient9] <= 0.640625
 f[production25_transient9]_outer_lin_approx_5: p[transient9]
   + 1.019426528364739 f[production25_transient9] <= 0.7598076116834461
 f[production25_transient9]_outer_lin_approx_6: p[transient9]
   + f[production25_transient9] <= 0.75
 f[production26_transient9]_outer_lin_approx_0: p[transient9]
   + 0.4714045207910317 f[production26_transient9] <= 0.5555555555555556
 f[production26_transient9]_outer_lin_approx_1: p[transient9]
   + 0.9428090415820635 f[production26_transient9] <= 0.7222222222222223
 f[production26_transient9]_outer_lin_approx_2: p[transient9]
   + 1.414213562373095 f[production26_transient9] <= 1
 f[production26_transient9]_outer_lin_approx_3: p[transient9]
   + 0.7071067811865471 f[production26_transient9] <= 0.625
 f[production26_transient9]_outer_lin_approx_4: p[transient9]
   + 0.1213203435596437 f[production26_transient9] <= 0.5036796564403575
 f[production26_transient9]_outer_lin_approx_6: p[transient9]
   + 0.00173460668094316 f[production26_transient9] <= 0.5000007522150844
 f[transient9_customer9]_outer_lin_approx_0: - p[transient9]
   - 0.4714045207910317 f[production27_customer9] <= -0.4629894173145793
 f[transient9_customer9]_outer_lin_approx_1: - p[transient9]
   - 0.9428090415820635 f[production27_customer9] <= -0.8148677235180475
 f[transient9_customer9]_outer_lin_approx_2: - p[transient9]
   - 1.414213562373095 f[production27_customer9] <= -1.055634918610405
 f[transient9_customer9]_outer_lin_approx_4: - p[transient9]
   - 1.060660171779822 f[production27_customer9] <= -0.8854761889578038
 f[transient9_customer9]_outer_lin_approx_5: - p[transient9]
   - 1.019426528364739 f[production27_customer9] <= -0.8615615695177671
 f[transient9_customer9]_outer_lin_approx_6: - p[transient9]
   - 1.001734606680943 f[production27_customer9] <= -0.8510400117934813
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
 f[transient8_transient9]_outer_lin_approx_6: - p[transient8]
   + p[transient9] <= 0
 f[production28_transient10]_outer_lin_approx_0: p[transient10]
   + 0.6666666666666666 f[production28_transient10] <= 0.6111111111111112
 f[production28_transient10]_outer_lin_approx_1: p[transient10]
   + 1.333333333333333 f[production28_transient10] <= 0.9444444444444444
 f[production28_transient10]_outer_lin_approx_2: p[transient10]
   + 2 f[production28_transient10] <= 1.5
 f[production28_transient10]_outer_lin_approx_3: p[transient10]
   + 0.75 f[production28_transient10] <= 0.640625
 f[production28_transient10]_outer_lin_approx_5: p[transient10]
   + 1.019426528364739 f[production28_transient10] <= 0.7598076116834461
 f[production28_transient10]_outer_lin_approx_6: p[transient10]
   + f[production28_transient10] <= 0.75
 f[production29_transient10]_outer_lin_approx_0: p[transient10]
   + 0.4714045207910317 f[production29_transient10] <= 0.5555555555555556
 f[production29_transient10]_outer_lin_approx_1: p[transient10]
   + 0.9428090415820635 f[production29_transient10] <= 0.7222222222222223
 f[production29_transient10]_outer_lin_approx_2: p[transient10]
   + 1.414213562373095 f[production29_transient10] <= 1
 f[production29_transient10]_outer_lin_approx_3: p[transient10]
   + 0.4926406871192883 f[production29_transient10] <= 0.5606737116513412
 f[production29_transient10]_outer_lin_approx_6: p[transient10]
   + 0.00173460668094338 f[production29_transient10] <= 0.5000007522150844
 f[transient10_customer10]_outer_lin_approx_0: - p[transient10]
   - 0.4714045207910317 f[production30_customer10] <= -0.4629894173145793
 f[transient10_customer10]_outer_lin_approx_1: - p[transient10]
   - 0.9428090415820635 f[production30_customer10] <= -0.8148677235180475
 f[transient10_customer10]_outer_lin_approx_2: - p[transient10]
   - 1.414213562373095 f[production30_customer10] <= -1.055634918610405
 f[transient10_customer10]_outer_lin_approx_4: - p[transient10]
   - 1.060660171779822 f[production30_customer10] <= -0.8854761889578038
 f[transient10_customer10]_outer_lin_approx_5: - p[transient10]
   - 1.019426528364739 f[production30_customer10] <= -0.8615615695177671
 f[transient10_customer10]_outer_lin_approx_6: - p[transient10]
   - 1.001734606680943 f[production30_customer10] <= -0.8510400117934815
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
Bounds
 0.1470528557945294 <= p[transient1] <= 0.5
 0.1470528557945294 <= p[transient2] <= 0.5
 0.1470528557945294 <= p[transient3] <= 0.5
 0.1470528557945294 <= p[transient4] <= 0.5
 0.1470528557945294 <= p[transient5] <= 0.5
 0.1470528557945294 <= p[transient6] <= 0.5
 0.1470528557945294 <= p[transient7] <= 0.5
 0.1470528557945294 <= p[transient8] <= 0.5
 0.1470528557945294 <= p[transient9] <= 0.5
 0.1470528557945294 <= p[transient10] <= 0.5
 f[production1_transient1] <= 0.7100416666666667
 f[production2_transient1] <= 0.7071067811865476
 0.3915003255946389 <= f[production3_customer1] <= 0.7071067811865476
 f[production4_transient2] <= 0.7100416666666667
 f[production5_transient2] <= 0.7071067811865476
 0.3915003255946389 <= f[production6_customer2] <= 0.7071067811865476
 f[transient1_transient2] <= 0.603915121716831
 f[production7_transient3] <= 0.7100416666666667
 f[production8_transient3] <= 0.7071067811865476
 0.3915003255946389 <= f[production9_customer3] <= 0.7071067811865476
 f[transient2_transient3] <= 0.603915121716831
 f[production10_transient4] <= 0.7100416666666667
 f[production11_transient4] <= 0.7071067811865476
 0.3915003255946389 <= f[production12_customer4] <= 0.7071067811865476
 f[transient3_transient4] <= 0.603915121716831
 f[production13_transient5] <= 0.7100416666666667
 f[production14_transient5] <= 0.7071067811865476
 0.3915003255946389 <= f[production15_customer5] <= 0.7071067811865476
 f[transient4_transient5] <= 0.603915121716831
 f[production16_transient6] <= 0.7100416666666667
 f[production17_transient6] <= 0.7071067811865476
 0.3915003255946389 <= f[production18_customer6] <= 0.7071067811865476
 f[transient5_transient6] <= 0.603915121716831
 f[production19_transient7] <= 0.7100416666666667
 f[production20_transient7] <= 0.7071067811865476
 0.3915003255946389 <= f[production21_customer7] <= 0.7071067811865476
 f[transient6_transient7] <= 0.603915121716831
 f[production22_transient8] <= 0.7100416666666667
 f[production23_transient8] <= 0.7071067811865476
 0.3915003255946389 <= f[production24_customer8] <= 0.7071067811865476
 f[transient7_transient8] <= 0.603915121716831
 f[production25_transient9] <= 0.7100416666666667
 f[production26_transient9] <= 0.7071067811865476
 0.3915003255946389 <= f[production27_customer9] <= 0.7071067811865476
 f[transient8_transient9] <= 0.603915121716831
 f[production28_transient10] <= 0.7100416666666667
 f[production29_transient10] <= 0.7071067811865476
 0.3915003255946389 <= f[production30_customer10] <= 0.7071067811865476
 f[transient9_transient10] <= 0.603915121716831
End
