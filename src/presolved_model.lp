\ Model lp_from_json_pre
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0xd4e9de832e5be386
Minimize
  0.7682072477363071 psi[N05] + 2 psi[entry02] - psi[exit02] - psi[exit03]
   + 1474.899485947147 Constant
Subject To
 phi[pipe02_N01_N02]_outer_lin_approx_0:
   - 8.674160808319622 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2298.6526142047
 phi[pipe02_N01_N02]_outer_lin_approx_1:
   - 17.34832161663924 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -2515.50663441269
 phi[pipe02_N01_N02]_outer_lin_approx_2:
   - 26.02248242495886 phi[pipe06_N03_N04] - psi[entry02] + psi[exit01]
   <= -1142.097839762082
 phi[pipe05_N02_N04]_outer_lin_approx_0:
   - 8.674160808319622 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= -252.8502826429166
 phi[pipe05_N02_N04]_outer_lin_approx_1:
   - 17.34832161663924 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[exit01] <= 397.7117779810549
 phi[pipe06_N03_N04]_outer_lin_approx_0:
   8.674160808319622 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 990.446099882896
 phi[pipe06_N03_N04]_outer_lin_approx_1:
   17.34832161663924 phi[pipe06_N03_N04] + 0.6158963761318464 psi[N05]
   - psi[entry02] <= 3375.840322170792
 phi[pipe07_N05_exit02]_outer_lin_approx_0: - psi[N05] + psi[exit02]
   <= -245.767889569056
 phi[pipe08_N05_exit03]_outer_lin_approx_0: - psi[N05] + psi[exit03]
   <= 101.1985427637289
Bounds
 phi[pipe06_N03_N04] <= 200
 997.8396074496209 <= psi[N05] <= 3300
 1291.757427457544 <= psi[entry02] <= 3300
 psi[exit01] <= 2738.916727006684
 psi[exit02] <= 2000
 psi[exit03] <= 2000
 Constant = 1
End
