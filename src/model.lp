\ Model lp_from_json
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x94df4a4a95e8ade4
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
 phi[pipe01_entry01_entry03]_outer_lin_approx_0:
   8.674160808319622 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 795.1314074292986
 phi[pipe01_entry01_entry03]_outer_lin_approx_1:
   17.34832161663924 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 3180.525629717195
 phi[pipe01_entry01_entry03]_outer_lin_approx_2:
   26.02248242495886 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 7156.182666863688
 phi[pipe01_entry01_entry03]_outer_lin_approx_3:
   34.69664323327849 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 12722.10251886878
 phi[pipe01_entry01_entry03]_outer_lin_approx_4:
   43.37080404159811 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 19878.28518573247
 phi[pipe02_N01_N02]_outer_lin_approx_0:
   8.674160808319622 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 795.1314074292986
 phi[pipe02_N01_N02]_outer_lin_approx_1:
   17.34832161663924 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 3180.525629717195
 phi[pipe02_N01_N02]_outer_lin_approx_2:
   26.02248242495886 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 7156.182666863688
 phi[pipe02_N01_N02]_outer_lin_approx_3:
   34.69664323327849 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 12722.10251886878
 phi[pipe02_N01_N02]_outer_lin_approx_4:
   43.37080404159811 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 19878.28518573247
 phi[pipe03_entry02_N03]_outer_lin_approx_0:
   8.674160808319622 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 795.1314074292987
 phi[pipe03_entry02_N03]_outer_lin_approx_1:
   17.34832161663924 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 3180.525629717195
 phi[pipe03_entry02_N03]_outer_lin_approx_2:
   26.02248242495886 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 7156.182666863688
 phi[pipe03_entry02_N03]_outer_lin_approx_3:
   34.69664323327849 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 12722.10251886878
 phi[pipe03_entry02_N03]_outer_lin_approx_4:
   43.37080404159811 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 19878.28518573247
 phi[pipe04_N02_exit01]_outer_lin_approx_0:
   8.674160808319622 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 795.1314074292986
 phi[pipe04_N02_exit01]_outer_lin_approx_1:
   17.34832161663924 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 3180.525629717195
 phi[pipe04_N02_exit01]_outer_lin_approx_2:
   26.02248242495886 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 7156.182666863688
 phi[pipe04_N02_exit01]_outer_lin_approx_3:
   34.69664323327849 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 12722.10251886878
 phi[pipe04_N02_exit01]_outer_lin_approx_4:
   43.37080404159811 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 19878.28518573247
 phi[pipe05_N02_N04]_outer_lin_approx_0:
   8.674160808319622 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 795.1314074292986
 phi[pipe05_N02_N04]_outer_lin_approx_1:
   17.34832161663924 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 3180.525629717195
 phi[pipe05_N02_N04]_outer_lin_approx_2:
   26.02248242495886 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 7156.182666863688
 phi[pipe05_N02_N04]_outer_lin_approx_3:
   34.69664323327849 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 12722.10251886878
 phi[pipe05_N02_N04]_outer_lin_approx_4:
   43.37080404159811 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 19878.28518573247
 phi[pipe06_N03_N04]_outer_lin_approx_0:
   8.674160808319622 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 795.1314074292986
 phi[pipe06_N03_N04]_outer_lin_approx_1:
   17.34832161663924 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 3180.525629717195
 phi[pipe06_N03_N04]_outer_lin_approx_2:
   26.02248242495886 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 7156.182666863688
 phi[pipe06_N03_N04]_outer_lin_approx_3:
   34.69664323327849 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 12722.10251886878
 phi[pipe06_N03_N04]_outer_lin_approx_4:
   43.37080404159811 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 19878.28518573247
 phi[pipe07_N05_exit02]_outer_lin_approx_0:
   8.674160808319622 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 795.1314074292986
 phi[pipe07_N05_exit02]_outer_lin_approx_1:
   17.34832161663924 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 3180.525629717195
 phi[pipe07_N05_exit02]_outer_lin_approx_2:
   26.02248242495886 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 7156.182666863688
 phi[pipe07_N05_exit02]_outer_lin_approx_3:
   34.69664323327849 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 12722.10251886878
 phi[pipe07_N05_exit02]_outer_lin_approx_4:
   43.37080404159811 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 19878.28518573247
 phi[pipe08_N05_exit03]_outer_lin_approx_0:
   8.674160808319622 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 795.1314074292986
 phi[pipe08_N05_exit03]_outer_lin_approx_1:
   17.34832161663924 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 3180.525629717195
 phi[pipe08_N05_exit03]_outer_lin_approx_2:
   26.02248242495886 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 7156.182666863688
 phi[pipe08_N05_exit03]_outer_lin_approx_3:
   34.69664323327849 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 12722.10251886878
 phi[pipe08_N05_exit03]_outer_lin_approx_4:
   43.37080404159811 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 19878.28518573247
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
