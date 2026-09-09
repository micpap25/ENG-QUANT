\ Model lp_from_json_pre
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x7c8fc81815dde4b5
Minimize
  0.7682072477363071 psi[N05] + 2 psi[entry02] - psi[exit02] - psi[exit03]
   + 1607.64043165022 Constant
Subject To
 phi[pipe02_N01_N02]_outer_lin_approx_0:
   - 4.731360440901612 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -1845.230571951628
 phi[pipe02_N01_N02]_outer_lin_approx_1:
   - 9.462720881803223 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2554.93463808687
 phi[pipe02_N01_N02]_outer_lin_approx_2:
   - 14.19408132270483 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2791.502660131951
 phi[pipe02_N01_N02]_outer_lin_approx_3:
   - 18.92544176360645 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2554.934638086871
 phi[pipe02_N01_N02]_outer_lin_approx_4:
   - 23.65680220450806 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -1845.230571951628
 phi[pipe02_N01_N02]_outer_lin_approx_5:
   - 28.38816264540967 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -662.390461726226
 phi[pipe02_N01_N02]_outer_lin_approx_6:
   - 33.11952308631128 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= 993.5856925893386
 phi[pipe05_N02_N04]_outer_lin_approx_0:
   - 4.731360440901612 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 141.4297540988844
 phi[pipe05_N02_N04]_outer_lin_approx_1:
   - 9.462720881803223 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= -95.13826794619604
 phi[pipe05_N02_N04]_outer_lin_approx_2:
   - 14.19408132270483 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 141.4297540988839
 phi[pipe05_N02_N04]_outer_lin_approx_3:
   - 18.92544176360645 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 851.1338202341256
 phi[pipe06_N03_N04]_outer_lin_approx_0:
   4.731360440901612 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 425.3113805529812
 phi[pipe06_N03_N04]_outer_lin_approx_1:
   9.462720881803223 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 1135.015446688223
 phi[pipe06_N03_N04]_outer_lin_approx_2:
   14.19408132270483 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 2317.855556913625
 phi[pipe06_N03_N04]_outer_lin_approx_3:
   18.92544176360645 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 3973.83171122919
 phi[pipe07_N05_exit02]_outer_lin_approx_0: - psi[N05] + psi[exit02]
   <= -331.1952308631128
 phi[pipe08_N05_exit03]_outer_lin_approx_0: - psi[N05] + psi[exit03]
   <= -141.9408132270483
Bounds
 phi[pipe06_N03_N04] <= 200
 997.8396074496209 <= psi[N05] <= 3300
 1298.328761403241 <= psi[entry02] <= 3300
 psi[exit01] <= 2403.443557744923
 psi[exit02] <= 2000
 psi[exit03] <= 2000
 Constant = 1
End
