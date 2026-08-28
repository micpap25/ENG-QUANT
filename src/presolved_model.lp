\ Model lp_from_json_pre
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x1f5346d4a7a36202
Minimize
  0.7682072477363071 psi[N05] + 2 psi[entry02] - psi[exit02] - psi[exit03]
   + 1611.17912228469 Constant
Subject To
 phi[pipe02_N01_N02]_outer_lin_approx_0: - psi[entry02] + psi[exit01]
   <= -680.4771027468465
 phi[pipe02_N01_N02]_outer_lin_approx_1:
   - 2.739208676311459 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -1422.946822904953
 phi[pipe02_N01_N02]_outer_lin_approx_2:
   - 5.478417352622918 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2006.830777592395
 phi[pipe02_N01_N02]_outer_lin_approx_3:
   - 8.217626028934378 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2432.128966809174
 phi[pipe02_N01_N02]_outer_lin_approx_4:
   - 10.95683470524584 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2698.84139055529
 phi[pipe02_N01_N02]_outer_lin_approx_5:
   - 13.6960433815573 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2806.968048830743
 phi[pipe02_N01_N02]_outer_lin_approx_6:
   - 16.43525205786876 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2756.508941635532
 phi[pipe02_N01_N02]_outer_lin_approx_7:
   - 19.17446073418022 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2547.464068969658
 phi[pipe02_N01_N02]_outer_lin_approx_8:
   - 21.91366941049167 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2179.833430833119
 phi[pipe02_N01_N02]_outer_lin_approx_9:
   - 24.65287808680313 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -1653.617027225918
 phi[pipe02_N01_N02]_outer_lin_approx_10:
   - 27.39208676311459 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -968.8148581480536
 phi[pipe02_N01_N02]_outer_lin_approx_11:
   - 30.13129543942605 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -125.4269235995243
 phi[pipe02_N01_N02]_outer_lin_approx_12:
   - 32.87050411573751 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= 876.5467764196655
 phi[pipe05_N02_N04]_outer_lin_approx_0: 0.6158963761318464 psi[N05]
   - psi[exit01] <= 845.2360025100105
 phi[pipe05_N02_N04]_outer_lin_approx_1:
   - 2.739208676311459 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 376.6871499830504
 phi[pipe05_N02_N04]_outer_lin_approx_2:
   - 5.478417352622918 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 66.72406292675385
 phi[pipe05_N02_N04]_outer_lin_approx_3:
   - 8.217626028934378 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= -84.65325865887974
 phi[pipe05_N02_N04]_outer_lin_approx_4:
   - 10.95683470524584 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= -77.4448147738492
 phi[pipe05_N02_N04]_outer_lin_approx_5:
   - 13.6960433815573 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 88.34939458184385
 phi[pipe05_N02_N04]_outer_lin_approx_6:
   - 16.43525205786876 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 412.7293694082007
 phi[pipe05_N02_N04]_outer_lin_approx_7:
   - 19.17446073418022 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 895.6951097052208
 phi[pipe05_N02_N04]_outer_lin_approx_8:
   - 21.91366941049167 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 1537.246615472906
 phi[pipe06_N03_N04]_outer_lin_approx_0: 0.6158963761318464 psi[N05]
   - psi[entry02] <= 164.758899763164
 phi[pipe06_N03_N04]_outer_lin_approx_1:
   2.739208676311459 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 244.0517824984956
 phi[pipe06_N03_N04]_outer_lin_approx_2:
   5.478417352622918 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 481.9304307044908
 phi[pipe06_N03_N04]_outer_lin_approx_3:
   8.217626028934378 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 878.3948443811494
 phi[pipe06_N03_N04]_outer_lin_approx_4:
   10.95683470524584 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 1433.445023528471
 phi[pipe06_N03_N04]_outer_lin_approx_5:
   13.6960433815573 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 2147.080968146456
 phi[pipe06_N03_N04]_outer_lin_approx_6:
   16.43525205786876 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 3019.302678235105
 phi[pipe06_N03_N04]_outer_lin_approx_7:
   19.17446073418022 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 4050.110153794417
 phi[pipe07_N05_exit02]_outer_lin_approx_2: - psi[N05] + psi[exit02]
   <= -340.2385513734233
 phi[pipe08_N05_exit03]_outer_lin_approx_1: - psi[N05] + psi[exit03]
   <= -139.8438113695851
Bounds
 phi[pipe06_N03_N04] <= 200
 997.8396074496209 <= psi[N05] <= 3300
 1322.313220147977 <= psi[entry02] <= 3300
 psi[exit01] <= 2391.242545625121
 psi[exit02] <= 2000
 psi[exit03] <= 2000
 Constant = 1
End
