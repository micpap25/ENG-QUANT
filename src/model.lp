\ Model lp_from_json
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x8b9c77c1ecfb63c2
Minimize
  psi[N01] + psi[N02] - 2 psi[N04] + 2 psi[N05] + psi[entry01]
   + psi[entry02] - psi[entry03] - psi[exit01] - psi[exit02] - psi[exit03]
Subject To
 mass_balance[N01]: phi[pipe02_N01_N02] - phi[pipe03_entry02_N03]
   + phi[pipe06_N03_N04] - phi[CS01_entry03_N01] = 0
 mass_balance[N02]: - phi[pipe02_N01_N02] + phi[pipe04_N02_exit01]
   + phi[pipe05_N02_N04] = 0
 mass_balance[N04]: - phi[pipe05_N02_N04] - phi[pipe06_N03_N04]
   + phi[CS02_N04_N05] = 0
 mass_balance[N05]: phi[pipe07_N05_exit02] + phi[pipe08_N05_exit03]
   - phi[CS02_N04_N05] = 0
 mass_balance[entry02]: phi[pipe03_entry02_N03] = 140
 mass_balance[entry03]: - phi[pipe01_entry01_entry03]
   + phi[CS01_entry03_N01] = 0
 mass_balance[exit01]: - phi[pipe04_N02_exit01] = -100
 mass_balance[exit02]: - phi[pipe07_N05_exit02] = -120
 mass_balance[exit03]: - phi[pipe08_N05_exit03] = -80
 compressor_active_pressure_ratio[CS01_entry03_N01]: psi[N01]
   - 1.54531645107631 psi[entry03] = 872.5063217220954
 compressor_active_pressure_ratio[CS02_N04_N05]:
   - 1.623649754656013 psi[N04] + psi[N05] = 997.8396074496209
 sum_production_flows_upper[entry01]: phi[pipe01_entry01_entry03] <= 750
 sum_production_flows_lower[entry01]: phi[pipe01_entry01_entry03] >= 50
 phi[pipe01_entry01_entry03]_outer_lin_approx_0: - psi[entry01]
   + psi[entry03] <= 0
 phi[pipe01_entry01_entry03]_outer_lin_approx_1:
   2.739208676311459 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 79.29288273533166
 phi[pipe01_entry01_entry03]_outer_lin_approx_2:
   5.478417352622918 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 317.1715309413269
 phi[pipe01_entry01_entry03]_outer_lin_approx_3:
   8.217626028934378 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 713.6359446179854
 phi[pipe01_entry01_entry03]_outer_lin_approx_4:
   10.95683470524584 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 1268.686123765307
 phi[pipe01_entry01_entry03]_outer_lin_approx_5:
   13.6960433815573 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 1982.322068383292
 phi[pipe01_entry01_entry03]_outer_lin_approx_6:
   16.43525205786876 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 2854.543778471942
 phi[pipe01_entry01_entry03]_outer_lin_approx_7:
   19.17446073418022 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 3885.351254031253
 phi[pipe01_entry01_entry03]_outer_lin_approx_8:
   21.91366941049167 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 5074.744495061229
 phi[pipe01_entry01_entry03]_outer_lin_approx_9:
   24.65287808680313 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 6422.723501561867
 phi[pipe01_entry01_entry03]_outer_lin_approx_10:
   27.39208676311459 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 7929.28827353317
 phi[pipe01_entry01_entry03]_outer_lin_approx_11:
   30.13129543942605 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 9594.438810975138
 phi[pipe01_entry01_entry03]_outer_lin_approx_12:
   32.87050411573751 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 11418.17511388777
 phi[pipe01_entry01_entry03]_outer_lin_approx_13:
   35.60971279204897 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 13400.49718227106
 phi[pipe01_entry01_entry03]_outer_lin_approx_14:
   38.34892146836043 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 15541.40501612501
 phi[pipe01_entry01_entry03]_outer_lin_approx_15:
   41.08813014467189 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 17840.89861544964
 phi[pipe01_entry01_entry03]_outer_lin_approx_16:
   43.82733882098334 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 20298.97798024492
 phi[pipe01_entry01_entry03]_outer_lin_approx_17:
   46.56654749729481 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 22915.64311051086
 phi[pipe01_entry01_entry03]_outer_lin_approx_18:
   49.30575617360626 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 25690.89400624747
 phi[pipe01_entry01_entry03]_outer_lin_approx_19:
   52.04496484991773 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 28624.73066745475
 phi[pipe02_N01_N02]_outer_lin_approx_0: - psi[N01] + psi[N02] <= 0
 phi[pipe02_N01_N02]_outer_lin_approx_1:
   2.739208676311459 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 79.29288273533166
 phi[pipe02_N01_N02]_outer_lin_approx_2:
   5.478417352622918 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 317.1715309413269
 phi[pipe02_N01_N02]_outer_lin_approx_3:
   8.217626028934378 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 713.6359446179854
 phi[pipe02_N01_N02]_outer_lin_approx_4:
   10.95683470524584 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 1268.686123765307
 phi[pipe02_N01_N02]_outer_lin_approx_5:
   13.6960433815573 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 1982.322068383292
 phi[pipe02_N01_N02]_outer_lin_approx_6:
   16.43525205786876 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 2854.543778471942
 phi[pipe02_N01_N02]_outer_lin_approx_7:
   19.17446073418022 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 3885.351254031253
 phi[pipe02_N01_N02]_outer_lin_approx_8:
   21.91366941049167 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 5074.744495061229
 phi[pipe02_N01_N02]_outer_lin_approx_9:
   24.65287808680313 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 6422.723501561867
 phi[pipe02_N01_N02]_outer_lin_approx_10:
   27.39208676311459 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 7929.28827353317
 phi[pipe02_N01_N02]_outer_lin_approx_11:
   30.13129543942605 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 9594.438810975138
 phi[pipe02_N01_N02]_outer_lin_approx_12:
   32.87050411573751 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 11418.17511388777
 phi[pipe02_N01_N02]_outer_lin_approx_13:
   35.60971279204897 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 13400.49718227106
 phi[pipe02_N01_N02]_outer_lin_approx_14:
   38.34892146836043 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 15541.40501612501
 phi[pipe02_N01_N02]_outer_lin_approx_15:
   41.08813014467189 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 17840.89861544964
 phi[pipe02_N01_N02]_outer_lin_approx_16:
   43.82733882098334 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 20298.97798024492
 phi[pipe02_N01_N02]_outer_lin_approx_17:
   46.56654749729481 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 22915.64311051086
 phi[pipe02_N01_N02]_outer_lin_approx_18:
   49.30575617360626 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 25690.89400624747
 phi[pipe02_N01_N02]_outer_lin_approx_19:
   52.04496484991773 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 28624.73066745475
 phi[pipe03_entry02_N03]_outer_lin_approx_0: psi[N01] - psi[entry02] <= 0
 phi[pipe03_entry02_N03]_outer_lin_approx_1:
   2.739208676311459 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 79.29288273533166
 phi[pipe03_entry02_N03]_outer_lin_approx_2:
   5.478417352622918 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 317.1715309413269
 phi[pipe03_entry02_N03]_outer_lin_approx_3:
   8.217626028934378 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 713.6359446179854
 phi[pipe03_entry02_N03]_outer_lin_approx_4:
   10.95683470524584 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 1268.686123765307
 phi[pipe03_entry02_N03]_outer_lin_approx_5:
   13.6960433815573 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 1982.322068383293
 phi[pipe03_entry02_N03]_outer_lin_approx_6:
   16.43525205786876 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 2854.543778471942
 phi[pipe03_entry02_N03]_outer_lin_approx_7:
   19.17446073418022 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 3885.351254031254
 phi[pipe03_entry02_N03]_outer_lin_approx_8:
   21.91366941049167 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 5074.744495061229
 phi[pipe03_entry02_N03]_outer_lin_approx_9:
   24.65287808680313 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 6422.723501561867
 phi[pipe03_entry02_N03]_outer_lin_approx_10:
   27.39208676311459 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 7929.28827353317
 phi[pipe03_entry02_N03]_outer_lin_approx_11:
   30.13129543942605 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 9594.438810975138
 phi[pipe03_entry02_N03]_outer_lin_approx_12:
   32.87050411573751 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 11418.17511388777
 phi[pipe03_entry02_N03]_outer_lin_approx_13:
   35.60971279204897 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 13400.49718227106
 phi[pipe03_entry02_N03]_outer_lin_approx_14:
   38.34892146836043 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 15541.40501612501
 phi[pipe03_entry02_N03]_outer_lin_approx_15:
   41.08813014467189 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 17840.89861544964
 phi[pipe03_entry02_N03]_outer_lin_approx_16:
   43.82733882098334 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 20298.97798024492
 phi[pipe03_entry02_N03]_outer_lin_approx_17:
   46.56654749729481 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 22915.64311051086
 phi[pipe03_entry02_N03]_outer_lin_approx_18:
   49.30575617360626 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 25690.89400624747
 phi[pipe03_entry02_N03]_outer_lin_approx_19:
   52.04496484991773 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 28624.73066745475
 phi[pipe04_N02_exit01]_outer_lin_approx_0: - psi[N02] + psi[exit01] <= 0
 phi[pipe04_N02_exit01]_outer_lin_approx_1:
   2.739208676311459 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 79.29288273533166
 phi[pipe04_N02_exit01]_outer_lin_approx_2:
   5.478417352622918 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 317.1715309413269
 phi[pipe04_N02_exit01]_outer_lin_approx_3:
   8.217626028934378 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 713.6359446179854
 phi[pipe04_N02_exit01]_outer_lin_approx_4:
   10.95683470524584 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 1268.686123765307
 phi[pipe04_N02_exit01]_outer_lin_approx_5:
   13.6960433815573 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 1982.322068383292
 phi[pipe04_N02_exit01]_outer_lin_approx_6:
   16.43525205786876 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 2854.543778471942
 phi[pipe04_N02_exit01]_outer_lin_approx_7:
   19.17446073418022 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 3885.351254031253
 phi[pipe04_N02_exit01]_outer_lin_approx_8:
   21.91366941049167 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 5074.744495061229
 phi[pipe04_N02_exit01]_outer_lin_approx_9:
   24.65287808680313 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 6422.723501561867
 phi[pipe04_N02_exit01]_outer_lin_approx_10:
   27.39208676311459 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 7929.28827353317
 phi[pipe04_N02_exit01]_outer_lin_approx_11:
   30.13129543942605 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 9594.438810975138
 phi[pipe04_N02_exit01]_outer_lin_approx_12:
   32.87050411573751 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 11418.17511388777
 phi[pipe04_N02_exit01]_outer_lin_approx_13:
   35.60971279204897 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 13400.49718227106
 phi[pipe04_N02_exit01]_outer_lin_approx_14:
   38.34892146836043 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 15541.40501612501
 phi[pipe04_N02_exit01]_outer_lin_approx_15:
   41.08813014467189 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 17840.89861544964
 phi[pipe04_N02_exit01]_outer_lin_approx_16:
   43.82733882098334 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 20298.97798024492
 phi[pipe04_N02_exit01]_outer_lin_approx_17:
   46.56654749729481 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 22915.64311051086
 phi[pipe04_N02_exit01]_outer_lin_approx_18:
   49.30575617360626 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 25690.89400624747
 phi[pipe04_N02_exit01]_outer_lin_approx_19:
   52.04496484991773 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 28624.73066745475
 phi[pipe05_N02_N04]_outer_lin_approx_0: - psi[N02] + psi[N04] <= 0
 phi[pipe05_N02_N04]_outer_lin_approx_1:
   2.739208676311459 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 79.29288273533166
 phi[pipe05_N02_N04]_outer_lin_approx_2:
   5.478417352622918 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 317.1715309413269
 phi[pipe05_N02_N04]_outer_lin_approx_3:
   8.217626028934378 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 713.6359446179854
 phi[pipe05_N02_N04]_outer_lin_approx_4:
   10.95683470524584 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 1268.686123765307
 phi[pipe05_N02_N04]_outer_lin_approx_5:
   13.6960433815573 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 1982.322068383292
 phi[pipe05_N02_N04]_outer_lin_approx_6:
   16.43525205786876 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 2854.543778471942
 phi[pipe05_N02_N04]_outer_lin_approx_7:
   19.17446073418022 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 3885.351254031253
 phi[pipe05_N02_N04]_outer_lin_approx_8:
   21.91366941049167 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 5074.744495061229
 phi[pipe05_N02_N04]_outer_lin_approx_9:
   24.65287808680313 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 6422.723501561867
 phi[pipe05_N02_N04]_outer_lin_approx_10:
   27.39208676311459 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 7929.28827353317
 phi[pipe05_N02_N04]_outer_lin_approx_11:
   30.13129543942605 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 9594.438810975138
 phi[pipe05_N02_N04]_outer_lin_approx_12:
   32.87050411573751 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 11418.17511388777
 phi[pipe05_N02_N04]_outer_lin_approx_13:
   35.60971279204897 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 13400.49718227106
 phi[pipe05_N02_N04]_outer_lin_approx_14:
   38.34892146836043 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 15541.40501612501
 phi[pipe05_N02_N04]_outer_lin_approx_15:
   41.08813014467189 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 17840.89861544964
 phi[pipe05_N02_N04]_outer_lin_approx_16:
   43.82733882098334 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 20298.97798024492
 phi[pipe05_N02_N04]_outer_lin_approx_17:
   46.56654749729481 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 22915.64311051086
 phi[pipe05_N02_N04]_outer_lin_approx_18:
   49.30575617360626 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 25690.89400624747
 phi[pipe05_N02_N04]_outer_lin_approx_19:
   52.04496484991773 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 28624.73066745475
 phi[pipe06_N03_N04]_outer_lin_approx_0: - psi[N01] + psi[N04] <= 0
 phi[pipe06_N03_N04]_outer_lin_approx_1:
   2.739208676311459 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 79.29288273533166
 phi[pipe06_N03_N04]_outer_lin_approx_2:
   5.478417352622918 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 317.1715309413269
 phi[pipe06_N03_N04]_outer_lin_approx_3:
   8.217626028934378 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 713.6359446179854
 phi[pipe06_N03_N04]_outer_lin_approx_4:
   10.95683470524584 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 1268.686123765307
 phi[pipe06_N03_N04]_outer_lin_approx_5:
   13.6960433815573 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 1982.322068383292
 phi[pipe06_N03_N04]_outer_lin_approx_6:
   16.43525205786876 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 2854.543778471942
 phi[pipe06_N03_N04]_outer_lin_approx_7:
   19.17446073418022 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 3885.351254031253
 phi[pipe06_N03_N04]_outer_lin_approx_8:
   21.91366941049167 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 5074.744495061229
 phi[pipe06_N03_N04]_outer_lin_approx_9:
   24.65287808680313 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 6422.723501561867
 phi[pipe06_N03_N04]_outer_lin_approx_10:
   27.39208676311459 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 7929.28827353317
 phi[pipe06_N03_N04]_outer_lin_approx_11:
   30.13129543942605 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 9594.438810975138
 phi[pipe06_N03_N04]_outer_lin_approx_12:
   32.87050411573751 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 11418.17511388777
 phi[pipe06_N03_N04]_outer_lin_approx_13:
   35.60971279204897 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 13400.49718227106
 phi[pipe06_N03_N04]_outer_lin_approx_14:
   38.34892146836043 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 15541.40501612501
 phi[pipe06_N03_N04]_outer_lin_approx_15:
   41.08813014467189 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 17840.89861544964
 phi[pipe06_N03_N04]_outer_lin_approx_16:
   43.82733882098334 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 20298.97798024492
 phi[pipe06_N03_N04]_outer_lin_approx_17:
   46.56654749729481 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 22915.64311051086
 phi[pipe06_N03_N04]_outer_lin_approx_18:
   49.30575617360626 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 25690.89400624747
 phi[pipe06_N03_N04]_outer_lin_approx_19:
   52.04496484991773 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 28624.73066745475
 phi[pipe07_N05_exit02]_outer_lin_approx_0: - psi[N05] + psi[exit02] <= 0
 phi[pipe07_N05_exit02]_outer_lin_approx_1:
   2.739208676311459 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 79.29288273533166
 phi[pipe07_N05_exit02]_outer_lin_approx_2:
   5.478417352622918 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 317.1715309413269
 phi[pipe07_N05_exit02]_outer_lin_approx_3:
   8.217626028934378 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 713.6359446179854
 phi[pipe07_N05_exit02]_outer_lin_approx_4:
   10.95683470524584 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 1268.686123765307
 phi[pipe07_N05_exit02]_outer_lin_approx_5:
   13.6960433815573 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 1982.322068383292
 phi[pipe07_N05_exit02]_outer_lin_approx_6:
   16.43525205786876 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 2854.543778471942
 phi[pipe07_N05_exit02]_outer_lin_approx_7:
   19.17446073418022 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 3885.351254031253
 phi[pipe07_N05_exit02]_outer_lin_approx_8:
   21.91366941049167 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 5074.744495061229
 phi[pipe07_N05_exit02]_outer_lin_approx_9:
   24.65287808680313 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 6422.723501561867
 phi[pipe07_N05_exit02]_outer_lin_approx_10:
   27.39208676311459 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 7929.28827353317
 phi[pipe07_N05_exit02]_outer_lin_approx_11:
   30.13129543942605 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 9594.438810975138
 phi[pipe07_N05_exit02]_outer_lin_approx_12:
   32.87050411573751 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 11418.17511388777
 phi[pipe07_N05_exit02]_outer_lin_approx_13:
   35.60971279204897 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 13400.49718227106
 phi[pipe07_N05_exit02]_outer_lin_approx_14:
   38.34892146836043 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 15541.40501612501
 phi[pipe07_N05_exit02]_outer_lin_approx_15:
   41.08813014467189 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 17840.89861544964
 phi[pipe07_N05_exit02]_outer_lin_approx_16:
   43.82733882098334 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 20298.97798024492
 phi[pipe07_N05_exit02]_outer_lin_approx_17:
   46.56654749729481 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 22915.64311051086
 phi[pipe07_N05_exit02]_outer_lin_approx_18:
   49.30575617360626 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 25690.89400624747
 phi[pipe07_N05_exit02]_outer_lin_approx_19:
   52.04496484991773 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 28624.73066745475
 phi[pipe08_N05_exit03]_outer_lin_approx_0: - psi[N05] + psi[exit03] <= 0
 phi[pipe08_N05_exit03]_outer_lin_approx_1:
   2.739208676311459 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 79.29288273533166
 phi[pipe08_N05_exit03]_outer_lin_approx_2:
   5.478417352622918 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 317.1715309413269
 phi[pipe08_N05_exit03]_outer_lin_approx_3:
   8.217626028934378 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 713.6359446179854
 phi[pipe08_N05_exit03]_outer_lin_approx_4:
   10.95683470524584 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 1268.686123765307
 phi[pipe08_N05_exit03]_outer_lin_approx_5:
   13.6960433815573 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 1982.322068383292
 phi[pipe08_N05_exit03]_outer_lin_approx_6:
   16.43525205786876 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 2854.543778471942
 phi[pipe08_N05_exit03]_outer_lin_approx_7:
   19.17446073418022 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 3885.351254031253
 phi[pipe08_N05_exit03]_outer_lin_approx_8:
   21.91366941049167 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 5074.744495061229
 phi[pipe08_N05_exit03]_outer_lin_approx_9:
   24.65287808680313 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 6422.723501561867
 phi[pipe08_N05_exit03]_outer_lin_approx_10:
   27.39208676311459 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 7929.28827353317
 phi[pipe08_N05_exit03]_outer_lin_approx_11:
   30.13129543942605 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 9594.438810975138
 phi[pipe08_N05_exit03]_outer_lin_approx_12:
   32.87050411573751 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 11418.17511388777
 phi[pipe08_N05_exit03]_outer_lin_approx_13:
   35.60971279204897 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 13400.49718227106
 phi[pipe08_N05_exit03]_outer_lin_approx_14:
   38.34892146836043 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 15541.40501612501
 phi[pipe08_N05_exit03]_outer_lin_approx_15:
   41.08813014467189 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 17840.89861544964
 phi[pipe08_N05_exit03]_outer_lin_approx_16:
   43.82733882098334 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 20298.97798024492
 phi[pipe08_N05_exit03]_outer_lin_approx_17:
   46.56654749729481 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 22915.64311051086
 phi[pipe08_N05_exit03]_outer_lin_approx_18:
   49.30575617360626 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 25690.89400624747
 phi[pipe08_N05_exit03]_outer_lin_approx_19:
   52.04496484991773 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 28624.73066745475
Bounds
 phi[pipe01_entry01_entry03] <= 1100
 phi[pipe02_N01_N02] <= 1100
 phi[pipe03_entry02_N03] <= 1100
 phi[pipe04_N02_exit01] <= 1100
 phi[pipe05_N02_N04] <= 1100
 phi[pipe06_N03_N04] <= 1100
 phi[pipe07_N05_exit02] <= 1100
 phi[pipe08_N05_exit03] <= 1100
 phi[CS01_entry03_N01] <= 1100
 phi[CS02_N04_N05] <= 1100
 psi[N01] <= 3300
 psi[N02] <= 3300
 psi[N04] <= 3300
 psi[N05] <= 3300
 psi[entry01] <= 3300
 psi[entry02] <= 3300
 psi[entry03] <= 3300
 psi[exit01] <= 3300
 psi[exit02] <= 2000
 psi[exit03] <= 2000
End
