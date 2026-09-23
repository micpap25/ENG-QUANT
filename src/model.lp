\ Model lp_from_json
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x7378c6ee3ae9de0e
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
   = -1.1
 fc[transient2]: f[production4_transient2] + f[production5_transient2]
   - f[transient2_customer2] + f[transient1_transient2]
   - f[transient2_transient3] = 0
 fc[customer2]: - f[production6_customer2] - f[transient2_customer2]
   = -1.1
 fc[transient3]: f[production7_transient3] + f[production8_transient3]
   - f[transient3_customer3] + f[transient2_transient3]
   - f[transient3_transient4] = 0
 fc[customer3]: - f[production9_customer3] - f[transient3_customer3]
   = -1.1
 fc[transient4]: f[production10_transient4] + f[production11_transient4]
   - f[transient4_customer4] + f[transient3_transient4]
   - f[transient4_transient5] = 0
 fc[customer4]: - f[production12_customer4] - f[transient4_customer4]
   = -1.1
 fc[transient5]: f[production13_transient5] + f[production14_transient5]
   - f[transient5_customer5] + f[transient4_transient5]
   - f[transient5_transient6] = 0
 fc[customer5]: - f[production15_customer5] - f[transient5_customer5]
   = -1.1
 fc[transient6]: f[production16_transient6] + f[production17_transient6]
   - f[transient6_customer6] + f[transient5_transient6]
   - f[transient6_transient7] = 0
 fc[customer6]: - f[production18_customer6] - f[transient6_customer6]
   = -1.1
 fc[transient7]: f[production19_transient7] + f[production20_transient7]
   - f[transient7_customer7] + f[transient6_transient7]
   - f[transient7_transient8] = 0
 fc[customer7]: - f[production21_customer7] - f[transient7_customer7]
   = -1.1
 fc[transient8]: f[production22_transient8] + f[production23_transient8]
   - f[transient8_customer8] + f[transient7_transient8]
   - f[transient8_transient9] = 0
 fc[customer8]: - f[production24_customer8] - f[transient8_customer8]
   = -1.1
 fc[transient9]: f[production25_transient9] + f[production26_transient9]
   - f[transient9_customer9] + f[transient8_transient9]
   - f[transient9_transient10] = 0
 fc[customer9]: - f[production27_customer9] - f[transient9_customer9]
   = -1.1
 fc[transient10]: f[production28_transient10] + f[production29_transient10]
   - f[transient10_customer10] + f[transient9_transient10] = 0
 fc[customer10]: - f[production30_customer10] - f[transient10_customer10]
   = -1.1
 f[production1_transient1]_outer_lin_approx_0: p[transient1]
   + 0.1818181818181818 f[production1_transient1] <= 0.5082644628099173
 f[production1_transient1]_outer_lin_approx_1: p[transient1]
   + 0.3636363636363636 f[production1_transient1] <= 0.5330578512396694
 f[production1_transient1]_outer_lin_approx_2: p[transient1]
   + 0.5454545454545454 f[production1_transient1] <= 0.5743801652892562
 f[production1_transient1]_outer_lin_approx_3: p[transient1]
   + 0.7272727272727273 f[production1_transient1] <= 0.6322314049586777
 f[production1_transient1]_outer_lin_approx_4: p[transient1]
   + 0.9090909090909092 f[production1_transient1] <= 0.7066115702479339
 f[production1_transient1]_outer_lin_approx_5: p[transient1]
   + 1.090909090909091 f[production1_transient1] <= 0.7975206611570247
 f[production1_transient1]_outer_lin_approx_6: p[transient1]
   + 1.272727272727273 f[production1_transient1] <= 0.9049586776859504
 f[production1_transient1]_outer_lin_approx_7: p[transient1]
   + 1.454545454545455 f[production1_transient1] <= 1.028925619834711
 f[production1_transient1]_outer_lin_approx_8: p[transient1]
   + 1.636363636363636 f[production1_transient1] <= 1.169421487603306
 f[production1_transient1]_outer_lin_approx_9: p[transient1]
   + 1.818181818181818 f[production1_transient1] <= 1.326446280991736
 f[production2_transient1]_outer_lin_approx_0: p[transient1]
   + 0.128564869306645 f[production2_transient1] <= 0.5041322314049587
 f[production2_transient1]_outer_lin_approx_1: p[transient1]
   + 0.25712973861329 f[production2_transient1] <= 0.5165289256198348
 f[production2_transient1]_outer_lin_approx_2: p[transient1]
   + 0.385694607919935 f[production2_transient1] <= 0.5371900826446281
 f[production2_transient1]_outer_lin_approx_3: p[transient1]
   + 0.5142594772265801 f[production2_transient1] <= 0.5661157024793388
 f[production2_transient1]_outer_lin_approx_4: p[transient1]
   + 0.6428243465332251 f[production2_transient1] <= 0.6033057851239669
 f[production2_transient1]_outer_lin_approx_5: p[transient1]
   + 0.7713892158398701 f[production2_transient1] <= 0.6487603305785125
 f[production2_transient1]_outer_lin_approx_6: p[transient1]
   + 0.8999540851465151 f[production2_transient1] <= 0.7024793388429752
 f[production2_transient1]_outer_lin_approx_7: p[transient1]
   + 1.02851895445316 f[production2_transient1] <= 0.7644628099173554
 f[production2_transient1]_outer_lin_approx_8: p[transient1]
   + 1.157083823759805 f[production2_transient1] <= 0.834710743801653
 f[production2_transient1]_outer_lin_approx_9: p[transient1]
   + 1.28564869306645 f[production2_transient1] <= 0.9132231404958678
 f[transient1_customer1]_outer_lin_approx_0: - p[transient1]
   + 0.128564869306645 f[transient1_customer1] <= 0.00413223140495868
 f[transient1_customer1]_outer_lin_approx_1: - p[transient1]
   + 0.25712973861329 f[transient1_customer1] <= 0.0165289256198347
 f[transient1_customer1]_outer_lin_approx_2: - p[transient1]
   + 0.385694607919935 f[transient1_customer1] <= 0.0371900826446281
 f[transient1_customer1]_outer_lin_approx_3: - p[transient1]
   + 0.5142594772265801 f[transient1_customer1] <= 0.0661157024793389
 f[transient1_customer1]_outer_lin_approx_4: - p[transient1]
   + 0.6428243465332251 f[transient1_customer1] <= 0.103305785123967
 f[transient1_customer1]_outer_lin_approx_5: - p[transient1]
   + 0.7713892158398701 f[transient1_customer1] <= 0.1487603305785124
 f[transient1_customer1]_outer_lin_approx_6: - p[transient1]
   + 0.8999540851465151 f[transient1_customer1] <= 0.2024793388429752
 f[transient1_customer1]_outer_lin_approx_7: - p[transient1]
   + 1.02851895445316 f[transient1_customer1] <= 0.2644628099173554
 f[transient1_customer1]_outer_lin_approx_8: - p[transient1]
   + 1.157083823759805 f[transient1_customer1] <= 0.3347107438016529
 f[transient1_customer1]_outer_lin_approx_9: - p[transient1]
   + 1.28564869306645 f[transient1_customer1] <= 0.4132231404958678
 f[production4_transient2]_outer_lin_approx_0: p[transient2]
   + 0.1818181818181818 f[production4_transient2] <= 0.5082644628099173
 f[production4_transient2]_outer_lin_approx_1: p[transient2]
   + 0.3636363636363636 f[production4_transient2] <= 0.5330578512396694
 f[production4_transient2]_outer_lin_approx_2: p[transient2]
   + 0.5454545454545454 f[production4_transient2] <= 0.5743801652892562
 f[production4_transient2]_outer_lin_approx_3: p[transient2]
   + 0.7272727272727273 f[production4_transient2] <= 0.6322314049586777
 f[production4_transient2]_outer_lin_approx_4: p[transient2]
   + 0.9090909090909092 f[production4_transient2] <= 0.7066115702479339
 f[production4_transient2]_outer_lin_approx_5: p[transient2]
   + 1.090909090909091 f[production4_transient2] <= 0.7975206611570247
 f[production4_transient2]_outer_lin_approx_6: p[transient2]
   + 1.272727272727273 f[production4_transient2] <= 0.9049586776859504
 f[production4_transient2]_outer_lin_approx_7: p[transient2]
   + 1.454545454545455 f[production4_transient2] <= 1.028925619834711
 f[production4_transient2]_outer_lin_approx_8: p[transient2]
   + 1.636363636363636 f[production4_transient2] <= 1.169421487603306
 f[production4_transient2]_outer_lin_approx_9: p[transient2]
   + 1.818181818181818 f[production4_transient2] <= 1.326446280991736
 f[production5_transient2]_outer_lin_approx_0: p[transient2]
   + 0.128564869306645 f[production5_transient2] <= 0.5041322314049587
 f[production5_transient2]_outer_lin_approx_1: p[transient2]
   + 0.25712973861329 f[production5_transient2] <= 0.5165289256198348
 f[production5_transient2]_outer_lin_approx_2: p[transient2]
   + 0.385694607919935 f[production5_transient2] <= 0.5371900826446281
 f[production5_transient2]_outer_lin_approx_3: p[transient2]
   + 0.5142594772265801 f[production5_transient2] <= 0.5661157024793388
 f[production5_transient2]_outer_lin_approx_4: p[transient2]
   + 0.6428243465332251 f[production5_transient2] <= 0.6033057851239669
 f[production5_transient2]_outer_lin_approx_5: p[transient2]
   + 0.7713892158398701 f[production5_transient2] <= 0.6487603305785125
 f[production5_transient2]_outer_lin_approx_6: p[transient2]
   + 0.8999540851465151 f[production5_transient2] <= 0.7024793388429752
 f[production5_transient2]_outer_lin_approx_7: p[transient2]
   + 1.02851895445316 f[production5_transient2] <= 0.7644628099173554
 f[production5_transient2]_outer_lin_approx_8: p[transient2]
   + 1.157083823759805 f[production5_transient2] <= 0.834710743801653
 f[production5_transient2]_outer_lin_approx_9: p[transient2]
   + 1.28564869306645 f[production5_transient2] <= 0.9132231404958678
 f[transient2_customer2]_outer_lin_approx_0: - p[transient2]
   + 0.128564869306645 f[transient2_customer2] <= 0.00413223140495868
 f[transient2_customer2]_outer_lin_approx_1: - p[transient2]
   + 0.25712973861329 f[transient2_customer2] <= 0.0165289256198347
 f[transient2_customer2]_outer_lin_approx_2: - p[transient2]
   + 0.385694607919935 f[transient2_customer2] <= 0.0371900826446281
 f[transient2_customer2]_outer_lin_approx_3: - p[transient2]
   + 0.5142594772265801 f[transient2_customer2] <= 0.0661157024793389
 f[transient2_customer2]_outer_lin_approx_4: - p[transient2]
   + 0.6428243465332251 f[transient2_customer2] <= 0.103305785123967
 f[transient2_customer2]_outer_lin_approx_5: - p[transient2]
   + 0.7713892158398701 f[transient2_customer2] <= 0.1487603305785124
 f[transient2_customer2]_outer_lin_approx_6: - p[transient2]
   + 0.8999540851465151 f[transient2_customer2] <= 0.2024793388429752
 f[transient2_customer2]_outer_lin_approx_7: - p[transient2]
   + 1.02851895445316 f[transient2_customer2] <= 0.2644628099173554
 f[transient2_customer2]_outer_lin_approx_8: - p[transient2]
   + 1.157083823759805 f[transient2_customer2] <= 0.3347107438016529
 f[transient2_customer2]_outer_lin_approx_9: - p[transient2]
   + 1.28564869306645 f[transient2_customer2] <= 0.4132231404958678
 f[transient1_transient2]_outer_lin_approx_0: - p[transient1]
   + p[transient2] + 0.128564869306645 f[transient1_transient2]
   <= 0.00413223140495868
 f[transient1_transient2]_outer_lin_approx_1: - p[transient1]
   + p[transient2] + 0.25712973861329 f[transient1_transient2]
   <= 0.0165289256198347
 f[transient1_transient2]_outer_lin_approx_2: - p[transient1]
   + p[transient2] + 0.385694607919935 f[transient1_transient2]
   <= 0.0371900826446281
 f[transient1_transient2]_outer_lin_approx_3: - p[transient1]
   + p[transient2] + 0.5142594772265801 f[transient1_transient2]
   <= 0.0661157024793389
 f[transient1_transient2]_outer_lin_approx_4: - p[transient1]
   + p[transient2] + 0.6428243465332251 f[transient1_transient2]
   <= 0.103305785123967
 f[transient1_transient2]_outer_lin_approx_5: - p[transient1]
   + p[transient2] + 0.7713892158398701 f[transient1_transient2]
   <= 0.1487603305785124
 f[transient1_transient2]_outer_lin_approx_6: - p[transient1]
   + p[transient2] + 0.8999540851465151 f[transient1_transient2]
   <= 0.2024793388429752
 f[transient1_transient2]_outer_lin_approx_7: - p[transient1]
   + p[transient2] + 1.02851895445316 f[transient1_transient2]
   <= 0.2644628099173554
 f[transient1_transient2]_outer_lin_approx_8: - p[transient1]
   + p[transient2] + 1.157083823759805 f[transient1_transient2]
   <= 0.3347107438016529
 f[transient1_transient2]_outer_lin_approx_9: - p[transient1]
   + p[transient2] + 1.28564869306645 f[transient1_transient2]
   <= 0.4132231404958678
 f[production7_transient3]_outer_lin_approx_0: p[transient3]
   + 0.1818181818181818 f[production7_transient3] <= 0.5082644628099173
 f[production7_transient3]_outer_lin_approx_1: p[transient3]
   + 0.3636363636363636 f[production7_transient3] <= 0.5330578512396694
 f[production7_transient3]_outer_lin_approx_2: p[transient3]
   + 0.5454545454545454 f[production7_transient3] <= 0.5743801652892562
 f[production7_transient3]_outer_lin_approx_3: p[transient3]
   + 0.7272727272727273 f[production7_transient3] <= 0.6322314049586777
 f[production7_transient3]_outer_lin_approx_4: p[transient3]
   + 0.9090909090909092 f[production7_transient3] <= 0.7066115702479339
 f[production7_transient3]_outer_lin_approx_5: p[transient3]
   + 1.090909090909091 f[production7_transient3] <= 0.7975206611570247
 f[production7_transient3]_outer_lin_approx_6: p[transient3]
   + 1.272727272727273 f[production7_transient3] <= 0.9049586776859504
 f[production7_transient3]_outer_lin_approx_7: p[transient3]
   + 1.454545454545455 f[production7_transient3] <= 1.028925619834711
 f[production7_transient3]_outer_lin_approx_8: p[transient3]
   + 1.636363636363636 f[production7_transient3] <= 1.169421487603306
 f[production7_transient3]_outer_lin_approx_9: p[transient3]
   + 1.818181818181818 f[production7_transient3] <= 1.326446280991736
 f[production8_transient3]_outer_lin_approx_0: p[transient3]
   + 0.128564869306645 f[production8_transient3] <= 0.5041322314049587
 f[production8_transient3]_outer_lin_approx_1: p[transient3]
   + 0.25712973861329 f[production8_transient3] <= 0.5165289256198348
 f[production8_transient3]_outer_lin_approx_2: p[transient3]
   + 0.385694607919935 f[production8_transient3] <= 0.5371900826446281
 f[production8_transient3]_outer_lin_approx_3: p[transient3]
   + 0.5142594772265801 f[production8_transient3] <= 0.5661157024793388
 f[production8_transient3]_outer_lin_approx_4: p[transient3]
   + 0.6428243465332251 f[production8_transient3] <= 0.6033057851239669
 f[production8_transient3]_outer_lin_approx_5: p[transient3]
   + 0.7713892158398701 f[production8_transient3] <= 0.6487603305785125
 f[production8_transient3]_outer_lin_approx_6: p[transient3]
   + 0.8999540851465151 f[production8_transient3] <= 0.7024793388429752
 f[production8_transient3]_outer_lin_approx_7: p[transient3]
   + 1.02851895445316 f[production8_transient3] <= 0.7644628099173554
 f[production8_transient3]_outer_lin_approx_8: p[transient3]
   + 1.157083823759805 f[production8_transient3] <= 0.834710743801653
 f[production8_transient3]_outer_lin_approx_9: p[transient3]
   + 1.28564869306645 f[production8_transient3] <= 0.9132231404958678
 f[transient3_customer3]_outer_lin_approx_0: - p[transient3]
   + 0.128564869306645 f[transient3_customer3] <= 0.00413223140495868
 f[transient3_customer3]_outer_lin_approx_1: - p[transient3]
   + 0.25712973861329 f[transient3_customer3] <= 0.0165289256198347
 f[transient3_customer3]_outer_lin_approx_2: - p[transient3]
   + 0.385694607919935 f[transient3_customer3] <= 0.0371900826446281
 f[transient3_customer3]_outer_lin_approx_3: - p[transient3]
   + 0.5142594772265801 f[transient3_customer3] <= 0.0661157024793389
 f[transient3_customer3]_outer_lin_approx_4: - p[transient3]
   + 0.6428243465332251 f[transient3_customer3] <= 0.103305785123967
 f[transient3_customer3]_outer_lin_approx_5: - p[transient3]
   + 0.7713892158398701 f[transient3_customer3] <= 0.1487603305785124
 f[transient3_customer3]_outer_lin_approx_6: - p[transient3]
   + 0.8999540851465151 f[transient3_customer3] <= 0.2024793388429752
 f[transient3_customer3]_outer_lin_approx_7: - p[transient3]
   + 1.02851895445316 f[transient3_customer3] <= 0.2644628099173554
 f[transient3_customer3]_outer_lin_approx_8: - p[transient3]
   + 1.157083823759805 f[transient3_customer3] <= 0.3347107438016529
 f[transient3_customer3]_outer_lin_approx_9: - p[transient3]
   + 1.28564869306645 f[transient3_customer3] <= 0.4132231404958678
 f[transient2_transient3]_outer_lin_approx_0: - p[transient2]
   + p[transient3] + 0.128564869306645 f[transient2_transient3]
   <= 0.00413223140495868
 f[transient2_transient3]_outer_lin_approx_1: - p[transient2]
   + p[transient3] + 0.25712973861329 f[transient2_transient3]
   <= 0.0165289256198347
 f[transient2_transient3]_outer_lin_approx_2: - p[transient2]
   + p[transient3] + 0.385694607919935 f[transient2_transient3]
   <= 0.0371900826446281
 f[transient2_transient3]_outer_lin_approx_3: - p[transient2]
   + p[transient3] + 0.5142594772265801 f[transient2_transient3]
   <= 0.0661157024793389
 f[transient2_transient3]_outer_lin_approx_4: - p[transient2]
   + p[transient3] + 0.6428243465332251 f[transient2_transient3]
   <= 0.103305785123967
 f[transient2_transient3]_outer_lin_approx_5: - p[transient2]
   + p[transient3] + 0.7713892158398701 f[transient2_transient3]
   <= 0.1487603305785124
 f[transient2_transient3]_outer_lin_approx_6: - p[transient2]
   + p[transient3] + 0.8999540851465151 f[transient2_transient3]
   <= 0.2024793388429752
 f[transient2_transient3]_outer_lin_approx_7: - p[transient2]
   + p[transient3] + 1.02851895445316 f[transient2_transient3]
   <= 0.2644628099173554
 f[transient2_transient3]_outer_lin_approx_8: - p[transient2]
   + p[transient3] + 1.157083823759805 f[transient2_transient3]
   <= 0.3347107438016529
 f[transient2_transient3]_outer_lin_approx_9: - p[transient2]
   + p[transient3] + 1.28564869306645 f[transient2_transient3]
   <= 0.4132231404958678
 f[production10_transient4]_outer_lin_approx_0: p[transient4]
   + 0.1818181818181818 f[production10_transient4] <= 0.5082644628099173
 f[production10_transient4]_outer_lin_approx_1: p[transient4]
   + 0.3636363636363636 f[production10_transient4] <= 0.5330578512396694
 f[production10_transient4]_outer_lin_approx_2: p[transient4]
   + 0.5454545454545454 f[production10_transient4] <= 0.5743801652892562
 f[production10_transient4]_outer_lin_approx_3: p[transient4]
   + 0.7272727272727273 f[production10_transient4] <= 0.6322314049586777
 f[production10_transient4]_outer_lin_approx_4: p[transient4]
   + 0.9090909090909092 f[production10_transient4] <= 0.7066115702479339
 f[production10_transient4]_outer_lin_approx_5: p[transient4]
   + 1.090909090909091 f[production10_transient4] <= 0.7975206611570247
 f[production10_transient4]_outer_lin_approx_6: p[transient4]
   + 1.272727272727273 f[production10_transient4] <= 0.9049586776859504
 f[production10_transient4]_outer_lin_approx_7: p[transient4]
   + 1.454545454545455 f[production10_transient4] <= 1.028925619834711
 f[production10_transient4]_outer_lin_approx_8: p[transient4]
   + 1.636363636363636 f[production10_transient4] <= 1.169421487603306
 f[production10_transient4]_outer_lin_approx_9: p[transient4]
   + 1.818181818181818 f[production10_transient4] <= 1.326446280991736
 f[production11_transient4]_outer_lin_approx_0: p[transient4]
   + 0.128564869306645 f[production11_transient4] <= 0.5041322314049587
 f[production11_transient4]_outer_lin_approx_1: p[transient4]
   + 0.25712973861329 f[production11_transient4] <= 0.5165289256198348
 f[production11_transient4]_outer_lin_approx_2: p[transient4]
   + 0.385694607919935 f[production11_transient4] <= 0.5371900826446281
 f[production11_transient4]_outer_lin_approx_3: p[transient4]
   + 0.5142594772265801 f[production11_transient4] <= 0.5661157024793388
 f[production11_transient4]_outer_lin_approx_4: p[transient4]
   + 0.6428243465332251 f[production11_transient4] <= 0.6033057851239669
 f[production11_transient4]_outer_lin_approx_5: p[transient4]
   + 0.7713892158398701 f[production11_transient4] <= 0.6487603305785125
 f[production11_transient4]_outer_lin_approx_6: p[transient4]
   + 0.8999540851465151 f[production11_transient4] <= 0.7024793388429752
 f[production11_transient4]_outer_lin_approx_7: p[transient4]
   + 1.02851895445316 f[production11_transient4] <= 0.7644628099173554
 f[production11_transient4]_outer_lin_approx_8: p[transient4]
   + 1.157083823759805 f[production11_transient4] <= 0.834710743801653
 f[production11_transient4]_outer_lin_approx_9: p[transient4]
   + 1.28564869306645 f[production11_transient4] <= 0.9132231404958678
 f[transient4_customer4]_outer_lin_approx_0: - p[transient4]
   + 0.128564869306645 f[transient4_customer4] <= 0.00413223140495868
 f[transient4_customer4]_outer_lin_approx_1: - p[transient4]
   + 0.25712973861329 f[transient4_customer4] <= 0.0165289256198347
 f[transient4_customer4]_outer_lin_approx_2: - p[transient4]
   + 0.385694607919935 f[transient4_customer4] <= 0.0371900826446281
 f[transient4_customer4]_outer_lin_approx_3: - p[transient4]
   + 0.5142594772265801 f[transient4_customer4] <= 0.0661157024793389
 f[transient4_customer4]_outer_lin_approx_4: - p[transient4]
   + 0.6428243465332251 f[transient4_customer4] <= 0.103305785123967
 f[transient4_customer4]_outer_lin_approx_5: - p[transient4]
   + 0.7713892158398701 f[transient4_customer4] <= 0.1487603305785124
 f[transient4_customer4]_outer_lin_approx_6: - p[transient4]
   + 0.8999540851465151 f[transient4_customer4] <= 0.2024793388429752
 f[transient4_customer4]_outer_lin_approx_7: - p[transient4]
   + 1.02851895445316 f[transient4_customer4] <= 0.2644628099173554
 f[transient4_customer4]_outer_lin_approx_8: - p[transient4]
   + 1.157083823759805 f[transient4_customer4] <= 0.3347107438016529
 f[transient4_customer4]_outer_lin_approx_9: - p[transient4]
   + 1.28564869306645 f[transient4_customer4] <= 0.4132231404958678
 f[transient3_transient4]_outer_lin_approx_0: - p[transient3]
   + p[transient4] + 0.128564869306645 f[transient3_transient4]
   <= 0.00413223140495868
 f[transient3_transient4]_outer_lin_approx_1: - p[transient3]
   + p[transient4] + 0.25712973861329 f[transient3_transient4]
   <= 0.0165289256198347
 f[transient3_transient4]_outer_lin_approx_2: - p[transient3]
   + p[transient4] + 0.385694607919935 f[transient3_transient4]
   <= 0.0371900826446281
 f[transient3_transient4]_outer_lin_approx_3: - p[transient3]
   + p[transient4] + 0.5142594772265801 f[transient3_transient4]
   <= 0.0661157024793389
 f[transient3_transient4]_outer_lin_approx_4: - p[transient3]
   + p[transient4] + 0.6428243465332251 f[transient3_transient4]
   <= 0.103305785123967
 f[transient3_transient4]_outer_lin_approx_5: - p[transient3]
   + p[transient4] + 0.7713892158398701 f[transient3_transient4]
   <= 0.1487603305785124
 f[transient3_transient4]_outer_lin_approx_6: - p[transient3]
   + p[transient4] + 0.8999540851465151 f[transient3_transient4]
   <= 0.2024793388429752
 f[transient3_transient4]_outer_lin_approx_7: - p[transient3]
   + p[transient4] + 1.02851895445316 f[transient3_transient4]
   <= 0.2644628099173554
 f[transient3_transient4]_outer_lin_approx_8: - p[transient3]
   + p[transient4] + 1.157083823759805 f[transient3_transient4]
   <= 0.3347107438016529
 f[transient3_transient4]_outer_lin_approx_9: - p[transient3]
   + p[transient4] + 1.28564869306645 f[transient3_transient4]
   <= 0.4132231404958678
 f[production13_transient5]_outer_lin_approx_0: p[transient5]
   + 0.1818181818181818 f[production13_transient5] <= 0.5082644628099173
 f[production13_transient5]_outer_lin_approx_1: p[transient5]
   + 0.3636363636363636 f[production13_transient5] <= 0.5330578512396694
 f[production13_transient5]_outer_lin_approx_2: p[transient5]
   + 0.5454545454545454 f[production13_transient5] <= 0.5743801652892562
 f[production13_transient5]_outer_lin_approx_3: p[transient5]
   + 0.7272727272727273 f[production13_transient5] <= 0.6322314049586777
 f[production13_transient5]_outer_lin_approx_4: p[transient5]
   + 0.9090909090909092 f[production13_transient5] <= 0.7066115702479339
 f[production13_transient5]_outer_lin_approx_5: p[transient5]
   + 1.090909090909091 f[production13_transient5] <= 0.7975206611570247
 f[production13_transient5]_outer_lin_approx_6: p[transient5]
   + 1.272727272727273 f[production13_transient5] <= 0.9049586776859504
 f[production13_transient5]_outer_lin_approx_7: p[transient5]
   + 1.454545454545455 f[production13_transient5] <= 1.028925619834711
 f[production13_transient5]_outer_lin_approx_8: p[transient5]
   + 1.636363636363636 f[production13_transient5] <= 1.169421487603306
 f[production13_transient5]_outer_lin_approx_9: p[transient5]
   + 1.818181818181818 f[production13_transient5] <= 1.326446280991736
 f[production14_transient5]_outer_lin_approx_0: p[transient5]
   + 0.128564869306645 f[production14_transient5] <= 0.5041322314049587
 f[production14_transient5]_outer_lin_approx_1: p[transient5]
   + 0.25712973861329 f[production14_transient5] <= 0.5165289256198348
 f[production14_transient5]_outer_lin_approx_2: p[transient5]
   + 0.385694607919935 f[production14_transient5] <= 0.5371900826446281
 f[production14_transient5]_outer_lin_approx_3: p[transient5]
   + 0.5142594772265801 f[production14_transient5] <= 0.5661157024793388
 f[production14_transient5]_outer_lin_approx_4: p[transient5]
   + 0.6428243465332251 f[production14_transient5] <= 0.6033057851239669
 f[production14_transient5]_outer_lin_approx_5: p[transient5]
   + 0.7713892158398701 f[production14_transient5] <= 0.6487603305785125
 f[production14_transient5]_outer_lin_approx_6: p[transient5]
   + 0.8999540851465151 f[production14_transient5] <= 0.7024793388429752
 f[production14_transient5]_outer_lin_approx_7: p[transient5]
   + 1.02851895445316 f[production14_transient5] <= 0.7644628099173554
 f[production14_transient5]_outer_lin_approx_8: p[transient5]
   + 1.157083823759805 f[production14_transient5] <= 0.834710743801653
 f[production14_transient5]_outer_lin_approx_9: p[transient5]
   + 1.28564869306645 f[production14_transient5] <= 0.9132231404958678
 f[transient5_customer5]_outer_lin_approx_0: - p[transient5]
   + 0.128564869306645 f[transient5_customer5] <= 0.00413223140495868
 f[transient5_customer5]_outer_lin_approx_1: - p[transient5]
   + 0.25712973861329 f[transient5_customer5] <= 0.0165289256198347
 f[transient5_customer5]_outer_lin_approx_2: - p[transient5]
   + 0.385694607919935 f[transient5_customer5] <= 0.0371900826446281
 f[transient5_customer5]_outer_lin_approx_3: - p[transient5]
   + 0.5142594772265801 f[transient5_customer5] <= 0.0661157024793389
 f[transient5_customer5]_outer_lin_approx_4: - p[transient5]
   + 0.6428243465332251 f[transient5_customer5] <= 0.103305785123967
 f[transient5_customer5]_outer_lin_approx_5: - p[transient5]
   + 0.7713892158398701 f[transient5_customer5] <= 0.1487603305785124
 f[transient5_customer5]_outer_lin_approx_6: - p[transient5]
   + 0.8999540851465151 f[transient5_customer5] <= 0.2024793388429752
 f[transient5_customer5]_outer_lin_approx_7: - p[transient5]
   + 1.02851895445316 f[transient5_customer5] <= 0.2644628099173554
 f[transient5_customer5]_outer_lin_approx_8: - p[transient5]
   + 1.157083823759805 f[transient5_customer5] <= 0.3347107438016529
 f[transient5_customer5]_outer_lin_approx_9: - p[transient5]
   + 1.28564869306645 f[transient5_customer5] <= 0.4132231404958678
 f[transient4_transient5]_outer_lin_approx_0: - p[transient4]
   + p[transient5] + 0.128564869306645 f[transient4_transient5]
   <= 0.00413223140495868
 f[transient4_transient5]_outer_lin_approx_1: - p[transient4]
   + p[transient5] + 0.25712973861329 f[transient4_transient5]
   <= 0.0165289256198347
 f[transient4_transient5]_outer_lin_approx_2: - p[transient4]
   + p[transient5] + 0.385694607919935 f[transient4_transient5]
   <= 0.0371900826446281
 f[transient4_transient5]_outer_lin_approx_3: - p[transient4]
   + p[transient5] + 0.5142594772265801 f[transient4_transient5]
   <= 0.0661157024793389
 f[transient4_transient5]_outer_lin_approx_4: - p[transient4]
   + p[transient5] + 0.6428243465332251 f[transient4_transient5]
   <= 0.103305785123967
 f[transient4_transient5]_outer_lin_approx_5: - p[transient4]
   + p[transient5] + 0.7713892158398701 f[transient4_transient5]
   <= 0.1487603305785124
 f[transient4_transient5]_outer_lin_approx_6: - p[transient4]
   + p[transient5] + 0.8999540851465151 f[transient4_transient5]
   <= 0.2024793388429752
 f[transient4_transient5]_outer_lin_approx_7: - p[transient4]
   + p[transient5] + 1.02851895445316 f[transient4_transient5]
   <= 0.2644628099173554
 f[transient4_transient5]_outer_lin_approx_8: - p[transient4]
   + p[transient5] + 1.157083823759805 f[transient4_transient5]
   <= 0.3347107438016529
 f[transient4_transient5]_outer_lin_approx_9: - p[transient4]
   + p[transient5] + 1.28564869306645 f[transient4_transient5]
   <= 0.4132231404958678
 f[production16_transient6]_outer_lin_approx_0: p[transient6]
   + 0.1818181818181818 f[production16_transient6] <= 0.5082644628099173
 f[production16_transient6]_outer_lin_approx_1: p[transient6]
   + 0.3636363636363636 f[production16_transient6] <= 0.5330578512396694
 f[production16_transient6]_outer_lin_approx_2: p[transient6]
   + 0.5454545454545454 f[production16_transient6] <= 0.5743801652892562
 f[production16_transient6]_outer_lin_approx_3: p[transient6]
   + 0.7272727272727273 f[production16_transient6] <= 0.6322314049586777
 f[production16_transient6]_outer_lin_approx_4: p[transient6]
   + 0.9090909090909092 f[production16_transient6] <= 0.7066115702479339
 f[production16_transient6]_outer_lin_approx_5: p[transient6]
   + 1.090909090909091 f[production16_transient6] <= 0.7975206611570247
 f[production16_transient6]_outer_lin_approx_6: p[transient6]
   + 1.272727272727273 f[production16_transient6] <= 0.9049586776859504
 f[production16_transient6]_outer_lin_approx_7: p[transient6]
   + 1.454545454545455 f[production16_transient6] <= 1.028925619834711
 f[production16_transient6]_outer_lin_approx_8: p[transient6]
   + 1.636363636363636 f[production16_transient6] <= 1.169421487603306
 f[production16_transient6]_outer_lin_approx_9: p[transient6]
   + 1.818181818181818 f[production16_transient6] <= 1.326446280991736
 f[production17_transient6]_outer_lin_approx_0: p[transient6]
   + 0.128564869306645 f[production17_transient6] <= 0.5041322314049587
 f[production17_transient6]_outer_lin_approx_1: p[transient6]
   + 0.25712973861329 f[production17_transient6] <= 0.5165289256198348
 f[production17_transient6]_outer_lin_approx_2: p[transient6]
   + 0.385694607919935 f[production17_transient6] <= 0.5371900826446281
 f[production17_transient6]_outer_lin_approx_3: p[transient6]
   + 0.5142594772265801 f[production17_transient6] <= 0.5661157024793388
 f[production17_transient6]_outer_lin_approx_4: p[transient6]
   + 0.6428243465332251 f[production17_transient6] <= 0.6033057851239669
 f[production17_transient6]_outer_lin_approx_5: p[transient6]
   + 0.7713892158398701 f[production17_transient6] <= 0.6487603305785125
 f[production17_transient6]_outer_lin_approx_6: p[transient6]
   + 0.8999540851465151 f[production17_transient6] <= 0.7024793388429752
 f[production17_transient6]_outer_lin_approx_7: p[transient6]
   + 1.02851895445316 f[production17_transient6] <= 0.7644628099173554
 f[production17_transient6]_outer_lin_approx_8: p[transient6]
   + 1.157083823759805 f[production17_transient6] <= 0.834710743801653
 f[production17_transient6]_outer_lin_approx_9: p[transient6]
   + 1.28564869306645 f[production17_transient6] <= 0.9132231404958678
 f[transient6_customer6]_outer_lin_approx_0: - p[transient6]
   + 0.128564869306645 f[transient6_customer6] <= 0.00413223140495868
 f[transient6_customer6]_outer_lin_approx_1: - p[transient6]
   + 0.25712973861329 f[transient6_customer6] <= 0.0165289256198347
 f[transient6_customer6]_outer_lin_approx_2: - p[transient6]
   + 0.385694607919935 f[transient6_customer6] <= 0.0371900826446281
 f[transient6_customer6]_outer_lin_approx_3: - p[transient6]
   + 0.5142594772265801 f[transient6_customer6] <= 0.0661157024793389
 f[transient6_customer6]_outer_lin_approx_4: - p[transient6]
   + 0.6428243465332251 f[transient6_customer6] <= 0.103305785123967
 f[transient6_customer6]_outer_lin_approx_5: - p[transient6]
   + 0.7713892158398701 f[transient6_customer6] <= 0.1487603305785124
 f[transient6_customer6]_outer_lin_approx_6: - p[transient6]
   + 0.8999540851465151 f[transient6_customer6] <= 0.2024793388429752
 f[transient6_customer6]_outer_lin_approx_7: - p[transient6]
   + 1.02851895445316 f[transient6_customer6] <= 0.2644628099173554
 f[transient6_customer6]_outer_lin_approx_8: - p[transient6]
   + 1.157083823759805 f[transient6_customer6] <= 0.3347107438016529
 f[transient6_customer6]_outer_lin_approx_9: - p[transient6]
   + 1.28564869306645 f[transient6_customer6] <= 0.4132231404958678
 f[transient5_transient6]_outer_lin_approx_0: - p[transient5]
   + p[transient6] + 0.128564869306645 f[transient5_transient6]
   <= 0.00413223140495868
 f[transient5_transient6]_outer_lin_approx_1: - p[transient5]
   + p[transient6] + 0.25712973861329 f[transient5_transient6]
   <= 0.0165289256198347
 f[transient5_transient6]_outer_lin_approx_2: - p[transient5]
   + p[transient6] + 0.385694607919935 f[transient5_transient6]
   <= 0.0371900826446281
 f[transient5_transient6]_outer_lin_approx_3: - p[transient5]
   + p[transient6] + 0.5142594772265801 f[transient5_transient6]
   <= 0.0661157024793389
 f[transient5_transient6]_outer_lin_approx_4: - p[transient5]
   + p[transient6] + 0.6428243465332251 f[transient5_transient6]
   <= 0.103305785123967
 f[transient5_transient6]_outer_lin_approx_5: - p[transient5]
   + p[transient6] + 0.7713892158398701 f[transient5_transient6]
   <= 0.1487603305785124
 f[transient5_transient6]_outer_lin_approx_6: - p[transient5]
   + p[transient6] + 0.8999540851465151 f[transient5_transient6]
   <= 0.2024793388429752
 f[transient5_transient6]_outer_lin_approx_7: - p[transient5]
   + p[transient6] + 1.02851895445316 f[transient5_transient6]
   <= 0.2644628099173554
 f[transient5_transient6]_outer_lin_approx_8: - p[transient5]
   + p[transient6] + 1.157083823759805 f[transient5_transient6]
   <= 0.3347107438016529
 f[transient5_transient6]_outer_lin_approx_9: - p[transient5]
   + p[transient6] + 1.28564869306645 f[transient5_transient6]
   <= 0.4132231404958678
 f[production19_transient7]_outer_lin_approx_0: p[transient7]
   + 0.1818181818181818 f[production19_transient7] <= 0.5082644628099173
 f[production19_transient7]_outer_lin_approx_1: p[transient7]
   + 0.3636363636363636 f[production19_transient7] <= 0.5330578512396694
 f[production19_transient7]_outer_lin_approx_2: p[transient7]
   + 0.5454545454545454 f[production19_transient7] <= 0.5743801652892562
 f[production19_transient7]_outer_lin_approx_3: p[transient7]
   + 0.7272727272727273 f[production19_transient7] <= 0.6322314049586777
 f[production19_transient7]_outer_lin_approx_4: p[transient7]
   + 0.9090909090909092 f[production19_transient7] <= 0.7066115702479339
 f[production19_transient7]_outer_lin_approx_5: p[transient7]
   + 1.090909090909091 f[production19_transient7] <= 0.7975206611570247
 f[production19_transient7]_outer_lin_approx_6: p[transient7]
   + 1.272727272727273 f[production19_transient7] <= 0.9049586776859504
 f[production19_transient7]_outer_lin_approx_7: p[transient7]
   + 1.454545454545455 f[production19_transient7] <= 1.028925619834711
 f[production19_transient7]_outer_lin_approx_8: p[transient7]
   + 1.636363636363636 f[production19_transient7] <= 1.169421487603306
 f[production19_transient7]_outer_lin_approx_9: p[transient7]
   + 1.818181818181818 f[production19_transient7] <= 1.326446280991736
 f[production20_transient7]_outer_lin_approx_0: p[transient7]
   + 0.128564869306645 f[production20_transient7] <= 0.5041322314049587
 f[production20_transient7]_outer_lin_approx_1: p[transient7]
   + 0.25712973861329 f[production20_transient7] <= 0.5165289256198348
 f[production20_transient7]_outer_lin_approx_2: p[transient7]
   + 0.385694607919935 f[production20_transient7] <= 0.5371900826446281
 f[production20_transient7]_outer_lin_approx_3: p[transient7]
   + 0.5142594772265801 f[production20_transient7] <= 0.5661157024793388
 f[production20_transient7]_outer_lin_approx_4: p[transient7]
   + 0.6428243465332251 f[production20_transient7] <= 0.6033057851239669
 f[production20_transient7]_outer_lin_approx_5: p[transient7]
   + 0.7713892158398701 f[production20_transient7] <= 0.6487603305785125
 f[production20_transient7]_outer_lin_approx_6: p[transient7]
   + 0.8999540851465151 f[production20_transient7] <= 0.7024793388429752
 f[production20_transient7]_outer_lin_approx_7: p[transient7]
   + 1.02851895445316 f[production20_transient7] <= 0.7644628099173554
 f[production20_transient7]_outer_lin_approx_8: p[transient7]
   + 1.157083823759805 f[production20_transient7] <= 0.834710743801653
 f[production20_transient7]_outer_lin_approx_9: p[transient7]
   + 1.28564869306645 f[production20_transient7] <= 0.9132231404958678
 f[transient7_customer7]_outer_lin_approx_0: - p[transient7]
   + 0.128564869306645 f[transient7_customer7] <= 0.00413223140495868
 f[transient7_customer7]_outer_lin_approx_1: - p[transient7]
   + 0.25712973861329 f[transient7_customer7] <= 0.0165289256198347
 f[transient7_customer7]_outer_lin_approx_2: - p[transient7]
   + 0.385694607919935 f[transient7_customer7] <= 0.0371900826446281
 f[transient7_customer7]_outer_lin_approx_3: - p[transient7]
   + 0.5142594772265801 f[transient7_customer7] <= 0.0661157024793389
 f[transient7_customer7]_outer_lin_approx_4: - p[transient7]
   + 0.6428243465332251 f[transient7_customer7] <= 0.103305785123967
 f[transient7_customer7]_outer_lin_approx_5: - p[transient7]
   + 0.7713892158398701 f[transient7_customer7] <= 0.1487603305785124
 f[transient7_customer7]_outer_lin_approx_6: - p[transient7]
   + 0.8999540851465151 f[transient7_customer7] <= 0.2024793388429752
 f[transient7_customer7]_outer_lin_approx_7: - p[transient7]
   + 1.02851895445316 f[transient7_customer7] <= 0.2644628099173554
 f[transient7_customer7]_outer_lin_approx_8: - p[transient7]
   + 1.157083823759805 f[transient7_customer7] <= 0.3347107438016529
 f[transient7_customer7]_outer_lin_approx_9: - p[transient7]
   + 1.28564869306645 f[transient7_customer7] <= 0.4132231404958678
 f[transient6_transient7]_outer_lin_approx_0: - p[transient6]
   + p[transient7] + 0.128564869306645 f[transient6_transient7]
   <= 0.00413223140495868
 f[transient6_transient7]_outer_lin_approx_1: - p[transient6]
   + p[transient7] + 0.25712973861329 f[transient6_transient7]
   <= 0.0165289256198347
 f[transient6_transient7]_outer_lin_approx_2: - p[transient6]
   + p[transient7] + 0.385694607919935 f[transient6_transient7]
   <= 0.0371900826446281
 f[transient6_transient7]_outer_lin_approx_3: - p[transient6]
   + p[transient7] + 0.5142594772265801 f[transient6_transient7]
   <= 0.0661157024793389
 f[transient6_transient7]_outer_lin_approx_4: - p[transient6]
   + p[transient7] + 0.6428243465332251 f[transient6_transient7]
   <= 0.103305785123967
 f[transient6_transient7]_outer_lin_approx_5: - p[transient6]
   + p[transient7] + 0.7713892158398701 f[transient6_transient7]
   <= 0.1487603305785124
 f[transient6_transient7]_outer_lin_approx_6: - p[transient6]
   + p[transient7] + 0.8999540851465151 f[transient6_transient7]
   <= 0.2024793388429752
 f[transient6_transient7]_outer_lin_approx_7: - p[transient6]
   + p[transient7] + 1.02851895445316 f[transient6_transient7]
   <= 0.2644628099173554
 f[transient6_transient7]_outer_lin_approx_8: - p[transient6]
   + p[transient7] + 1.157083823759805 f[transient6_transient7]
   <= 0.3347107438016529
 f[transient6_transient7]_outer_lin_approx_9: - p[transient6]
   + p[transient7] + 1.28564869306645 f[transient6_transient7]
   <= 0.4132231404958678
 f[production22_transient8]_outer_lin_approx_0: p[transient8]
   + 0.1818181818181818 f[production22_transient8] <= 0.5082644628099173
 f[production22_transient8]_outer_lin_approx_1: p[transient8]
   + 0.3636363636363636 f[production22_transient8] <= 0.5330578512396694
 f[production22_transient8]_outer_lin_approx_2: p[transient8]
   + 0.5454545454545454 f[production22_transient8] <= 0.5743801652892562
 f[production22_transient8]_outer_lin_approx_3: p[transient8]
   + 0.7272727272727273 f[production22_transient8] <= 0.6322314049586777
 f[production22_transient8]_outer_lin_approx_4: p[transient8]
   + 0.9090909090909092 f[production22_transient8] <= 0.7066115702479339
 f[production22_transient8]_outer_lin_approx_5: p[transient8]
   + 1.090909090909091 f[production22_transient8] <= 0.7975206611570247
 f[production22_transient8]_outer_lin_approx_6: p[transient8]
   + 1.272727272727273 f[production22_transient8] <= 0.9049586776859504
 f[production22_transient8]_outer_lin_approx_7: p[transient8]
   + 1.454545454545455 f[production22_transient8] <= 1.028925619834711
 f[production22_transient8]_outer_lin_approx_8: p[transient8]
   + 1.636363636363636 f[production22_transient8] <= 1.169421487603306
 f[production22_transient8]_outer_lin_approx_9: p[transient8]
   + 1.818181818181818 f[production22_transient8] <= 1.326446280991736
 f[production23_transient8]_outer_lin_approx_0: p[transient8]
   + 0.128564869306645 f[production23_transient8] <= 0.5041322314049587
 f[production23_transient8]_outer_lin_approx_1: p[transient8]
   + 0.25712973861329 f[production23_transient8] <= 0.5165289256198348
 f[production23_transient8]_outer_lin_approx_2: p[transient8]
   + 0.385694607919935 f[production23_transient8] <= 0.5371900826446281
 f[production23_transient8]_outer_lin_approx_3: p[transient8]
   + 0.5142594772265801 f[production23_transient8] <= 0.5661157024793388
 f[production23_transient8]_outer_lin_approx_4: p[transient8]
   + 0.6428243465332251 f[production23_transient8] <= 0.6033057851239669
 f[production23_transient8]_outer_lin_approx_5: p[transient8]
   + 0.7713892158398701 f[production23_transient8] <= 0.6487603305785125
 f[production23_transient8]_outer_lin_approx_6: p[transient8]
   + 0.8999540851465151 f[production23_transient8] <= 0.7024793388429752
 f[production23_transient8]_outer_lin_approx_7: p[transient8]
   + 1.02851895445316 f[production23_transient8] <= 0.7644628099173554
 f[production23_transient8]_outer_lin_approx_8: p[transient8]
   + 1.157083823759805 f[production23_transient8] <= 0.834710743801653
 f[production23_transient8]_outer_lin_approx_9: p[transient8]
   + 1.28564869306645 f[production23_transient8] <= 0.9132231404958678
 f[transient8_customer8]_outer_lin_approx_0: - p[transient8]
   + 0.128564869306645 f[transient8_customer8] <= 0.00413223140495868
 f[transient8_customer8]_outer_lin_approx_1: - p[transient8]
   + 0.25712973861329 f[transient8_customer8] <= 0.0165289256198347
 f[transient8_customer8]_outer_lin_approx_2: - p[transient8]
   + 0.385694607919935 f[transient8_customer8] <= 0.0371900826446281
 f[transient8_customer8]_outer_lin_approx_3: - p[transient8]
   + 0.5142594772265801 f[transient8_customer8] <= 0.0661157024793389
 f[transient8_customer8]_outer_lin_approx_4: - p[transient8]
   + 0.6428243465332251 f[transient8_customer8] <= 0.103305785123967
 f[transient8_customer8]_outer_lin_approx_5: - p[transient8]
   + 0.7713892158398701 f[transient8_customer8] <= 0.1487603305785124
 f[transient8_customer8]_outer_lin_approx_6: - p[transient8]
   + 0.8999540851465151 f[transient8_customer8] <= 0.2024793388429752
 f[transient8_customer8]_outer_lin_approx_7: - p[transient8]
   + 1.02851895445316 f[transient8_customer8] <= 0.2644628099173554
 f[transient8_customer8]_outer_lin_approx_8: - p[transient8]
   + 1.157083823759805 f[transient8_customer8] <= 0.3347107438016529
 f[transient8_customer8]_outer_lin_approx_9: - p[transient8]
   + 1.28564869306645 f[transient8_customer8] <= 0.4132231404958678
 f[transient7_transient8]_outer_lin_approx_0: - p[transient7]
   + p[transient8] + 0.128564869306645 f[transient7_transient8]
   <= 0.00413223140495868
 f[transient7_transient8]_outer_lin_approx_1: - p[transient7]
   + p[transient8] + 0.25712973861329 f[transient7_transient8]
   <= 0.0165289256198347
 f[transient7_transient8]_outer_lin_approx_2: - p[transient7]
   + p[transient8] + 0.385694607919935 f[transient7_transient8]
   <= 0.0371900826446281
 f[transient7_transient8]_outer_lin_approx_3: - p[transient7]
   + p[transient8] + 0.5142594772265801 f[transient7_transient8]
   <= 0.0661157024793389
 f[transient7_transient8]_outer_lin_approx_4: - p[transient7]
   + p[transient8] + 0.6428243465332251 f[transient7_transient8]
   <= 0.103305785123967
 f[transient7_transient8]_outer_lin_approx_5: - p[transient7]
   + p[transient8] + 0.7713892158398701 f[transient7_transient8]
   <= 0.1487603305785124
 f[transient7_transient8]_outer_lin_approx_6: - p[transient7]
   + p[transient8] + 0.8999540851465151 f[transient7_transient8]
   <= 0.2024793388429752
 f[transient7_transient8]_outer_lin_approx_7: - p[transient7]
   + p[transient8] + 1.02851895445316 f[transient7_transient8]
   <= 0.2644628099173554
 f[transient7_transient8]_outer_lin_approx_8: - p[transient7]
   + p[transient8] + 1.157083823759805 f[transient7_transient8]
   <= 0.3347107438016529
 f[transient7_transient8]_outer_lin_approx_9: - p[transient7]
   + p[transient8] + 1.28564869306645 f[transient7_transient8]
   <= 0.4132231404958678
 f[production25_transient9]_outer_lin_approx_0: p[transient9]
   + 0.1818181818181818 f[production25_transient9] <= 0.5082644628099173
 f[production25_transient9]_outer_lin_approx_1: p[transient9]
   + 0.3636363636363636 f[production25_transient9] <= 0.5330578512396694
 f[production25_transient9]_outer_lin_approx_2: p[transient9]
   + 0.5454545454545454 f[production25_transient9] <= 0.5743801652892562
 f[production25_transient9]_outer_lin_approx_3: p[transient9]
   + 0.7272727272727273 f[production25_transient9] <= 0.6322314049586777
 f[production25_transient9]_outer_lin_approx_4: p[transient9]
   + 0.9090909090909092 f[production25_transient9] <= 0.7066115702479339
 f[production25_transient9]_outer_lin_approx_5: p[transient9]
   + 1.090909090909091 f[production25_transient9] <= 0.7975206611570247
 f[production25_transient9]_outer_lin_approx_6: p[transient9]
   + 1.272727272727273 f[production25_transient9] <= 0.9049586776859504
 f[production25_transient9]_outer_lin_approx_7: p[transient9]
   + 1.454545454545455 f[production25_transient9] <= 1.028925619834711
 f[production25_transient9]_outer_lin_approx_8: p[transient9]
   + 1.636363636363636 f[production25_transient9] <= 1.169421487603306
 f[production25_transient9]_outer_lin_approx_9: p[transient9]
   + 1.818181818181818 f[production25_transient9] <= 1.326446280991736
 f[production26_transient9]_outer_lin_approx_0: p[transient9]
   + 0.128564869306645 f[production26_transient9] <= 0.5041322314049587
 f[production26_transient9]_outer_lin_approx_1: p[transient9]
   + 0.25712973861329 f[production26_transient9] <= 0.5165289256198348
 f[production26_transient9]_outer_lin_approx_2: p[transient9]
   + 0.385694607919935 f[production26_transient9] <= 0.5371900826446281
 f[production26_transient9]_outer_lin_approx_3: p[transient9]
   + 0.5142594772265801 f[production26_transient9] <= 0.5661157024793388
 f[production26_transient9]_outer_lin_approx_4: p[transient9]
   + 0.6428243465332251 f[production26_transient9] <= 0.6033057851239669
 f[production26_transient9]_outer_lin_approx_5: p[transient9]
   + 0.7713892158398701 f[production26_transient9] <= 0.6487603305785125
 f[production26_transient9]_outer_lin_approx_6: p[transient9]
   + 0.8999540851465151 f[production26_transient9] <= 0.7024793388429752
 f[production26_transient9]_outer_lin_approx_7: p[transient9]
   + 1.02851895445316 f[production26_transient9] <= 0.7644628099173554
 f[production26_transient9]_outer_lin_approx_8: p[transient9]
   + 1.157083823759805 f[production26_transient9] <= 0.834710743801653
 f[production26_transient9]_outer_lin_approx_9: p[transient9]
   + 1.28564869306645 f[production26_transient9] <= 0.9132231404958678
 f[transient9_customer9]_outer_lin_approx_0: - p[transient9]
   + 0.128564869306645 f[transient9_customer9] <= 0.00413223140495868
 f[transient9_customer9]_outer_lin_approx_1: - p[transient9]
   + 0.25712973861329 f[transient9_customer9] <= 0.0165289256198347
 f[transient9_customer9]_outer_lin_approx_2: - p[transient9]
   + 0.385694607919935 f[transient9_customer9] <= 0.0371900826446281
 f[transient9_customer9]_outer_lin_approx_3: - p[transient9]
   + 0.5142594772265801 f[transient9_customer9] <= 0.0661157024793389
 f[transient9_customer9]_outer_lin_approx_4: - p[transient9]
   + 0.6428243465332251 f[transient9_customer9] <= 0.103305785123967
 f[transient9_customer9]_outer_lin_approx_5: - p[transient9]
   + 0.7713892158398701 f[transient9_customer9] <= 0.1487603305785124
 f[transient9_customer9]_outer_lin_approx_6: - p[transient9]
   + 0.8999540851465151 f[transient9_customer9] <= 0.2024793388429752
 f[transient9_customer9]_outer_lin_approx_7: - p[transient9]
   + 1.02851895445316 f[transient9_customer9] <= 0.2644628099173554
 f[transient9_customer9]_outer_lin_approx_8: - p[transient9]
   + 1.157083823759805 f[transient9_customer9] <= 0.3347107438016529
 f[transient9_customer9]_outer_lin_approx_9: - p[transient9]
   + 1.28564869306645 f[transient9_customer9] <= 0.4132231404958678
 f[transient8_transient9]_outer_lin_approx_0: - p[transient8]
   + p[transient9] + 0.128564869306645 f[transient8_transient9]
   <= 0.00413223140495868
 f[transient8_transient9]_outer_lin_approx_1: - p[transient8]
   + p[transient9] + 0.25712973861329 f[transient8_transient9]
   <= 0.0165289256198347
 f[transient8_transient9]_outer_lin_approx_2: - p[transient8]
   + p[transient9] + 0.385694607919935 f[transient8_transient9]
   <= 0.0371900826446281
 f[transient8_transient9]_outer_lin_approx_3: - p[transient8]
   + p[transient9] + 0.5142594772265801 f[transient8_transient9]
   <= 0.0661157024793389
 f[transient8_transient9]_outer_lin_approx_4: - p[transient8]
   + p[transient9] + 0.6428243465332251 f[transient8_transient9]
   <= 0.103305785123967
 f[transient8_transient9]_outer_lin_approx_5: - p[transient8]
   + p[transient9] + 0.7713892158398701 f[transient8_transient9]
   <= 0.1487603305785124
 f[transient8_transient9]_outer_lin_approx_6: - p[transient8]
   + p[transient9] + 0.8999540851465151 f[transient8_transient9]
   <= 0.2024793388429752
 f[transient8_transient9]_outer_lin_approx_7: - p[transient8]
   + p[transient9] + 1.02851895445316 f[transient8_transient9]
   <= 0.2644628099173554
 f[transient8_transient9]_outer_lin_approx_8: - p[transient8]
   + p[transient9] + 1.157083823759805 f[transient8_transient9]
   <= 0.3347107438016529
 f[transient8_transient9]_outer_lin_approx_9: - p[transient8]
   + p[transient9] + 1.28564869306645 f[transient8_transient9]
   <= 0.4132231404958678
 f[production28_transient10]_outer_lin_approx_0: p[transient10]
   + 0.1818181818181818 f[production28_transient10] <= 0.5082644628099173
 f[production28_transient10]_outer_lin_approx_1: p[transient10]
   + 0.3636363636363636 f[production28_transient10] <= 0.5330578512396694
 f[production28_transient10]_outer_lin_approx_2: p[transient10]
   + 0.5454545454545454 f[production28_transient10] <= 0.5743801652892562
 f[production28_transient10]_outer_lin_approx_3: p[transient10]
   + 0.7272727272727273 f[production28_transient10] <= 0.6322314049586777
 f[production28_transient10]_outer_lin_approx_4: p[transient10]
   + 0.9090909090909092 f[production28_transient10] <= 0.7066115702479339
 f[production28_transient10]_outer_lin_approx_5: p[transient10]
   + 1.090909090909091 f[production28_transient10] <= 0.7975206611570247
 f[production28_transient10]_outer_lin_approx_6: p[transient10]
   + 1.272727272727273 f[production28_transient10] <= 0.9049586776859504
 f[production28_transient10]_outer_lin_approx_7: p[transient10]
   + 1.454545454545455 f[production28_transient10] <= 1.028925619834711
 f[production28_transient10]_outer_lin_approx_8: p[transient10]
   + 1.636363636363636 f[production28_transient10] <= 1.169421487603306
 f[production28_transient10]_outer_lin_approx_9: p[transient10]
   + 1.818181818181818 f[production28_transient10] <= 1.326446280991736
 f[production29_transient10]_outer_lin_approx_0: p[transient10]
   + 0.128564869306645 f[production29_transient10] <= 0.5041322314049587
 f[production29_transient10]_outer_lin_approx_1: p[transient10]
   + 0.25712973861329 f[production29_transient10] <= 0.5165289256198348
 f[production29_transient10]_outer_lin_approx_2: p[transient10]
   + 0.385694607919935 f[production29_transient10] <= 0.5371900826446281
 f[production29_transient10]_outer_lin_approx_3: p[transient10]
   + 0.5142594772265801 f[production29_transient10] <= 0.5661157024793388
 f[production29_transient10]_outer_lin_approx_4: p[transient10]
   + 0.6428243465332251 f[production29_transient10] <= 0.6033057851239669
 f[production29_transient10]_outer_lin_approx_5: p[transient10]
   + 0.7713892158398701 f[production29_transient10] <= 0.6487603305785125
 f[production29_transient10]_outer_lin_approx_6: p[transient10]
   + 0.8999540851465151 f[production29_transient10] <= 0.7024793388429752
 f[production29_transient10]_outer_lin_approx_7: p[transient10]
   + 1.02851895445316 f[production29_transient10] <= 0.7644628099173554
 f[production29_transient10]_outer_lin_approx_8: p[transient10]
   + 1.157083823759805 f[production29_transient10] <= 0.834710743801653
 f[production29_transient10]_outer_lin_approx_9: p[transient10]
   + 1.28564869306645 f[production29_transient10] <= 0.9132231404958678
 f[transient10_customer10]_outer_lin_approx_0: - p[transient10]
   + 0.128564869306645 f[transient10_customer10] <= 0.00413223140495868
 f[transient10_customer10]_outer_lin_approx_1: - p[transient10]
   + 0.25712973861329 f[transient10_customer10] <= 0.0165289256198347
 f[transient10_customer10]_outer_lin_approx_2: - p[transient10]
   + 0.385694607919935 f[transient10_customer10] <= 0.0371900826446281
 f[transient10_customer10]_outer_lin_approx_3: - p[transient10]
   + 0.5142594772265801 f[transient10_customer10] <= 0.0661157024793389
 f[transient10_customer10]_outer_lin_approx_4: - p[transient10]
   + 0.6428243465332251 f[transient10_customer10] <= 0.103305785123967
 f[transient10_customer10]_outer_lin_approx_5: - p[transient10]
   + 0.7713892158398701 f[transient10_customer10] <= 0.1487603305785124
 f[transient10_customer10]_outer_lin_approx_6: - p[transient10]
   + 0.8999540851465151 f[transient10_customer10] <= 0.2024793388429752
 f[transient10_customer10]_outer_lin_approx_7: - p[transient10]
   + 1.02851895445316 f[transient10_customer10] <= 0.2644628099173554
 f[transient10_customer10]_outer_lin_approx_8: - p[transient10]
   + 1.157083823759805 f[transient10_customer10] <= 0.3347107438016529
 f[transient10_customer10]_outer_lin_approx_9: - p[transient10]
   + 1.28564869306645 f[transient10_customer10] <= 0.4132231404958678
 f[transient9_transient10]_outer_lin_approx_0: - p[transient9]
   + p[transient10] + 0.128564869306645 f[transient9_transient10]
   <= 0.00413223140495868
 f[transient9_transient10]_outer_lin_approx_1: - p[transient9]
   + p[transient10] + 0.25712973861329 f[transient9_transient10]
   <= 0.0165289256198347
 f[transient9_transient10]_outer_lin_approx_2: - p[transient9]
   + p[transient10] + 0.385694607919935 f[transient9_transient10]
   <= 0.0371900826446281
 f[transient9_transient10]_outer_lin_approx_3: - p[transient9]
   + p[transient10] + 0.5142594772265801 f[transient9_transient10]
   <= 0.0661157024793389
 f[transient9_transient10]_outer_lin_approx_4: - p[transient9]
   + p[transient10] + 0.6428243465332251 f[transient9_transient10]
   <= 0.103305785123967
 f[transient9_transient10]_outer_lin_approx_5: - p[transient9]
   + p[transient10] + 0.7713892158398701 f[transient9_transient10]
   <= 0.1487603305785124
 f[transient9_transient10]_outer_lin_approx_6: - p[transient9]
   + p[transient10] + 0.8999540851465151 f[transient9_transient10]
   <= 0.2024793388429752
 f[transient9_transient10]_outer_lin_approx_7: - p[transient9]
   + p[transient10] + 1.02851895445316 f[transient9_transient10]
   <= 0.2644628099173554
 f[transient9_transient10]_outer_lin_approx_8: - p[transient9]
   + p[transient10] + 1.157083823759805 f[transient9_transient10]
   <= 0.3347107438016529
 f[transient9_transient10]_outer_lin_approx_9: - p[transient9]
   + p[transient10] + 1.28564869306645 f[transient9_transient10]
   <= 0.4132231404958678
Bounds
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
