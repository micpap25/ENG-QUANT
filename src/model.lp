\ Model lp_from_json
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0xb5ec5d011ad08703
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
   4.731360440901612 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 236.5680220450806
 phi[pipe01_entry01_entry03]_outer_lin_approx_1:
   9.462720881803223 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 946.2720881803225
 phi[pipe01_entry01_entry03]_outer_lin_approx_2:
   14.19408132270483 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 2129.112198405725
 phi[pipe01_entry01_entry03]_outer_lin_approx_3:
   18.92544176360645 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 3785.088352721289
 phi[pipe01_entry01_entry03]_outer_lin_approx_4:
   23.65680220450806 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 5914.200551127014
 phi[pipe01_entry01_entry03]_outer_lin_approx_5:
   28.38816264540967 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 8516.4487936229
 phi[pipe01_entry01_entry03]_outer_lin_approx_6:
   33.11952308631128 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 11591.83308020895
 phi[pipe01_entry01_entry03]_outer_lin_approx_7:
   37.85088352721289 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 15140.35341088516
 phi[pipe01_entry01_entry03]_outer_lin_approx_8:
   42.5822439681145 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 19162.00978565153
 phi[pipe01_entry01_entry03]_outer_lin_approx_9:
   47.31360440901611 phi[pipe01_entry01_entry03] - psi[entry01]
   + psi[entry03] <= 23656.80220450806
 phi[pipe02_N01_N02]_outer_lin_approx_0:
   4.731360440901612 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 236.5680220450806
 phi[pipe02_N01_N02]_outer_lin_approx_1:
   9.462720881803223 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 946.2720881803225
 phi[pipe02_N01_N02]_outer_lin_approx_2:
   14.19408132270483 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 2129.112198405725
 phi[pipe02_N01_N02]_outer_lin_approx_3:
   18.92544176360645 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 3785.088352721289
 phi[pipe02_N01_N02]_outer_lin_approx_4:
   23.65680220450806 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 5914.200551127014
 phi[pipe02_N01_N02]_outer_lin_approx_5:
   28.38816264540967 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 8516.4487936229
 phi[pipe02_N01_N02]_outer_lin_approx_6:
   33.11952308631128 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 11591.83308020895
 phi[pipe02_N01_N02]_outer_lin_approx_7:
   37.85088352721289 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 15140.35341088516
 phi[pipe02_N01_N02]_outer_lin_approx_8:
   42.5822439681145 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 19162.00978565153
 phi[pipe02_N01_N02]_outer_lin_approx_9:
   47.31360440901611 phi[pipe02_N01_N02] - psi[N01] + psi[N02]
   <= 23656.80220450806
 phi[pipe03_entry02_N03]_outer_lin_approx_0:
   4.731360440901612 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 236.5680220450806
 phi[pipe03_entry02_N03]_outer_lin_approx_1:
   9.462720881803223 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 946.2720881803223
 phi[pipe03_entry02_N03]_outer_lin_approx_2:
   14.19408132270483 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 2129.112198405725
 phi[pipe03_entry02_N03]_outer_lin_approx_3:
   18.92544176360645 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 3785.088352721289
 phi[pipe03_entry02_N03]_outer_lin_approx_4:
   23.65680220450806 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 5914.200551127014
 phi[pipe03_entry02_N03]_outer_lin_approx_5:
   28.38816264540967 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 8516.4487936229
 phi[pipe03_entry02_N03]_outer_lin_approx_6:
   33.11952308631128 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 11591.83308020895
 phi[pipe03_entry02_N03]_outer_lin_approx_7:
   37.85088352721289 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 15140.35341088516
 phi[pipe03_entry02_N03]_outer_lin_approx_8:
   42.5822439681145 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 19162.00978565153
 phi[pipe03_entry02_N03]_outer_lin_approx_9:
   47.31360440901611 phi[pipe03_entry02_N03] + psi[N01] - psi[entry02]
   <= 23656.80220450806
 phi[pipe04_N02_exit01]_outer_lin_approx_0:
   4.731360440901612 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 236.5680220450806
 phi[pipe04_N02_exit01]_outer_lin_approx_1:
   9.462720881803223 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 946.2720881803225
 phi[pipe04_N02_exit01]_outer_lin_approx_2:
   14.19408132270483 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 2129.112198405725
 phi[pipe04_N02_exit01]_outer_lin_approx_3:
   18.92544176360645 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 3785.088352721289
 phi[pipe04_N02_exit01]_outer_lin_approx_4:
   23.65680220450806 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 5914.200551127014
 phi[pipe04_N02_exit01]_outer_lin_approx_5:
   28.38816264540967 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 8516.4487936229
 phi[pipe04_N02_exit01]_outer_lin_approx_6:
   33.11952308631128 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 11591.83308020895
 phi[pipe04_N02_exit01]_outer_lin_approx_7:
   37.85088352721289 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 15140.35341088516
 phi[pipe04_N02_exit01]_outer_lin_approx_8:
   42.5822439681145 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 19162.00978565153
 phi[pipe04_N02_exit01]_outer_lin_approx_9:
   47.31360440901611 phi[pipe04_N02_exit01] - psi[N02] + psi[exit01]
   <= 23656.80220450806
 phi[pipe05_N02_N04]_outer_lin_approx_0:
   4.731360440901612 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 236.5680220450806
 phi[pipe05_N02_N04]_outer_lin_approx_1:
   9.462720881803223 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 946.2720881803225
 phi[pipe05_N02_N04]_outer_lin_approx_2:
   14.19408132270483 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 2129.112198405725
 phi[pipe05_N02_N04]_outer_lin_approx_3:
   18.92544176360645 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 3785.088352721289
 phi[pipe05_N02_N04]_outer_lin_approx_4:
   23.65680220450806 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 5914.200551127014
 phi[pipe05_N02_N04]_outer_lin_approx_5:
   28.38816264540967 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 8516.4487936229
 phi[pipe05_N02_N04]_outer_lin_approx_6:
   33.11952308631128 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 11591.83308020895
 phi[pipe05_N02_N04]_outer_lin_approx_7:
   37.85088352721289 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 15140.35341088516
 phi[pipe05_N02_N04]_outer_lin_approx_8:
   42.5822439681145 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 19162.00978565153
 phi[pipe05_N02_N04]_outer_lin_approx_9:
   47.31360440901611 phi[pipe05_N02_N04] - psi[N02] + psi[N04]
   <= 23656.80220450806
 phi[pipe06_N03_N04]_outer_lin_approx_0:
   4.731360440901612 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 236.5680220450806
 phi[pipe06_N03_N04]_outer_lin_approx_1:
   9.462720881803223 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 946.2720881803225
 phi[pipe06_N03_N04]_outer_lin_approx_2:
   14.19408132270483 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 2129.112198405725
 phi[pipe06_N03_N04]_outer_lin_approx_3:
   18.92544176360645 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 3785.088352721289
 phi[pipe06_N03_N04]_outer_lin_approx_4:
   23.65680220450806 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 5914.200551127014
 phi[pipe06_N03_N04]_outer_lin_approx_5:
   28.38816264540967 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 8516.4487936229
 phi[pipe06_N03_N04]_outer_lin_approx_6:
   33.11952308631128 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 11591.83308020895
 phi[pipe06_N03_N04]_outer_lin_approx_7:
   37.85088352721289 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 15140.35341088516
 phi[pipe06_N03_N04]_outer_lin_approx_8:
   42.5822439681145 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 19162.00978565153
 phi[pipe06_N03_N04]_outer_lin_approx_9:
   47.31360440901611 phi[pipe06_N03_N04] - psi[N01] + psi[N04]
   <= 23656.80220450806
 phi[pipe07_N05_exit02]_outer_lin_approx_0:
   4.731360440901612 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 236.5680220450806
 phi[pipe07_N05_exit02]_outer_lin_approx_1:
   9.462720881803223 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 946.2720881803225
 phi[pipe07_N05_exit02]_outer_lin_approx_2:
   14.19408132270483 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 2129.112198405725
 phi[pipe07_N05_exit02]_outer_lin_approx_3:
   18.92544176360645 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 3785.088352721289
 phi[pipe07_N05_exit02]_outer_lin_approx_4:
   23.65680220450806 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 5914.200551127014
 phi[pipe07_N05_exit02]_outer_lin_approx_5:
   28.38816264540967 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 8516.4487936229
 phi[pipe07_N05_exit02]_outer_lin_approx_6:
   33.11952308631128 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 11591.83308020895
 phi[pipe07_N05_exit02]_outer_lin_approx_7:
   37.85088352721289 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 15140.35341088516
 phi[pipe07_N05_exit02]_outer_lin_approx_8:
   42.5822439681145 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 19162.00978565153
 phi[pipe07_N05_exit02]_outer_lin_approx_9:
   47.31360440901611 phi[pipe07_N05_exit02] - psi[N05] + psi[exit02]
   <= 23656.80220450806
 phi[pipe08_N05_exit03]_outer_lin_approx_0:
   4.731360440901612 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 236.5680220450806
 phi[pipe08_N05_exit03]_outer_lin_approx_1:
   9.462720881803223 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 946.2720881803225
 phi[pipe08_N05_exit03]_outer_lin_approx_2:
   14.19408132270483 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 2129.112198405725
 phi[pipe08_N05_exit03]_outer_lin_approx_3:
   18.92544176360645 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 3785.088352721289
 phi[pipe08_N05_exit03]_outer_lin_approx_4:
   23.65680220450806 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 5914.200551127014
 phi[pipe08_N05_exit03]_outer_lin_approx_5:
   28.38816264540967 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 8516.4487936229
 phi[pipe08_N05_exit03]_outer_lin_approx_6:
   33.11952308631128 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 11591.83308020895
 phi[pipe08_N05_exit03]_outer_lin_approx_7:
   37.85088352721289 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 15140.35341088516
 phi[pipe08_N05_exit03]_outer_lin_approx_8:
   42.5822439681145 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 19162.00978565153
 phi[pipe08_N05_exit03]_outer_lin_approx_9:
   47.31360440901611 phi[pipe08_N05_exit03] - psi[N05] + psi[exit03]
   <= 23656.80220450806
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
