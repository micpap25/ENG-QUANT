\ Model lp_from_json
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x3c2b7806c98a5e6e
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
 fixed_pressure[entry01]: psi[entry01] = 2640
 compressor_active_pressure_ratio[CS01_entry03_N01]: psi[N01]
   - 1.54531645107631 psi[entry03] = 872.5063217220954
 compressor_active_pressure_ratio[CS02_N04_N05]:
   - 1.623649754656013 psi[N04] + psi[N05] = 997.8396074496209
 pipe_forward_weymouth[pipe01_entry01_entry03]: - psi[entry01]
   + psi[entry03] + z_phi[pipe01_entry01_entry03] <= 0
 pipe_forward_weymouth[pipe02_N01_N02]: - psi[N01] + psi[N02]
   + z_phi[pipe02_N01_N02] <= 0
 pipe_forward_weymouth[pipe03_entry02_N03]: psi[N01] - psi[entry02]
   + z_phi[pipe03_entry02_N03] <= 0
 pipe_forward_weymouth[pipe04_N02_exit01]: - psi[N02] + psi[exit01]
   + z_phi[pipe04_N02_exit01] <= 0
 pipe_forward_weymouth[pipe05_N02_N04]: - psi[N02] + psi[N04]
   + z_phi[pipe05_N02_N04] <= 0
 pipe_forward_weymouth[pipe06_N03_N04]: - psi[N01] + psi[N04]
   + z_phi[pipe06_N03_N04] <= 0
 pipe_forward_weymouth[pipe07_N05_exit02]: - psi[N05] + psi[exit02]
   + z_phi[pipe07_N05_exit02] <= 0
 pipe_forward_weymouth[pipe08_N05_exit03]: - psi[N05] + psi[exit03]
   + z_phi[pipe08_N05_exit03] <= 0
 sum_production_flows_upper[entry01]: phi[pipe01_entry01_entry03] <= 750
 sum_production_flows_lower[entry01]: phi[pipe01_entry01_entry03] >= 50
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_0:
   - z_phi[pipe01_entry01_entry03] <= 0
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_1:
   0.5257067156557346 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 2.920592864754081
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_2:
   1.051413431311469 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 11.68237145901632
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_3:
   1.577120146967204 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 26.28533578278672
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_4:
   2.102826862622938 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 46.72948583606529
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_5:
   2.628533578278673 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 73.01482161885203
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_6:
   3.154240293934407 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 105.1413431311469
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_7:
   3.679947009590142 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 143.10905037295
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_8:
   4.205653725245877 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 186.9179433442612
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_9:
   4.731360440901612 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 236.5680220450806
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_10:
   5.257067156557346 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 292.0592864754081
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_11:
   5.78277387221308 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 353.3917366352438
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_12:
   6.308480587868814 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 420.5653725245876
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_13:
   6.83418730352455 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 493.5801941434396
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_14:
   7.359894019180284 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 572.4362014917998
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_15:
   7.885600734836019 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 657.1333945696682
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_16:
   8.411307450491753 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 747.6717733770447
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_17:
   8.937014166147488 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 844.0513379139294
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_18:
   9.462720881803223 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 946.2720881803223
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_19:
   9.988427597458958 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 1054.334024176223
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_20:
   10.51413431311469 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 1168.237145901632
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_21:
   11.03984102877043 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 1287.98145335655
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_22:
   11.56554774442616 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 1413.566946540975
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_23:
   12.0912544600819 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 1544.993625454909
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_24:
   12.61696117573763 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 1682.26149009835
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_25:
   13.14266789139337 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 1825.370540471301
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_26:
   13.6683746070491 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 1974.320776573758
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_27:
   14.19408132270483 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 2129.112198405725
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_28:
   14.71978803836057 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 2289.744805967199
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_29:
   15.2454947540163 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 2456.218599258182
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_30:
   15.77120146967204 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 2628.533578278673
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_31:
   16.29690818532777 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 2806.689743028672
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_32:
   16.82261490098351 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 2990.687093508179
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_33:
   17.34832161663924 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 3180.525629717194
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_34:
   17.87402833229498 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 3376.205351655718
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_35:
   18.39973504795071 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 3577.726259323749
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_36:
   18.92544176360645 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 3785.088352721289
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_37:
   19.45114847926218 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 3998.291631848337
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_38:
   19.97685519491792 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 4217.336096704893
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_39:
   20.50256191057365 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 4442.221747290957
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_40:
   21.02826862622938 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 4672.94858360653
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_41:
   21.55397534188512 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 4909.51660565161
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_42:
   22.07968205754085 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 5151.925813426198
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_43:
   22.60538877319659 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 5400.176206930296
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_44:
   23.13109548885232 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 5654.2677861639
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_45:
   23.65680220450806 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 5914.200551127014
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_46:
   24.18250892016379 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 6179.974501819635
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_47:
   24.70821563581952 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 6451.589638241764
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_48:
   25.23392235147526 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 6729.045960393401
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_49:
   25.759629067131 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 7012.343468274549
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_50:
   26.28533578278673 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 7301.482161885203
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_51:
   26.81104249844246 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 7596.462041225364
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_52:
   27.3367492140982 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 7897.283106295034
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_53:
   27.86245592975393 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 8203.945357094215
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_54:
   28.38816264540967 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 8516.4487936229
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_55:
   28.9138693610654 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 8834.793415881095
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_56:
   29.43957607672113 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 9158.979223868797
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_57:
   29.96528279237687 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 9489.006217586008
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_58:
   30.49098950803261 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 9824.874397032729
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_59:
   31.01669622368834 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 10166.58376220896
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_60:
   31.54240293934408 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 10514.13431311469
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_61:
   32.06810965499981 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 10867.52604974993
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_62:
   32.59381637065555 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 11226.75897211469
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_63:
   33.11952308631128 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 11591.83308020895
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_64:
   33.64522980196701 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 11962.74837403272
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_65:
   34.17093651762275 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 12339.50485358599
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_66:
   34.69664323327848 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 12722.10251886877
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_67:
   35.22234994893422 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 13110.54136988107
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_68:
   35.74805666458995 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 13504.82140662287
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_69:
   36.27376338024568 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 13904.94262909418
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_70:
   36.79947009590142 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 14310.905037295
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_71:
   37.32517681155716 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 14722.70863122533
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_72:
   37.85088352721289 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 15140.35341088516
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_73:
   38.37659024286862 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 15563.8393762745
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_74:
   38.90229695852436 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 15993.16652739335
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_75:
   39.42800367418009 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 16428.3348642417
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_76:
   39.95371038983583 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 16869.34438681957
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_77:
   40.47941710549156 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 17316.19509512695
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_78:
   41.0051238211473 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 17768.88698916383
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_79:
   41.53083053680303 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 18227.42006893022
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_80:
   42.05653725245877 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 18691.79433442612
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_81:
   42.5822439681145 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 19162.00978565153
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_82:
   43.10795068377023 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 19638.06642260644
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_83:
   43.63365739942597 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 20119.96424529086
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_84:
   44.1593641150817 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 20607.70325370479
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_85:
   44.68507083073744 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 21101.28344784824
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_86:
   45.21077754639317 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 21600.70482772118
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_87:
   45.73648426204891 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 22105.96739332364
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_88:
   46.26219097770464 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 22617.0711446556
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_89:
   46.78789769336038 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 23134.01608171707
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_90:
   47.31360440901611 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 23656.80220450806
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_91:
   47.83931112467184 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 24185.42951302855
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_92:
   48.36501784032758 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 24719.89800727854
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_93:
   48.89072455598332 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 25260.20768725804
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_94:
   49.41643127163905 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 25806.35855296706
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_95:
   49.94213798729479 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 26358.35060440558
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_96:
   50.46784470295052 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 26916.18384157361
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_97:
   50.99355141860626 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 27479.85826447115
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_98:
   51.519258134262 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 28049.3738730982
 z_phi[pipe01_entry01_entry03]_outer_lin_approx_99:
   52.04496484991773 phi[pipe01_entry01_entry03]
   - z_phi[pipe01_entry01_entry03] <= 28624.73066745475
 z_phi[pipe02_N01_N02]_outer_lin_approx_0: - z_phi[pipe02_N01_N02] <= 0
 z_phi[pipe02_N01_N02]_outer_lin_approx_1:
   0.5257067156557346 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 2.920592864754081
 z_phi[pipe02_N01_N02]_outer_lin_approx_2:
   1.051413431311469 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 11.68237145901632
 z_phi[pipe02_N01_N02]_outer_lin_approx_3:
   1.577120146967204 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 26.28533578278672
 z_phi[pipe02_N01_N02]_outer_lin_approx_4:
   2.102826862622938 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 46.72948583606529
 z_phi[pipe02_N01_N02]_outer_lin_approx_5:
   2.628533578278673 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 73.01482161885203
 z_phi[pipe02_N01_N02]_outer_lin_approx_6:
   3.154240293934407 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 105.1413431311469
 z_phi[pipe02_N01_N02]_outer_lin_approx_7:
   3.679947009590142 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 143.10905037295
 z_phi[pipe02_N01_N02]_outer_lin_approx_8:
   4.205653725245877 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 186.9179433442612
 z_phi[pipe02_N01_N02]_outer_lin_approx_9:
   4.731360440901612 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 236.5680220450806
 z_phi[pipe02_N01_N02]_outer_lin_approx_10:
   5.257067156557346 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 292.0592864754081
 z_phi[pipe02_N01_N02]_outer_lin_approx_11:
   5.78277387221308 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 353.3917366352438
 z_phi[pipe02_N01_N02]_outer_lin_approx_12:
   6.308480587868814 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 420.5653725245876
 z_phi[pipe02_N01_N02]_outer_lin_approx_13:
   6.83418730352455 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 493.5801941434396
 z_phi[pipe02_N01_N02]_outer_lin_approx_14:
   7.359894019180284 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 572.4362014917998
 z_phi[pipe02_N01_N02]_outer_lin_approx_15:
   7.885600734836019 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 657.1333945696682
 z_phi[pipe02_N01_N02]_outer_lin_approx_16:
   8.411307450491753 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 747.6717733770447
 z_phi[pipe02_N01_N02]_outer_lin_approx_17:
   8.937014166147488 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 844.0513379139294
 z_phi[pipe02_N01_N02]_outer_lin_approx_18:
   9.462720881803223 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 946.2720881803223
 z_phi[pipe02_N01_N02]_outer_lin_approx_19:
   9.988427597458958 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 1054.334024176223
 z_phi[pipe02_N01_N02]_outer_lin_approx_20:
   10.51413431311469 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 1168.237145901632
 z_phi[pipe02_N01_N02]_outer_lin_approx_21:
   11.03984102877043 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 1287.98145335655
 z_phi[pipe02_N01_N02]_outer_lin_approx_22:
   11.56554774442616 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 1413.566946540975
 z_phi[pipe02_N01_N02]_outer_lin_approx_23:
   12.0912544600819 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 1544.993625454909
 z_phi[pipe02_N01_N02]_outer_lin_approx_24:
   12.61696117573763 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 1682.26149009835
 z_phi[pipe02_N01_N02]_outer_lin_approx_25:
   13.14266789139337 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 1825.370540471301
 z_phi[pipe02_N01_N02]_outer_lin_approx_26:
   13.6683746070491 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 1974.320776573758
 z_phi[pipe02_N01_N02]_outer_lin_approx_27:
   14.19408132270483 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 2129.112198405725
 z_phi[pipe02_N01_N02]_outer_lin_approx_28:
   14.71978803836057 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 2289.744805967199
 z_phi[pipe02_N01_N02]_outer_lin_approx_29:
   15.2454947540163 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 2456.218599258182
 z_phi[pipe02_N01_N02]_outer_lin_approx_30:
   15.77120146967204 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 2628.533578278673
 z_phi[pipe02_N01_N02]_outer_lin_approx_31:
   16.29690818532777 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 2806.689743028672
 z_phi[pipe02_N01_N02]_outer_lin_approx_32:
   16.82261490098351 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 2990.687093508179
 z_phi[pipe02_N01_N02]_outer_lin_approx_33:
   17.34832161663924 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 3180.525629717194
 z_phi[pipe02_N01_N02]_outer_lin_approx_34:
   17.87402833229498 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 3376.205351655718
 z_phi[pipe02_N01_N02]_outer_lin_approx_35:
   18.39973504795071 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 3577.726259323749
 z_phi[pipe02_N01_N02]_outer_lin_approx_36:
   18.92544176360645 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 3785.088352721289
 z_phi[pipe02_N01_N02]_outer_lin_approx_37:
   19.45114847926218 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 3998.291631848337
 z_phi[pipe02_N01_N02]_outer_lin_approx_38:
   19.97685519491792 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 4217.336096704893
 z_phi[pipe02_N01_N02]_outer_lin_approx_39:
   20.50256191057365 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 4442.221747290957
 z_phi[pipe02_N01_N02]_outer_lin_approx_40:
   21.02826862622938 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 4672.94858360653
 z_phi[pipe02_N01_N02]_outer_lin_approx_41:
   21.55397534188512 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 4909.51660565161
 z_phi[pipe02_N01_N02]_outer_lin_approx_42:
   22.07968205754085 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 5151.925813426198
 z_phi[pipe02_N01_N02]_outer_lin_approx_43:
   22.60538877319659 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 5400.176206930296
 z_phi[pipe02_N01_N02]_outer_lin_approx_44:
   23.13109548885232 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 5654.2677861639
 z_phi[pipe02_N01_N02]_outer_lin_approx_45:
   23.65680220450806 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 5914.200551127014
 z_phi[pipe02_N01_N02]_outer_lin_approx_46:
   24.18250892016379 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 6179.974501819635
 z_phi[pipe02_N01_N02]_outer_lin_approx_47:
   24.70821563581952 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 6451.589638241764
 z_phi[pipe02_N01_N02]_outer_lin_approx_48:
   25.23392235147526 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 6729.045960393401
 z_phi[pipe02_N01_N02]_outer_lin_approx_49:
   25.759629067131 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 7012.343468274549
 z_phi[pipe02_N01_N02]_outer_lin_approx_50:
   26.28533578278673 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 7301.482161885203
 z_phi[pipe02_N01_N02]_outer_lin_approx_51:
   26.81104249844246 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 7596.462041225364
 z_phi[pipe02_N01_N02]_outer_lin_approx_52:
   27.3367492140982 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 7897.283106295034
 z_phi[pipe02_N01_N02]_outer_lin_approx_53:
   27.86245592975393 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 8203.945357094215
 z_phi[pipe02_N01_N02]_outer_lin_approx_54:
   28.38816264540967 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 8516.4487936229
 z_phi[pipe02_N01_N02]_outer_lin_approx_55:
   28.9138693610654 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 8834.793415881095
 z_phi[pipe02_N01_N02]_outer_lin_approx_56:
   29.43957607672113 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 9158.979223868797
 z_phi[pipe02_N01_N02]_outer_lin_approx_57:
   29.96528279237687 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 9489.006217586008
 z_phi[pipe02_N01_N02]_outer_lin_approx_58:
   30.49098950803261 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 9824.874397032729
 z_phi[pipe02_N01_N02]_outer_lin_approx_59:
   31.01669622368834 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 10166.58376220896
 z_phi[pipe02_N01_N02]_outer_lin_approx_60:
   31.54240293934408 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 10514.13431311469
 z_phi[pipe02_N01_N02]_outer_lin_approx_61:
   32.06810965499981 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 10867.52604974993
 z_phi[pipe02_N01_N02]_outer_lin_approx_62:
   32.59381637065555 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 11226.75897211469
 z_phi[pipe02_N01_N02]_outer_lin_approx_63:
   33.11952308631128 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 11591.83308020895
 z_phi[pipe02_N01_N02]_outer_lin_approx_64:
   33.64522980196701 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 11962.74837403272
 z_phi[pipe02_N01_N02]_outer_lin_approx_65:
   34.17093651762275 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 12339.50485358599
 z_phi[pipe02_N01_N02]_outer_lin_approx_66:
   34.69664323327848 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 12722.10251886877
 z_phi[pipe02_N01_N02]_outer_lin_approx_67:
   35.22234994893422 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 13110.54136988107
 z_phi[pipe02_N01_N02]_outer_lin_approx_68:
   35.74805666458995 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 13504.82140662287
 z_phi[pipe02_N01_N02]_outer_lin_approx_69:
   36.27376338024568 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 13904.94262909418
 z_phi[pipe02_N01_N02]_outer_lin_approx_70:
   36.79947009590142 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 14310.905037295
 z_phi[pipe02_N01_N02]_outer_lin_approx_71:
   37.32517681155716 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 14722.70863122533
 z_phi[pipe02_N01_N02]_outer_lin_approx_72:
   37.85088352721289 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 15140.35341088516
 z_phi[pipe02_N01_N02]_outer_lin_approx_73:
   38.37659024286862 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 15563.8393762745
 z_phi[pipe02_N01_N02]_outer_lin_approx_74:
   38.90229695852436 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 15993.16652739335
 z_phi[pipe02_N01_N02]_outer_lin_approx_75:
   39.42800367418009 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 16428.3348642417
 z_phi[pipe02_N01_N02]_outer_lin_approx_76:
   39.95371038983583 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 16869.34438681957
 z_phi[pipe02_N01_N02]_outer_lin_approx_77:
   40.47941710549156 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 17316.19509512695
 z_phi[pipe02_N01_N02]_outer_lin_approx_78:
   41.0051238211473 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 17768.88698916383
 z_phi[pipe02_N01_N02]_outer_lin_approx_79:
   41.53083053680303 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 18227.42006893022
 z_phi[pipe02_N01_N02]_outer_lin_approx_80:
   42.05653725245877 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 18691.79433442612
 z_phi[pipe02_N01_N02]_outer_lin_approx_81:
   42.5822439681145 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 19162.00978565153
 z_phi[pipe02_N01_N02]_outer_lin_approx_82:
   43.10795068377023 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 19638.06642260644
 z_phi[pipe02_N01_N02]_outer_lin_approx_83:
   43.63365739942597 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 20119.96424529086
 z_phi[pipe02_N01_N02]_outer_lin_approx_84:
   44.1593641150817 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 20607.70325370479
 z_phi[pipe02_N01_N02]_outer_lin_approx_85:
   44.68507083073744 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 21101.28344784824
 z_phi[pipe02_N01_N02]_outer_lin_approx_86:
   45.21077754639317 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 21600.70482772118
 z_phi[pipe02_N01_N02]_outer_lin_approx_87:
   45.73648426204891 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 22105.96739332364
 z_phi[pipe02_N01_N02]_outer_lin_approx_88:
   46.26219097770464 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 22617.0711446556
 z_phi[pipe02_N01_N02]_outer_lin_approx_89:
   46.78789769336038 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 23134.01608171707
 z_phi[pipe02_N01_N02]_outer_lin_approx_90:
   47.31360440901611 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 23656.80220450806
 z_phi[pipe02_N01_N02]_outer_lin_approx_91:
   47.83931112467184 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 24185.42951302855
 z_phi[pipe02_N01_N02]_outer_lin_approx_92:
   48.36501784032758 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 24719.89800727854
 z_phi[pipe02_N01_N02]_outer_lin_approx_93:
   48.89072455598332 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 25260.20768725804
 z_phi[pipe02_N01_N02]_outer_lin_approx_94:
   49.41643127163905 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 25806.35855296706
 z_phi[pipe02_N01_N02]_outer_lin_approx_95:
   49.94213798729479 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 26358.35060440558
 z_phi[pipe02_N01_N02]_outer_lin_approx_96:
   50.46784470295052 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 26916.18384157361
 z_phi[pipe02_N01_N02]_outer_lin_approx_97:
   50.99355141860626 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 27479.85826447115
 z_phi[pipe02_N01_N02]_outer_lin_approx_98:
   51.519258134262 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 28049.3738730982
 z_phi[pipe02_N01_N02]_outer_lin_approx_99:
   52.04496484991773 phi[pipe02_N01_N02] - z_phi[pipe02_N01_N02]
   <= 28624.73066745475
 z_phi[pipe03_entry02_N03]_outer_lin_approx_0: - z_phi[pipe03_entry02_N03]
   <= 0
 z_phi[pipe03_entry02_N03]_outer_lin_approx_1:
   0.5257067156557346 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 2.920592864754081
 z_phi[pipe03_entry02_N03]_outer_lin_approx_2:
   1.051413431311469 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 11.68237145901632
 z_phi[pipe03_entry02_N03]_outer_lin_approx_3:
   1.577120146967204 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 26.28533578278672
 z_phi[pipe03_entry02_N03]_outer_lin_approx_4:
   2.102826862622938 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 46.72948583606529
 z_phi[pipe03_entry02_N03]_outer_lin_approx_5:
   2.628533578278673 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 73.01482161885203
 z_phi[pipe03_entry02_N03]_outer_lin_approx_6:
   3.154240293934407 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 105.1413431311469
 z_phi[pipe03_entry02_N03]_outer_lin_approx_7:
   3.679947009590142 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 143.10905037295
 z_phi[pipe03_entry02_N03]_outer_lin_approx_8:
   4.205653725245877 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 186.9179433442612
 z_phi[pipe03_entry02_N03]_outer_lin_approx_9:
   4.731360440901612 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 236.5680220450806
 z_phi[pipe03_entry02_N03]_outer_lin_approx_10:
   5.257067156557346 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 292.0592864754081
 z_phi[pipe03_entry02_N03]_outer_lin_approx_11:
   5.78277387221308 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 353.3917366352438
 z_phi[pipe03_entry02_N03]_outer_lin_approx_12:
   6.308480587868814 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 420.5653725245876
 z_phi[pipe03_entry02_N03]_outer_lin_approx_13:
   6.83418730352455 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 493.5801941434396
 z_phi[pipe03_entry02_N03]_outer_lin_approx_14:
   7.359894019180284 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 572.4362014917998
 z_phi[pipe03_entry02_N03]_outer_lin_approx_15:
   7.885600734836019 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 657.1333945696682
 z_phi[pipe03_entry02_N03]_outer_lin_approx_16:
   8.411307450491753 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 747.6717733770447
 z_phi[pipe03_entry02_N03]_outer_lin_approx_17:
   8.937014166147488 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 844.0513379139294
 z_phi[pipe03_entry02_N03]_outer_lin_approx_18:
   9.462720881803223 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 946.2720881803223
 z_phi[pipe03_entry02_N03]_outer_lin_approx_19:
   9.988427597458958 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 1054.334024176223
 z_phi[pipe03_entry02_N03]_outer_lin_approx_20:
   10.51413431311469 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 1168.237145901632
 z_phi[pipe03_entry02_N03]_outer_lin_approx_21:
   11.03984102877043 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 1287.98145335655
 z_phi[pipe03_entry02_N03]_outer_lin_approx_22:
   11.56554774442616 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 1413.566946540975
 z_phi[pipe03_entry02_N03]_outer_lin_approx_23:
   12.0912544600819 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 1544.993625454909
 z_phi[pipe03_entry02_N03]_outer_lin_approx_24:
   12.61696117573763 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 1682.26149009835
 z_phi[pipe03_entry02_N03]_outer_lin_approx_25:
   13.14266789139337 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 1825.370540471301
 z_phi[pipe03_entry02_N03]_outer_lin_approx_26:
   13.6683746070491 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 1974.320776573758
 z_phi[pipe03_entry02_N03]_outer_lin_approx_27:
   14.19408132270483 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 2129.112198405725
 z_phi[pipe03_entry02_N03]_outer_lin_approx_28:
   14.71978803836057 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 2289.744805967199
 z_phi[pipe03_entry02_N03]_outer_lin_approx_29:
   15.2454947540163 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 2456.218599258182
 z_phi[pipe03_entry02_N03]_outer_lin_approx_30:
   15.77120146967204 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 2628.533578278673
 z_phi[pipe03_entry02_N03]_outer_lin_approx_31:
   16.29690818532777 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 2806.689743028672
 z_phi[pipe03_entry02_N03]_outer_lin_approx_32:
   16.82261490098351 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 2990.687093508179
 z_phi[pipe03_entry02_N03]_outer_lin_approx_33:
   17.34832161663924 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 3180.525629717194
 z_phi[pipe03_entry02_N03]_outer_lin_approx_34:
   17.87402833229498 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 3376.205351655718
 z_phi[pipe03_entry02_N03]_outer_lin_approx_35:
   18.39973504795071 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 3577.726259323749
 z_phi[pipe03_entry02_N03]_outer_lin_approx_36:
   18.92544176360645 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 3785.088352721289
 z_phi[pipe03_entry02_N03]_outer_lin_approx_37:
   19.45114847926218 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 3998.291631848337
 z_phi[pipe03_entry02_N03]_outer_lin_approx_38:
   19.97685519491792 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 4217.336096704893
 z_phi[pipe03_entry02_N03]_outer_lin_approx_39:
   20.50256191057365 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 4442.221747290957
 z_phi[pipe03_entry02_N03]_outer_lin_approx_40:
   21.02826862622938 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 4672.94858360653
 z_phi[pipe03_entry02_N03]_outer_lin_approx_41:
   21.55397534188512 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 4909.51660565161
 z_phi[pipe03_entry02_N03]_outer_lin_approx_42:
   22.07968205754085 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 5151.925813426198
 z_phi[pipe03_entry02_N03]_outer_lin_approx_43:
   22.60538877319659 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 5400.176206930296
 z_phi[pipe03_entry02_N03]_outer_lin_approx_44:
   23.13109548885232 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 5654.2677861639
 z_phi[pipe03_entry02_N03]_outer_lin_approx_45:
   23.65680220450806 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 5914.200551127014
 z_phi[pipe03_entry02_N03]_outer_lin_approx_46:
   24.18250892016379 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 6179.974501819635
 z_phi[pipe03_entry02_N03]_outer_lin_approx_47:
   24.70821563581952 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 6451.589638241764
 z_phi[pipe03_entry02_N03]_outer_lin_approx_48:
   25.23392235147526 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 6729.045960393401
 z_phi[pipe03_entry02_N03]_outer_lin_approx_49:
   25.759629067131 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 7012.343468274549
 z_phi[pipe03_entry02_N03]_outer_lin_approx_50:
   26.28533578278673 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 7301.482161885203
 z_phi[pipe03_entry02_N03]_outer_lin_approx_51:
   26.81104249844246 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 7596.462041225364
 z_phi[pipe03_entry02_N03]_outer_lin_approx_52:
   27.3367492140982 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 7897.283106295034
 z_phi[pipe03_entry02_N03]_outer_lin_approx_53:
   27.86245592975393 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 8203.945357094215
 z_phi[pipe03_entry02_N03]_outer_lin_approx_54:
   28.38816264540967 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 8516.4487936229
 z_phi[pipe03_entry02_N03]_outer_lin_approx_55:
   28.9138693610654 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 8834.793415881095
 z_phi[pipe03_entry02_N03]_outer_lin_approx_56:
   29.43957607672113 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 9158.979223868797
 z_phi[pipe03_entry02_N03]_outer_lin_approx_57:
   29.96528279237687 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 9489.006217586008
 z_phi[pipe03_entry02_N03]_outer_lin_approx_58:
   30.49098950803261 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 9824.874397032729
 z_phi[pipe03_entry02_N03]_outer_lin_approx_59:
   31.01669622368834 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 10166.58376220896
 z_phi[pipe03_entry02_N03]_outer_lin_approx_60:
   31.54240293934408 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 10514.13431311469
 z_phi[pipe03_entry02_N03]_outer_lin_approx_61:
   32.06810965499981 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 10867.52604974993
 z_phi[pipe03_entry02_N03]_outer_lin_approx_62:
   32.59381637065555 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 11226.75897211469
 z_phi[pipe03_entry02_N03]_outer_lin_approx_63:
   33.11952308631128 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 11591.83308020895
 z_phi[pipe03_entry02_N03]_outer_lin_approx_64:
   33.64522980196701 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 11962.74837403272
 z_phi[pipe03_entry02_N03]_outer_lin_approx_65:
   34.17093651762275 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 12339.50485358599
 z_phi[pipe03_entry02_N03]_outer_lin_approx_66:
   34.69664323327848 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 12722.10251886877
 z_phi[pipe03_entry02_N03]_outer_lin_approx_67:
   35.22234994893422 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 13110.54136988107
 z_phi[pipe03_entry02_N03]_outer_lin_approx_68:
   35.74805666458995 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 13504.82140662287
 z_phi[pipe03_entry02_N03]_outer_lin_approx_69:
   36.27376338024568 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 13904.94262909418
 z_phi[pipe03_entry02_N03]_outer_lin_approx_70:
   36.79947009590142 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 14310.905037295
 z_phi[pipe03_entry02_N03]_outer_lin_approx_71:
   37.32517681155716 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 14722.70863122533
 z_phi[pipe03_entry02_N03]_outer_lin_approx_72:
   37.85088352721289 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 15140.35341088516
 z_phi[pipe03_entry02_N03]_outer_lin_approx_73:
   38.37659024286862 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 15563.8393762745
 z_phi[pipe03_entry02_N03]_outer_lin_approx_74:
   38.90229695852436 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 15993.16652739335
 z_phi[pipe03_entry02_N03]_outer_lin_approx_75:
   39.42800367418009 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 16428.3348642417
 z_phi[pipe03_entry02_N03]_outer_lin_approx_76:
   39.95371038983583 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 16869.34438681957
 z_phi[pipe03_entry02_N03]_outer_lin_approx_77:
   40.47941710549156 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 17316.19509512695
 z_phi[pipe03_entry02_N03]_outer_lin_approx_78:
   41.0051238211473 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 17768.88698916383
 z_phi[pipe03_entry02_N03]_outer_lin_approx_79:
   41.53083053680303 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 18227.42006893022
 z_phi[pipe03_entry02_N03]_outer_lin_approx_80:
   42.05653725245877 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 18691.79433442612
 z_phi[pipe03_entry02_N03]_outer_lin_approx_81:
   42.5822439681145 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 19162.00978565153
 z_phi[pipe03_entry02_N03]_outer_lin_approx_82:
   43.10795068377023 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 19638.06642260644
 z_phi[pipe03_entry02_N03]_outer_lin_approx_83:
   43.63365739942597 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 20119.96424529086
 z_phi[pipe03_entry02_N03]_outer_lin_approx_84:
   44.1593641150817 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 20607.70325370479
 z_phi[pipe03_entry02_N03]_outer_lin_approx_85:
   44.68507083073744 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 21101.28344784824
 z_phi[pipe03_entry02_N03]_outer_lin_approx_86:
   45.21077754639317 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 21600.70482772118
 z_phi[pipe03_entry02_N03]_outer_lin_approx_87:
   45.73648426204891 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 22105.96739332364
 z_phi[pipe03_entry02_N03]_outer_lin_approx_88:
   46.26219097770464 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 22617.0711446556
 z_phi[pipe03_entry02_N03]_outer_lin_approx_89:
   46.78789769336038 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 23134.01608171707
 z_phi[pipe03_entry02_N03]_outer_lin_approx_90:
   47.31360440901611 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 23656.80220450806
 z_phi[pipe03_entry02_N03]_outer_lin_approx_91:
   47.83931112467184 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 24185.42951302855
 z_phi[pipe03_entry02_N03]_outer_lin_approx_92:
   48.36501784032758 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 24719.89800727854
 z_phi[pipe03_entry02_N03]_outer_lin_approx_93:
   48.89072455598332 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 25260.20768725804
 z_phi[pipe03_entry02_N03]_outer_lin_approx_94:
   49.41643127163905 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 25806.35855296706
 z_phi[pipe03_entry02_N03]_outer_lin_approx_95:
   49.94213798729479 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 26358.35060440558
 z_phi[pipe03_entry02_N03]_outer_lin_approx_96:
   50.46784470295052 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 26916.18384157361
 z_phi[pipe03_entry02_N03]_outer_lin_approx_97:
   50.99355141860626 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 27479.85826447115
 z_phi[pipe03_entry02_N03]_outer_lin_approx_98:
   51.519258134262 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 28049.3738730982
 z_phi[pipe03_entry02_N03]_outer_lin_approx_99:
   52.04496484991773 phi[pipe03_entry02_N03] - z_phi[pipe03_entry02_N03]
   <= 28624.73066745475
 z_phi[pipe04_N02_exit01]_outer_lin_approx_0: - z_phi[pipe04_N02_exit01]
   <= 0
 z_phi[pipe04_N02_exit01]_outer_lin_approx_1:
   0.5257067156557346 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 2.920592864754081
 z_phi[pipe04_N02_exit01]_outer_lin_approx_2:
   1.051413431311469 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 11.68237145901632
 z_phi[pipe04_N02_exit01]_outer_lin_approx_3:
   1.577120146967204 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 26.28533578278672
 z_phi[pipe04_N02_exit01]_outer_lin_approx_4:
   2.102826862622938 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 46.72948583606529
 z_phi[pipe04_N02_exit01]_outer_lin_approx_5:
   2.628533578278673 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 73.01482161885203
 z_phi[pipe04_N02_exit01]_outer_lin_approx_6:
   3.154240293934407 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 105.1413431311469
 z_phi[pipe04_N02_exit01]_outer_lin_approx_7:
   3.679947009590142 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 143.10905037295
 z_phi[pipe04_N02_exit01]_outer_lin_approx_8:
   4.205653725245877 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 186.9179433442612
 z_phi[pipe04_N02_exit01]_outer_lin_approx_9:
   4.731360440901612 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 236.5680220450806
 z_phi[pipe04_N02_exit01]_outer_lin_approx_10:
   5.257067156557346 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 292.0592864754081
 z_phi[pipe04_N02_exit01]_outer_lin_approx_11:
   5.78277387221308 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 353.3917366352438
 z_phi[pipe04_N02_exit01]_outer_lin_approx_12:
   6.308480587868814 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 420.5653725245876
 z_phi[pipe04_N02_exit01]_outer_lin_approx_13:
   6.83418730352455 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 493.5801941434396
 z_phi[pipe04_N02_exit01]_outer_lin_approx_14:
   7.359894019180284 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 572.4362014917998
 z_phi[pipe04_N02_exit01]_outer_lin_approx_15:
   7.885600734836019 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 657.1333945696682
 z_phi[pipe04_N02_exit01]_outer_lin_approx_16:
   8.411307450491753 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 747.6717733770447
 z_phi[pipe04_N02_exit01]_outer_lin_approx_17:
   8.937014166147488 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 844.0513379139294
 z_phi[pipe04_N02_exit01]_outer_lin_approx_18:
   9.462720881803223 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 946.2720881803223
 z_phi[pipe04_N02_exit01]_outer_lin_approx_19:
   9.988427597458958 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 1054.334024176223
 z_phi[pipe04_N02_exit01]_outer_lin_approx_20:
   10.51413431311469 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 1168.237145901632
 z_phi[pipe04_N02_exit01]_outer_lin_approx_21:
   11.03984102877043 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 1287.98145335655
 z_phi[pipe04_N02_exit01]_outer_lin_approx_22:
   11.56554774442616 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 1413.566946540975
 z_phi[pipe04_N02_exit01]_outer_lin_approx_23:
   12.0912544600819 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 1544.993625454909
 z_phi[pipe04_N02_exit01]_outer_lin_approx_24:
   12.61696117573763 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 1682.26149009835
 z_phi[pipe04_N02_exit01]_outer_lin_approx_25:
   13.14266789139337 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 1825.370540471301
 z_phi[pipe04_N02_exit01]_outer_lin_approx_26:
   13.6683746070491 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 1974.320776573758
 z_phi[pipe04_N02_exit01]_outer_lin_approx_27:
   14.19408132270483 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 2129.112198405725
 z_phi[pipe04_N02_exit01]_outer_lin_approx_28:
   14.71978803836057 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 2289.744805967199
 z_phi[pipe04_N02_exit01]_outer_lin_approx_29:
   15.2454947540163 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 2456.218599258182
 z_phi[pipe04_N02_exit01]_outer_lin_approx_30:
   15.77120146967204 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 2628.533578278673
 z_phi[pipe04_N02_exit01]_outer_lin_approx_31:
   16.29690818532777 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 2806.689743028672
 z_phi[pipe04_N02_exit01]_outer_lin_approx_32:
   16.82261490098351 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 2990.687093508179
 z_phi[pipe04_N02_exit01]_outer_lin_approx_33:
   17.34832161663924 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 3180.525629717194
 z_phi[pipe04_N02_exit01]_outer_lin_approx_34:
   17.87402833229498 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 3376.205351655718
 z_phi[pipe04_N02_exit01]_outer_lin_approx_35:
   18.39973504795071 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 3577.726259323749
 z_phi[pipe04_N02_exit01]_outer_lin_approx_36:
   18.92544176360645 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 3785.088352721289
 z_phi[pipe04_N02_exit01]_outer_lin_approx_37:
   19.45114847926218 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 3998.291631848337
 z_phi[pipe04_N02_exit01]_outer_lin_approx_38:
   19.97685519491792 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 4217.336096704893
 z_phi[pipe04_N02_exit01]_outer_lin_approx_39:
   20.50256191057365 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 4442.221747290957
 z_phi[pipe04_N02_exit01]_outer_lin_approx_40:
   21.02826862622938 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 4672.94858360653
 z_phi[pipe04_N02_exit01]_outer_lin_approx_41:
   21.55397534188512 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 4909.51660565161
 z_phi[pipe04_N02_exit01]_outer_lin_approx_42:
   22.07968205754085 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 5151.925813426198
 z_phi[pipe04_N02_exit01]_outer_lin_approx_43:
   22.60538877319659 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 5400.176206930296
 z_phi[pipe04_N02_exit01]_outer_lin_approx_44:
   23.13109548885232 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 5654.2677861639
 z_phi[pipe04_N02_exit01]_outer_lin_approx_45:
   23.65680220450806 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 5914.200551127014
 z_phi[pipe04_N02_exit01]_outer_lin_approx_46:
   24.18250892016379 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 6179.974501819635
 z_phi[pipe04_N02_exit01]_outer_lin_approx_47:
   24.70821563581952 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 6451.589638241764
 z_phi[pipe04_N02_exit01]_outer_lin_approx_48:
   25.23392235147526 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 6729.045960393401
 z_phi[pipe04_N02_exit01]_outer_lin_approx_49:
   25.759629067131 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 7012.343468274549
 z_phi[pipe04_N02_exit01]_outer_lin_approx_50:
   26.28533578278673 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 7301.482161885203
 z_phi[pipe04_N02_exit01]_outer_lin_approx_51:
   26.81104249844246 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 7596.462041225364
 z_phi[pipe04_N02_exit01]_outer_lin_approx_52:
   27.3367492140982 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 7897.283106295034
 z_phi[pipe04_N02_exit01]_outer_lin_approx_53:
   27.86245592975393 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 8203.945357094215
 z_phi[pipe04_N02_exit01]_outer_lin_approx_54:
   28.38816264540967 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 8516.4487936229
 z_phi[pipe04_N02_exit01]_outer_lin_approx_55:
   28.9138693610654 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 8834.793415881095
 z_phi[pipe04_N02_exit01]_outer_lin_approx_56:
   29.43957607672113 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 9158.979223868797
 z_phi[pipe04_N02_exit01]_outer_lin_approx_57:
   29.96528279237687 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 9489.006217586008
 z_phi[pipe04_N02_exit01]_outer_lin_approx_58:
   30.49098950803261 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 9824.874397032729
 z_phi[pipe04_N02_exit01]_outer_lin_approx_59:
   31.01669622368834 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 10166.58376220896
 z_phi[pipe04_N02_exit01]_outer_lin_approx_60:
   31.54240293934408 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 10514.13431311469
 z_phi[pipe04_N02_exit01]_outer_lin_approx_61:
   32.06810965499981 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 10867.52604974993
 z_phi[pipe04_N02_exit01]_outer_lin_approx_62:
   32.59381637065555 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 11226.75897211469
 z_phi[pipe04_N02_exit01]_outer_lin_approx_63:
   33.11952308631128 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 11591.83308020895
 z_phi[pipe04_N02_exit01]_outer_lin_approx_64:
   33.64522980196701 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 11962.74837403272
 z_phi[pipe04_N02_exit01]_outer_lin_approx_65:
   34.17093651762275 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 12339.50485358599
 z_phi[pipe04_N02_exit01]_outer_lin_approx_66:
   34.69664323327848 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 12722.10251886877
 z_phi[pipe04_N02_exit01]_outer_lin_approx_67:
   35.22234994893422 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 13110.54136988107
 z_phi[pipe04_N02_exit01]_outer_lin_approx_68:
   35.74805666458995 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 13504.82140662287
 z_phi[pipe04_N02_exit01]_outer_lin_approx_69:
   36.27376338024568 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 13904.94262909418
 z_phi[pipe04_N02_exit01]_outer_lin_approx_70:
   36.79947009590142 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 14310.905037295
 z_phi[pipe04_N02_exit01]_outer_lin_approx_71:
   37.32517681155716 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 14722.70863122533
 z_phi[pipe04_N02_exit01]_outer_lin_approx_72:
   37.85088352721289 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 15140.35341088516
 z_phi[pipe04_N02_exit01]_outer_lin_approx_73:
   38.37659024286862 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 15563.8393762745
 z_phi[pipe04_N02_exit01]_outer_lin_approx_74:
   38.90229695852436 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 15993.16652739335
 z_phi[pipe04_N02_exit01]_outer_lin_approx_75:
   39.42800367418009 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 16428.3348642417
 z_phi[pipe04_N02_exit01]_outer_lin_approx_76:
   39.95371038983583 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 16869.34438681957
 z_phi[pipe04_N02_exit01]_outer_lin_approx_77:
   40.47941710549156 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 17316.19509512695
 z_phi[pipe04_N02_exit01]_outer_lin_approx_78:
   41.0051238211473 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 17768.88698916383
 z_phi[pipe04_N02_exit01]_outer_lin_approx_79:
   41.53083053680303 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 18227.42006893022
 z_phi[pipe04_N02_exit01]_outer_lin_approx_80:
   42.05653725245877 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 18691.79433442612
 z_phi[pipe04_N02_exit01]_outer_lin_approx_81:
   42.5822439681145 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 19162.00978565153
 z_phi[pipe04_N02_exit01]_outer_lin_approx_82:
   43.10795068377023 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 19638.06642260644
 z_phi[pipe04_N02_exit01]_outer_lin_approx_83:
   43.63365739942597 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 20119.96424529086
 z_phi[pipe04_N02_exit01]_outer_lin_approx_84:
   44.1593641150817 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 20607.70325370479
 z_phi[pipe04_N02_exit01]_outer_lin_approx_85:
   44.68507083073744 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 21101.28344784824
 z_phi[pipe04_N02_exit01]_outer_lin_approx_86:
   45.21077754639317 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 21600.70482772118
 z_phi[pipe04_N02_exit01]_outer_lin_approx_87:
   45.73648426204891 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 22105.96739332364
 z_phi[pipe04_N02_exit01]_outer_lin_approx_88:
   46.26219097770464 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 22617.0711446556
 z_phi[pipe04_N02_exit01]_outer_lin_approx_89:
   46.78789769336038 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 23134.01608171707
 z_phi[pipe04_N02_exit01]_outer_lin_approx_90:
   47.31360440901611 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 23656.80220450806
 z_phi[pipe04_N02_exit01]_outer_lin_approx_91:
   47.83931112467184 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 24185.42951302855
 z_phi[pipe04_N02_exit01]_outer_lin_approx_92:
   48.36501784032758 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 24719.89800727854
 z_phi[pipe04_N02_exit01]_outer_lin_approx_93:
   48.89072455598332 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 25260.20768725804
 z_phi[pipe04_N02_exit01]_outer_lin_approx_94:
   49.41643127163905 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 25806.35855296706
 z_phi[pipe04_N02_exit01]_outer_lin_approx_95:
   49.94213798729479 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 26358.35060440558
 z_phi[pipe04_N02_exit01]_outer_lin_approx_96:
   50.46784470295052 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 26916.18384157361
 z_phi[pipe04_N02_exit01]_outer_lin_approx_97:
   50.99355141860626 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 27479.85826447115
 z_phi[pipe04_N02_exit01]_outer_lin_approx_98:
   51.519258134262 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 28049.3738730982
 z_phi[pipe04_N02_exit01]_outer_lin_approx_99:
   52.04496484991773 phi[pipe04_N02_exit01] - z_phi[pipe04_N02_exit01]
   <= 28624.73066745475
 z_phi[pipe05_N02_N04]_outer_lin_approx_0: - z_phi[pipe05_N02_N04] <= 0
 z_phi[pipe05_N02_N04]_outer_lin_approx_1:
   0.5257067156557346 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 2.920592864754081
 z_phi[pipe05_N02_N04]_outer_lin_approx_2:
   1.051413431311469 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 11.68237145901632
 z_phi[pipe05_N02_N04]_outer_lin_approx_3:
   1.577120146967204 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 26.28533578278672
 z_phi[pipe05_N02_N04]_outer_lin_approx_4:
   2.102826862622938 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 46.72948583606529
 z_phi[pipe05_N02_N04]_outer_lin_approx_5:
   2.628533578278673 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 73.01482161885203
 z_phi[pipe05_N02_N04]_outer_lin_approx_6:
   3.154240293934407 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 105.1413431311469
 z_phi[pipe05_N02_N04]_outer_lin_approx_7:
   3.679947009590142 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 143.10905037295
 z_phi[pipe05_N02_N04]_outer_lin_approx_8:
   4.205653725245877 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 186.9179433442612
 z_phi[pipe05_N02_N04]_outer_lin_approx_9:
   4.731360440901612 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 236.5680220450806
 z_phi[pipe05_N02_N04]_outer_lin_approx_10:
   5.257067156557346 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 292.0592864754081
 z_phi[pipe05_N02_N04]_outer_lin_approx_11:
   5.78277387221308 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 353.3917366352438
 z_phi[pipe05_N02_N04]_outer_lin_approx_12:
   6.308480587868814 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 420.5653725245876
 z_phi[pipe05_N02_N04]_outer_lin_approx_13:
   6.83418730352455 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 493.5801941434396
 z_phi[pipe05_N02_N04]_outer_lin_approx_14:
   7.359894019180284 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 572.4362014917998
 z_phi[pipe05_N02_N04]_outer_lin_approx_15:
   7.885600734836019 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 657.1333945696682
 z_phi[pipe05_N02_N04]_outer_lin_approx_16:
   8.411307450491753 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 747.6717733770447
 z_phi[pipe05_N02_N04]_outer_lin_approx_17:
   8.937014166147488 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 844.0513379139294
 z_phi[pipe05_N02_N04]_outer_lin_approx_18:
   9.462720881803223 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 946.2720881803223
 z_phi[pipe05_N02_N04]_outer_lin_approx_19:
   9.988427597458958 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 1054.334024176223
 z_phi[pipe05_N02_N04]_outer_lin_approx_20:
   10.51413431311469 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 1168.237145901632
 z_phi[pipe05_N02_N04]_outer_lin_approx_21:
   11.03984102877043 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 1287.98145335655
 z_phi[pipe05_N02_N04]_outer_lin_approx_22:
   11.56554774442616 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 1413.566946540975
 z_phi[pipe05_N02_N04]_outer_lin_approx_23:
   12.0912544600819 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 1544.993625454909
 z_phi[pipe05_N02_N04]_outer_lin_approx_24:
   12.61696117573763 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 1682.26149009835
 z_phi[pipe05_N02_N04]_outer_lin_approx_25:
   13.14266789139337 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 1825.370540471301
 z_phi[pipe05_N02_N04]_outer_lin_approx_26:
   13.6683746070491 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 1974.320776573758
 z_phi[pipe05_N02_N04]_outer_lin_approx_27:
   14.19408132270483 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 2129.112198405725
 z_phi[pipe05_N02_N04]_outer_lin_approx_28:
   14.71978803836057 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 2289.744805967199
 z_phi[pipe05_N02_N04]_outer_lin_approx_29:
   15.2454947540163 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 2456.218599258182
 z_phi[pipe05_N02_N04]_outer_lin_approx_30:
   15.77120146967204 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 2628.533578278673
 z_phi[pipe05_N02_N04]_outer_lin_approx_31:
   16.29690818532777 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 2806.689743028672
 z_phi[pipe05_N02_N04]_outer_lin_approx_32:
   16.82261490098351 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 2990.687093508179
 z_phi[pipe05_N02_N04]_outer_lin_approx_33:
   17.34832161663924 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 3180.525629717194
 z_phi[pipe05_N02_N04]_outer_lin_approx_34:
   17.87402833229498 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 3376.205351655718
 z_phi[pipe05_N02_N04]_outer_lin_approx_35:
   18.39973504795071 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 3577.726259323749
 z_phi[pipe05_N02_N04]_outer_lin_approx_36:
   18.92544176360645 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 3785.088352721289
 z_phi[pipe05_N02_N04]_outer_lin_approx_37:
   19.45114847926218 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 3998.291631848337
 z_phi[pipe05_N02_N04]_outer_lin_approx_38:
   19.97685519491792 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 4217.336096704893
 z_phi[pipe05_N02_N04]_outer_lin_approx_39:
   20.50256191057365 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 4442.221747290957
 z_phi[pipe05_N02_N04]_outer_lin_approx_40:
   21.02826862622938 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 4672.94858360653
 z_phi[pipe05_N02_N04]_outer_lin_approx_41:
   21.55397534188512 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 4909.51660565161
 z_phi[pipe05_N02_N04]_outer_lin_approx_42:
   22.07968205754085 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 5151.925813426198
 z_phi[pipe05_N02_N04]_outer_lin_approx_43:
   22.60538877319659 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 5400.176206930296
 z_phi[pipe05_N02_N04]_outer_lin_approx_44:
   23.13109548885232 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 5654.2677861639
 z_phi[pipe05_N02_N04]_outer_lin_approx_45:
   23.65680220450806 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 5914.200551127014
 z_phi[pipe05_N02_N04]_outer_lin_approx_46:
   24.18250892016379 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 6179.974501819635
 z_phi[pipe05_N02_N04]_outer_lin_approx_47:
   24.70821563581952 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 6451.589638241764
 z_phi[pipe05_N02_N04]_outer_lin_approx_48:
   25.23392235147526 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 6729.045960393401
 z_phi[pipe05_N02_N04]_outer_lin_approx_49:
   25.759629067131 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 7012.343468274549
 z_phi[pipe05_N02_N04]_outer_lin_approx_50:
   26.28533578278673 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 7301.482161885203
 z_phi[pipe05_N02_N04]_outer_lin_approx_51:
   26.81104249844246 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 7596.462041225364
 z_phi[pipe05_N02_N04]_outer_lin_approx_52:
   27.3367492140982 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 7897.283106295034
 z_phi[pipe05_N02_N04]_outer_lin_approx_53:
   27.86245592975393 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 8203.945357094215
 z_phi[pipe05_N02_N04]_outer_lin_approx_54:
   28.38816264540967 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 8516.4487936229
 z_phi[pipe05_N02_N04]_outer_lin_approx_55:
   28.9138693610654 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 8834.793415881095
 z_phi[pipe05_N02_N04]_outer_lin_approx_56:
   29.43957607672113 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 9158.979223868797
 z_phi[pipe05_N02_N04]_outer_lin_approx_57:
   29.96528279237687 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 9489.006217586008
 z_phi[pipe05_N02_N04]_outer_lin_approx_58:
   30.49098950803261 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 9824.874397032729
 z_phi[pipe05_N02_N04]_outer_lin_approx_59:
   31.01669622368834 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 10166.58376220896
 z_phi[pipe05_N02_N04]_outer_lin_approx_60:
   31.54240293934408 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 10514.13431311469
 z_phi[pipe05_N02_N04]_outer_lin_approx_61:
   32.06810965499981 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 10867.52604974993
 z_phi[pipe05_N02_N04]_outer_lin_approx_62:
   32.59381637065555 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 11226.75897211469
 z_phi[pipe05_N02_N04]_outer_lin_approx_63:
   33.11952308631128 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 11591.83308020895
 z_phi[pipe05_N02_N04]_outer_lin_approx_64:
   33.64522980196701 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 11962.74837403272
 z_phi[pipe05_N02_N04]_outer_lin_approx_65:
   34.17093651762275 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 12339.50485358599
 z_phi[pipe05_N02_N04]_outer_lin_approx_66:
   34.69664323327848 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 12722.10251886877
 z_phi[pipe05_N02_N04]_outer_lin_approx_67:
   35.22234994893422 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 13110.54136988107
 z_phi[pipe05_N02_N04]_outer_lin_approx_68:
   35.74805666458995 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 13504.82140662287
 z_phi[pipe05_N02_N04]_outer_lin_approx_69:
   36.27376338024568 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 13904.94262909418
 z_phi[pipe05_N02_N04]_outer_lin_approx_70:
   36.79947009590142 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 14310.905037295
 z_phi[pipe05_N02_N04]_outer_lin_approx_71:
   37.32517681155716 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 14722.70863122533
 z_phi[pipe05_N02_N04]_outer_lin_approx_72:
   37.85088352721289 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 15140.35341088516
 z_phi[pipe05_N02_N04]_outer_lin_approx_73:
   38.37659024286862 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 15563.8393762745
 z_phi[pipe05_N02_N04]_outer_lin_approx_74:
   38.90229695852436 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 15993.16652739335
 z_phi[pipe05_N02_N04]_outer_lin_approx_75:
   39.42800367418009 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 16428.3348642417
 z_phi[pipe05_N02_N04]_outer_lin_approx_76:
   39.95371038983583 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 16869.34438681957
 z_phi[pipe05_N02_N04]_outer_lin_approx_77:
   40.47941710549156 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 17316.19509512695
 z_phi[pipe05_N02_N04]_outer_lin_approx_78:
   41.0051238211473 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 17768.88698916383
 z_phi[pipe05_N02_N04]_outer_lin_approx_79:
   41.53083053680303 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 18227.42006893022
 z_phi[pipe05_N02_N04]_outer_lin_approx_80:
   42.05653725245877 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 18691.79433442612
 z_phi[pipe05_N02_N04]_outer_lin_approx_81:
   42.5822439681145 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 19162.00978565153
 z_phi[pipe05_N02_N04]_outer_lin_approx_82:
   43.10795068377023 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 19638.06642260644
 z_phi[pipe05_N02_N04]_outer_lin_approx_83:
   43.63365739942597 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 20119.96424529086
 z_phi[pipe05_N02_N04]_outer_lin_approx_84:
   44.1593641150817 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 20607.70325370479
 z_phi[pipe05_N02_N04]_outer_lin_approx_85:
   44.68507083073744 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 21101.28344784824
 z_phi[pipe05_N02_N04]_outer_lin_approx_86:
   45.21077754639317 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 21600.70482772118
 z_phi[pipe05_N02_N04]_outer_lin_approx_87:
   45.73648426204891 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 22105.96739332364
 z_phi[pipe05_N02_N04]_outer_lin_approx_88:
   46.26219097770464 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 22617.0711446556
 z_phi[pipe05_N02_N04]_outer_lin_approx_89:
   46.78789769336038 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 23134.01608171707
 z_phi[pipe05_N02_N04]_outer_lin_approx_90:
   47.31360440901611 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 23656.80220450806
 z_phi[pipe05_N02_N04]_outer_lin_approx_91:
   47.83931112467184 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 24185.42951302855
 z_phi[pipe05_N02_N04]_outer_lin_approx_92:
   48.36501784032758 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 24719.89800727854
 z_phi[pipe05_N02_N04]_outer_lin_approx_93:
   48.89072455598332 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 25260.20768725804
 z_phi[pipe05_N02_N04]_outer_lin_approx_94:
   49.41643127163905 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 25806.35855296706
 z_phi[pipe05_N02_N04]_outer_lin_approx_95:
   49.94213798729479 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 26358.35060440558
 z_phi[pipe05_N02_N04]_outer_lin_approx_96:
   50.46784470295052 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 26916.18384157361
 z_phi[pipe05_N02_N04]_outer_lin_approx_97:
   50.99355141860626 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 27479.85826447115
 z_phi[pipe05_N02_N04]_outer_lin_approx_98:
   51.519258134262 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 28049.3738730982
 z_phi[pipe05_N02_N04]_outer_lin_approx_99:
   52.04496484991773 phi[pipe05_N02_N04] - z_phi[pipe05_N02_N04]
   <= 28624.73066745475
 z_phi[pipe06_N03_N04]_outer_lin_approx_0: - z_phi[pipe06_N03_N04] <= 0
 z_phi[pipe06_N03_N04]_outer_lin_approx_1:
   0.5257067156557346 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 2.920592864754081
 z_phi[pipe06_N03_N04]_outer_lin_approx_2:
   1.051413431311469 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 11.68237145901632
 z_phi[pipe06_N03_N04]_outer_lin_approx_3:
   1.577120146967204 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 26.28533578278672
 z_phi[pipe06_N03_N04]_outer_lin_approx_4:
   2.102826862622938 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 46.72948583606529
 z_phi[pipe06_N03_N04]_outer_lin_approx_5:
   2.628533578278673 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 73.01482161885203
 z_phi[pipe06_N03_N04]_outer_lin_approx_6:
   3.154240293934407 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 105.1413431311469
 z_phi[pipe06_N03_N04]_outer_lin_approx_7:
   3.679947009590142 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 143.10905037295
 z_phi[pipe06_N03_N04]_outer_lin_approx_8:
   4.205653725245877 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 186.9179433442612
 z_phi[pipe06_N03_N04]_outer_lin_approx_9:
   4.731360440901612 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 236.5680220450806
 z_phi[pipe06_N03_N04]_outer_lin_approx_10:
   5.257067156557346 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 292.0592864754081
 z_phi[pipe06_N03_N04]_outer_lin_approx_11:
   5.78277387221308 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 353.3917366352438
 z_phi[pipe06_N03_N04]_outer_lin_approx_12:
   6.308480587868814 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 420.5653725245876
 z_phi[pipe06_N03_N04]_outer_lin_approx_13:
   6.83418730352455 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 493.5801941434396
 z_phi[pipe06_N03_N04]_outer_lin_approx_14:
   7.359894019180284 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 572.4362014917998
 z_phi[pipe06_N03_N04]_outer_lin_approx_15:
   7.885600734836019 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 657.1333945696682
 z_phi[pipe06_N03_N04]_outer_lin_approx_16:
   8.411307450491753 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 747.6717733770447
 z_phi[pipe06_N03_N04]_outer_lin_approx_17:
   8.937014166147488 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 844.0513379139294
 z_phi[pipe06_N03_N04]_outer_lin_approx_18:
   9.462720881803223 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 946.2720881803223
 z_phi[pipe06_N03_N04]_outer_lin_approx_19:
   9.988427597458958 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 1054.334024176223
 z_phi[pipe06_N03_N04]_outer_lin_approx_20:
   10.51413431311469 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 1168.237145901632
 z_phi[pipe06_N03_N04]_outer_lin_approx_21:
   11.03984102877043 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 1287.98145335655
 z_phi[pipe06_N03_N04]_outer_lin_approx_22:
   11.56554774442616 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 1413.566946540975
 z_phi[pipe06_N03_N04]_outer_lin_approx_23:
   12.0912544600819 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 1544.993625454909
 z_phi[pipe06_N03_N04]_outer_lin_approx_24:
   12.61696117573763 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 1682.26149009835
 z_phi[pipe06_N03_N04]_outer_lin_approx_25:
   13.14266789139337 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 1825.370540471301
 z_phi[pipe06_N03_N04]_outer_lin_approx_26:
   13.6683746070491 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 1974.320776573758
 z_phi[pipe06_N03_N04]_outer_lin_approx_27:
   14.19408132270483 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 2129.112198405725
 z_phi[pipe06_N03_N04]_outer_lin_approx_28:
   14.71978803836057 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 2289.744805967199
 z_phi[pipe06_N03_N04]_outer_lin_approx_29:
   15.2454947540163 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 2456.218599258182
 z_phi[pipe06_N03_N04]_outer_lin_approx_30:
   15.77120146967204 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 2628.533578278673
 z_phi[pipe06_N03_N04]_outer_lin_approx_31:
   16.29690818532777 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 2806.689743028672
 z_phi[pipe06_N03_N04]_outer_lin_approx_32:
   16.82261490098351 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 2990.687093508179
 z_phi[pipe06_N03_N04]_outer_lin_approx_33:
   17.34832161663924 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 3180.525629717194
 z_phi[pipe06_N03_N04]_outer_lin_approx_34:
   17.87402833229498 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 3376.205351655718
 z_phi[pipe06_N03_N04]_outer_lin_approx_35:
   18.39973504795071 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 3577.726259323749
 z_phi[pipe06_N03_N04]_outer_lin_approx_36:
   18.92544176360645 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 3785.088352721289
 z_phi[pipe06_N03_N04]_outer_lin_approx_37:
   19.45114847926218 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 3998.291631848337
 z_phi[pipe06_N03_N04]_outer_lin_approx_38:
   19.97685519491792 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 4217.336096704893
 z_phi[pipe06_N03_N04]_outer_lin_approx_39:
   20.50256191057365 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 4442.221747290957
 z_phi[pipe06_N03_N04]_outer_lin_approx_40:
   21.02826862622938 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 4672.94858360653
 z_phi[pipe06_N03_N04]_outer_lin_approx_41:
   21.55397534188512 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 4909.51660565161
 z_phi[pipe06_N03_N04]_outer_lin_approx_42:
   22.07968205754085 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 5151.925813426198
 z_phi[pipe06_N03_N04]_outer_lin_approx_43:
   22.60538877319659 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 5400.176206930296
 z_phi[pipe06_N03_N04]_outer_lin_approx_44:
   23.13109548885232 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 5654.2677861639
 z_phi[pipe06_N03_N04]_outer_lin_approx_45:
   23.65680220450806 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 5914.200551127014
 z_phi[pipe06_N03_N04]_outer_lin_approx_46:
   24.18250892016379 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 6179.974501819635
 z_phi[pipe06_N03_N04]_outer_lin_approx_47:
   24.70821563581952 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 6451.589638241764
 z_phi[pipe06_N03_N04]_outer_lin_approx_48:
   25.23392235147526 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 6729.045960393401
 z_phi[pipe06_N03_N04]_outer_lin_approx_49:
   25.759629067131 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 7012.343468274549
 z_phi[pipe06_N03_N04]_outer_lin_approx_50:
   26.28533578278673 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 7301.482161885203
 z_phi[pipe06_N03_N04]_outer_lin_approx_51:
   26.81104249844246 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 7596.462041225364
 z_phi[pipe06_N03_N04]_outer_lin_approx_52:
   27.3367492140982 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 7897.283106295034
 z_phi[pipe06_N03_N04]_outer_lin_approx_53:
   27.86245592975393 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 8203.945357094215
 z_phi[pipe06_N03_N04]_outer_lin_approx_54:
   28.38816264540967 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 8516.4487936229
 z_phi[pipe06_N03_N04]_outer_lin_approx_55:
   28.9138693610654 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 8834.793415881095
 z_phi[pipe06_N03_N04]_outer_lin_approx_56:
   29.43957607672113 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 9158.979223868797
 z_phi[pipe06_N03_N04]_outer_lin_approx_57:
   29.96528279237687 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 9489.006217586008
 z_phi[pipe06_N03_N04]_outer_lin_approx_58:
   30.49098950803261 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 9824.874397032729
 z_phi[pipe06_N03_N04]_outer_lin_approx_59:
   31.01669622368834 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 10166.58376220896
 z_phi[pipe06_N03_N04]_outer_lin_approx_60:
   31.54240293934408 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 10514.13431311469
 z_phi[pipe06_N03_N04]_outer_lin_approx_61:
   32.06810965499981 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 10867.52604974993
 z_phi[pipe06_N03_N04]_outer_lin_approx_62:
   32.59381637065555 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 11226.75897211469
 z_phi[pipe06_N03_N04]_outer_lin_approx_63:
   33.11952308631128 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 11591.83308020895
 z_phi[pipe06_N03_N04]_outer_lin_approx_64:
   33.64522980196701 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 11962.74837403272
 z_phi[pipe06_N03_N04]_outer_lin_approx_65:
   34.17093651762275 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 12339.50485358599
 z_phi[pipe06_N03_N04]_outer_lin_approx_66:
   34.69664323327848 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 12722.10251886877
 z_phi[pipe06_N03_N04]_outer_lin_approx_67:
   35.22234994893422 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 13110.54136988107
 z_phi[pipe06_N03_N04]_outer_lin_approx_68:
   35.74805666458995 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 13504.82140662287
 z_phi[pipe06_N03_N04]_outer_lin_approx_69:
   36.27376338024568 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 13904.94262909418
 z_phi[pipe06_N03_N04]_outer_lin_approx_70:
   36.79947009590142 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 14310.905037295
 z_phi[pipe06_N03_N04]_outer_lin_approx_71:
   37.32517681155716 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 14722.70863122533
 z_phi[pipe06_N03_N04]_outer_lin_approx_72:
   37.85088352721289 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 15140.35341088516
 z_phi[pipe06_N03_N04]_outer_lin_approx_73:
   38.37659024286862 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 15563.8393762745
 z_phi[pipe06_N03_N04]_outer_lin_approx_74:
   38.90229695852436 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 15993.16652739335
 z_phi[pipe06_N03_N04]_outer_lin_approx_75:
   39.42800367418009 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 16428.3348642417
 z_phi[pipe06_N03_N04]_outer_lin_approx_76:
   39.95371038983583 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 16869.34438681957
 z_phi[pipe06_N03_N04]_outer_lin_approx_77:
   40.47941710549156 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 17316.19509512695
 z_phi[pipe06_N03_N04]_outer_lin_approx_78:
   41.0051238211473 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 17768.88698916383
 z_phi[pipe06_N03_N04]_outer_lin_approx_79:
   41.53083053680303 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 18227.42006893022
 z_phi[pipe06_N03_N04]_outer_lin_approx_80:
   42.05653725245877 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 18691.79433442612
 z_phi[pipe06_N03_N04]_outer_lin_approx_81:
   42.5822439681145 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 19162.00978565153
 z_phi[pipe06_N03_N04]_outer_lin_approx_82:
   43.10795068377023 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 19638.06642260644
 z_phi[pipe06_N03_N04]_outer_lin_approx_83:
   43.63365739942597 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 20119.96424529086
 z_phi[pipe06_N03_N04]_outer_lin_approx_84:
   44.1593641150817 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 20607.70325370479
 z_phi[pipe06_N03_N04]_outer_lin_approx_85:
   44.68507083073744 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 21101.28344784824
 z_phi[pipe06_N03_N04]_outer_lin_approx_86:
   45.21077754639317 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 21600.70482772118
 z_phi[pipe06_N03_N04]_outer_lin_approx_87:
   45.73648426204891 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 22105.96739332364
 z_phi[pipe06_N03_N04]_outer_lin_approx_88:
   46.26219097770464 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 22617.0711446556
 z_phi[pipe06_N03_N04]_outer_lin_approx_89:
   46.78789769336038 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 23134.01608171707
 z_phi[pipe06_N03_N04]_outer_lin_approx_90:
   47.31360440901611 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 23656.80220450806
 z_phi[pipe06_N03_N04]_outer_lin_approx_91:
   47.83931112467184 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 24185.42951302855
 z_phi[pipe06_N03_N04]_outer_lin_approx_92:
   48.36501784032758 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 24719.89800727854
 z_phi[pipe06_N03_N04]_outer_lin_approx_93:
   48.89072455598332 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 25260.20768725804
 z_phi[pipe06_N03_N04]_outer_lin_approx_94:
   49.41643127163905 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 25806.35855296706
 z_phi[pipe06_N03_N04]_outer_lin_approx_95:
   49.94213798729479 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 26358.35060440558
 z_phi[pipe06_N03_N04]_outer_lin_approx_96:
   50.46784470295052 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 26916.18384157361
 z_phi[pipe06_N03_N04]_outer_lin_approx_97:
   50.99355141860626 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 27479.85826447115
 z_phi[pipe06_N03_N04]_outer_lin_approx_98:
   51.519258134262 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 28049.3738730982
 z_phi[pipe06_N03_N04]_outer_lin_approx_99:
   52.04496484991773 phi[pipe06_N03_N04] - z_phi[pipe06_N03_N04]
   <= 28624.73066745475
 z_phi[pipe07_N05_exit02]_outer_lin_approx_0: - z_phi[pipe07_N05_exit02]
   <= 0
 z_phi[pipe07_N05_exit02]_outer_lin_approx_1:
   0.5257067156557346 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 2.920592864754081
 z_phi[pipe07_N05_exit02]_outer_lin_approx_2:
   1.051413431311469 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 11.68237145901632
 z_phi[pipe07_N05_exit02]_outer_lin_approx_3:
   1.577120146967204 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 26.28533578278672
 z_phi[pipe07_N05_exit02]_outer_lin_approx_4:
   2.102826862622938 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 46.72948583606529
 z_phi[pipe07_N05_exit02]_outer_lin_approx_5:
   2.628533578278673 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 73.01482161885203
 z_phi[pipe07_N05_exit02]_outer_lin_approx_6:
   3.154240293934407 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 105.1413431311469
 z_phi[pipe07_N05_exit02]_outer_lin_approx_7:
   3.679947009590142 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 143.10905037295
 z_phi[pipe07_N05_exit02]_outer_lin_approx_8:
   4.205653725245877 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 186.9179433442612
 z_phi[pipe07_N05_exit02]_outer_lin_approx_9:
   4.731360440901612 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 236.5680220450806
 z_phi[pipe07_N05_exit02]_outer_lin_approx_10:
   5.257067156557346 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 292.0592864754081
 z_phi[pipe07_N05_exit02]_outer_lin_approx_11:
   5.78277387221308 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 353.3917366352438
 z_phi[pipe07_N05_exit02]_outer_lin_approx_12:
   6.308480587868814 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 420.5653725245876
 z_phi[pipe07_N05_exit02]_outer_lin_approx_13:
   6.83418730352455 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 493.5801941434396
 z_phi[pipe07_N05_exit02]_outer_lin_approx_14:
   7.359894019180284 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 572.4362014917998
 z_phi[pipe07_N05_exit02]_outer_lin_approx_15:
   7.885600734836019 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 657.1333945696682
 z_phi[pipe07_N05_exit02]_outer_lin_approx_16:
   8.411307450491753 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 747.6717733770447
 z_phi[pipe07_N05_exit02]_outer_lin_approx_17:
   8.937014166147488 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 844.0513379139294
 z_phi[pipe07_N05_exit02]_outer_lin_approx_18:
   9.462720881803223 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 946.2720881803223
 z_phi[pipe07_N05_exit02]_outer_lin_approx_19:
   9.988427597458958 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 1054.334024176223
 z_phi[pipe07_N05_exit02]_outer_lin_approx_20:
   10.51413431311469 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 1168.237145901632
 z_phi[pipe07_N05_exit02]_outer_lin_approx_21:
   11.03984102877043 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 1287.98145335655
 z_phi[pipe07_N05_exit02]_outer_lin_approx_22:
   11.56554774442616 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 1413.566946540975
 z_phi[pipe07_N05_exit02]_outer_lin_approx_23:
   12.0912544600819 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 1544.993625454909
 z_phi[pipe07_N05_exit02]_outer_lin_approx_24:
   12.61696117573763 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 1682.26149009835
 z_phi[pipe07_N05_exit02]_outer_lin_approx_25:
   13.14266789139337 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 1825.370540471301
 z_phi[pipe07_N05_exit02]_outer_lin_approx_26:
   13.6683746070491 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 1974.320776573758
 z_phi[pipe07_N05_exit02]_outer_lin_approx_27:
   14.19408132270483 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 2129.112198405725
 z_phi[pipe07_N05_exit02]_outer_lin_approx_28:
   14.71978803836057 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 2289.744805967199
 z_phi[pipe07_N05_exit02]_outer_lin_approx_29:
   15.2454947540163 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 2456.218599258182
 z_phi[pipe07_N05_exit02]_outer_lin_approx_30:
   15.77120146967204 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 2628.533578278673
 z_phi[pipe07_N05_exit02]_outer_lin_approx_31:
   16.29690818532777 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 2806.689743028672
 z_phi[pipe07_N05_exit02]_outer_lin_approx_32:
   16.82261490098351 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 2990.687093508179
 z_phi[pipe07_N05_exit02]_outer_lin_approx_33:
   17.34832161663924 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 3180.525629717194
 z_phi[pipe07_N05_exit02]_outer_lin_approx_34:
   17.87402833229498 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 3376.205351655718
 z_phi[pipe07_N05_exit02]_outer_lin_approx_35:
   18.39973504795071 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 3577.726259323749
 z_phi[pipe07_N05_exit02]_outer_lin_approx_36:
   18.92544176360645 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 3785.088352721289
 z_phi[pipe07_N05_exit02]_outer_lin_approx_37:
   19.45114847926218 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 3998.291631848337
 z_phi[pipe07_N05_exit02]_outer_lin_approx_38:
   19.97685519491792 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 4217.336096704893
 z_phi[pipe07_N05_exit02]_outer_lin_approx_39:
   20.50256191057365 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 4442.221747290957
 z_phi[pipe07_N05_exit02]_outer_lin_approx_40:
   21.02826862622938 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 4672.94858360653
 z_phi[pipe07_N05_exit02]_outer_lin_approx_41:
   21.55397534188512 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 4909.51660565161
 z_phi[pipe07_N05_exit02]_outer_lin_approx_42:
   22.07968205754085 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 5151.925813426198
 z_phi[pipe07_N05_exit02]_outer_lin_approx_43:
   22.60538877319659 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 5400.176206930296
 z_phi[pipe07_N05_exit02]_outer_lin_approx_44:
   23.13109548885232 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 5654.2677861639
 z_phi[pipe07_N05_exit02]_outer_lin_approx_45:
   23.65680220450806 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 5914.200551127014
 z_phi[pipe07_N05_exit02]_outer_lin_approx_46:
   24.18250892016379 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 6179.974501819635
 z_phi[pipe07_N05_exit02]_outer_lin_approx_47:
   24.70821563581952 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 6451.589638241764
 z_phi[pipe07_N05_exit02]_outer_lin_approx_48:
   25.23392235147526 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 6729.045960393401
 z_phi[pipe07_N05_exit02]_outer_lin_approx_49:
   25.759629067131 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 7012.343468274549
 z_phi[pipe07_N05_exit02]_outer_lin_approx_50:
   26.28533578278673 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 7301.482161885203
 z_phi[pipe07_N05_exit02]_outer_lin_approx_51:
   26.81104249844246 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 7596.462041225364
 z_phi[pipe07_N05_exit02]_outer_lin_approx_52:
   27.3367492140982 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 7897.283106295034
 z_phi[pipe07_N05_exit02]_outer_lin_approx_53:
   27.86245592975393 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 8203.945357094215
 z_phi[pipe07_N05_exit02]_outer_lin_approx_54:
   28.38816264540967 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 8516.4487936229
 z_phi[pipe07_N05_exit02]_outer_lin_approx_55:
   28.9138693610654 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 8834.793415881095
 z_phi[pipe07_N05_exit02]_outer_lin_approx_56:
   29.43957607672113 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 9158.979223868797
 z_phi[pipe07_N05_exit02]_outer_lin_approx_57:
   29.96528279237687 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 9489.006217586008
 z_phi[pipe07_N05_exit02]_outer_lin_approx_58:
   30.49098950803261 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 9824.874397032729
 z_phi[pipe07_N05_exit02]_outer_lin_approx_59:
   31.01669622368834 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 10166.58376220896
 z_phi[pipe07_N05_exit02]_outer_lin_approx_60:
   31.54240293934408 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 10514.13431311469
 z_phi[pipe07_N05_exit02]_outer_lin_approx_61:
   32.06810965499981 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 10867.52604974993
 z_phi[pipe07_N05_exit02]_outer_lin_approx_62:
   32.59381637065555 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 11226.75897211469
 z_phi[pipe07_N05_exit02]_outer_lin_approx_63:
   33.11952308631128 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 11591.83308020895
 z_phi[pipe07_N05_exit02]_outer_lin_approx_64:
   33.64522980196701 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 11962.74837403272
 z_phi[pipe07_N05_exit02]_outer_lin_approx_65:
   34.17093651762275 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 12339.50485358599
 z_phi[pipe07_N05_exit02]_outer_lin_approx_66:
   34.69664323327848 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 12722.10251886877
 z_phi[pipe07_N05_exit02]_outer_lin_approx_67:
   35.22234994893422 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 13110.54136988107
 z_phi[pipe07_N05_exit02]_outer_lin_approx_68:
   35.74805666458995 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 13504.82140662287
 z_phi[pipe07_N05_exit02]_outer_lin_approx_69:
   36.27376338024568 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 13904.94262909418
 z_phi[pipe07_N05_exit02]_outer_lin_approx_70:
   36.79947009590142 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 14310.905037295
 z_phi[pipe07_N05_exit02]_outer_lin_approx_71:
   37.32517681155716 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 14722.70863122533
 z_phi[pipe07_N05_exit02]_outer_lin_approx_72:
   37.85088352721289 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 15140.35341088516
 z_phi[pipe07_N05_exit02]_outer_lin_approx_73:
   38.37659024286862 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 15563.8393762745
 z_phi[pipe07_N05_exit02]_outer_lin_approx_74:
   38.90229695852436 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 15993.16652739335
 z_phi[pipe07_N05_exit02]_outer_lin_approx_75:
   39.42800367418009 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 16428.3348642417
 z_phi[pipe07_N05_exit02]_outer_lin_approx_76:
   39.95371038983583 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 16869.34438681957
 z_phi[pipe07_N05_exit02]_outer_lin_approx_77:
   40.47941710549156 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 17316.19509512695
 z_phi[pipe07_N05_exit02]_outer_lin_approx_78:
   41.0051238211473 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 17768.88698916383
 z_phi[pipe07_N05_exit02]_outer_lin_approx_79:
   41.53083053680303 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 18227.42006893022
 z_phi[pipe07_N05_exit02]_outer_lin_approx_80:
   42.05653725245877 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 18691.79433442612
 z_phi[pipe07_N05_exit02]_outer_lin_approx_81:
   42.5822439681145 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 19162.00978565153
 z_phi[pipe07_N05_exit02]_outer_lin_approx_82:
   43.10795068377023 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 19638.06642260644
 z_phi[pipe07_N05_exit02]_outer_lin_approx_83:
   43.63365739942597 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 20119.96424529086
 z_phi[pipe07_N05_exit02]_outer_lin_approx_84:
   44.1593641150817 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 20607.70325370479
 z_phi[pipe07_N05_exit02]_outer_lin_approx_85:
   44.68507083073744 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 21101.28344784824
 z_phi[pipe07_N05_exit02]_outer_lin_approx_86:
   45.21077754639317 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 21600.70482772118
 z_phi[pipe07_N05_exit02]_outer_lin_approx_87:
   45.73648426204891 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 22105.96739332364
 z_phi[pipe07_N05_exit02]_outer_lin_approx_88:
   46.26219097770464 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 22617.0711446556
 z_phi[pipe07_N05_exit02]_outer_lin_approx_89:
   46.78789769336038 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 23134.01608171707
 z_phi[pipe07_N05_exit02]_outer_lin_approx_90:
   47.31360440901611 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 23656.80220450806
 z_phi[pipe07_N05_exit02]_outer_lin_approx_91:
   47.83931112467184 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 24185.42951302855
 z_phi[pipe07_N05_exit02]_outer_lin_approx_92:
   48.36501784032758 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 24719.89800727854
 z_phi[pipe07_N05_exit02]_outer_lin_approx_93:
   48.89072455598332 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 25260.20768725804
 z_phi[pipe07_N05_exit02]_outer_lin_approx_94:
   49.41643127163905 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 25806.35855296706
 z_phi[pipe07_N05_exit02]_outer_lin_approx_95:
   49.94213798729479 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 26358.35060440558
 z_phi[pipe07_N05_exit02]_outer_lin_approx_96:
   50.46784470295052 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 26916.18384157361
 z_phi[pipe07_N05_exit02]_outer_lin_approx_97:
   50.99355141860626 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 27479.85826447115
 z_phi[pipe07_N05_exit02]_outer_lin_approx_98:
   51.519258134262 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 28049.3738730982
 z_phi[pipe07_N05_exit02]_outer_lin_approx_99:
   52.04496484991773 phi[pipe07_N05_exit02] - z_phi[pipe07_N05_exit02]
   <= 28624.73066745475
 z_phi[pipe08_N05_exit03]_outer_lin_approx_0: - z_phi[pipe08_N05_exit03]
   <= 0
 z_phi[pipe08_N05_exit03]_outer_lin_approx_1:
   0.5257067156557346 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 2.920592864754081
 z_phi[pipe08_N05_exit03]_outer_lin_approx_2:
   1.051413431311469 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 11.68237145901632
 z_phi[pipe08_N05_exit03]_outer_lin_approx_3:
   1.577120146967204 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 26.28533578278672
 z_phi[pipe08_N05_exit03]_outer_lin_approx_4:
   2.102826862622938 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 46.72948583606529
 z_phi[pipe08_N05_exit03]_outer_lin_approx_5:
   2.628533578278673 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 73.01482161885203
 z_phi[pipe08_N05_exit03]_outer_lin_approx_6:
   3.154240293934407 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 105.1413431311469
 z_phi[pipe08_N05_exit03]_outer_lin_approx_7:
   3.679947009590142 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 143.10905037295
 z_phi[pipe08_N05_exit03]_outer_lin_approx_8:
   4.205653725245877 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 186.9179433442612
 z_phi[pipe08_N05_exit03]_outer_lin_approx_9:
   4.731360440901612 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 236.5680220450806
 z_phi[pipe08_N05_exit03]_outer_lin_approx_10:
   5.257067156557346 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 292.0592864754081
 z_phi[pipe08_N05_exit03]_outer_lin_approx_11:
   5.78277387221308 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 353.3917366352438
 z_phi[pipe08_N05_exit03]_outer_lin_approx_12:
   6.308480587868814 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 420.5653725245876
 z_phi[pipe08_N05_exit03]_outer_lin_approx_13:
   6.83418730352455 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 493.5801941434396
 z_phi[pipe08_N05_exit03]_outer_lin_approx_14:
   7.359894019180284 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 572.4362014917998
 z_phi[pipe08_N05_exit03]_outer_lin_approx_15:
   7.885600734836019 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 657.1333945696682
 z_phi[pipe08_N05_exit03]_outer_lin_approx_16:
   8.411307450491753 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 747.6717733770447
 z_phi[pipe08_N05_exit03]_outer_lin_approx_17:
   8.937014166147488 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 844.0513379139294
 z_phi[pipe08_N05_exit03]_outer_lin_approx_18:
   9.462720881803223 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 946.2720881803223
 z_phi[pipe08_N05_exit03]_outer_lin_approx_19:
   9.988427597458958 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 1054.334024176223
 z_phi[pipe08_N05_exit03]_outer_lin_approx_20:
   10.51413431311469 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 1168.237145901632
 z_phi[pipe08_N05_exit03]_outer_lin_approx_21:
   11.03984102877043 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 1287.98145335655
 z_phi[pipe08_N05_exit03]_outer_lin_approx_22:
   11.56554774442616 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 1413.566946540975
 z_phi[pipe08_N05_exit03]_outer_lin_approx_23:
   12.0912544600819 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 1544.993625454909
 z_phi[pipe08_N05_exit03]_outer_lin_approx_24:
   12.61696117573763 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 1682.26149009835
 z_phi[pipe08_N05_exit03]_outer_lin_approx_25:
   13.14266789139337 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 1825.370540471301
 z_phi[pipe08_N05_exit03]_outer_lin_approx_26:
   13.6683746070491 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 1974.320776573758
 z_phi[pipe08_N05_exit03]_outer_lin_approx_27:
   14.19408132270483 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 2129.112198405725
 z_phi[pipe08_N05_exit03]_outer_lin_approx_28:
   14.71978803836057 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 2289.744805967199
 z_phi[pipe08_N05_exit03]_outer_lin_approx_29:
   15.2454947540163 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 2456.218599258182
 z_phi[pipe08_N05_exit03]_outer_lin_approx_30:
   15.77120146967204 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 2628.533578278673
 z_phi[pipe08_N05_exit03]_outer_lin_approx_31:
   16.29690818532777 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 2806.689743028672
 z_phi[pipe08_N05_exit03]_outer_lin_approx_32:
   16.82261490098351 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 2990.687093508179
 z_phi[pipe08_N05_exit03]_outer_lin_approx_33:
   17.34832161663924 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 3180.525629717194
 z_phi[pipe08_N05_exit03]_outer_lin_approx_34:
   17.87402833229498 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 3376.205351655718
 z_phi[pipe08_N05_exit03]_outer_lin_approx_35:
   18.39973504795071 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 3577.726259323749
 z_phi[pipe08_N05_exit03]_outer_lin_approx_36:
   18.92544176360645 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 3785.088352721289
 z_phi[pipe08_N05_exit03]_outer_lin_approx_37:
   19.45114847926218 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 3998.291631848337
 z_phi[pipe08_N05_exit03]_outer_lin_approx_38:
   19.97685519491792 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 4217.336096704893
 z_phi[pipe08_N05_exit03]_outer_lin_approx_39:
   20.50256191057365 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 4442.221747290957
 z_phi[pipe08_N05_exit03]_outer_lin_approx_40:
   21.02826862622938 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 4672.94858360653
 z_phi[pipe08_N05_exit03]_outer_lin_approx_41:
   21.55397534188512 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 4909.51660565161
 z_phi[pipe08_N05_exit03]_outer_lin_approx_42:
   22.07968205754085 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 5151.925813426198
 z_phi[pipe08_N05_exit03]_outer_lin_approx_43:
   22.60538877319659 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 5400.176206930296
 z_phi[pipe08_N05_exit03]_outer_lin_approx_44:
   23.13109548885232 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 5654.2677861639
 z_phi[pipe08_N05_exit03]_outer_lin_approx_45:
   23.65680220450806 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 5914.200551127014
 z_phi[pipe08_N05_exit03]_outer_lin_approx_46:
   24.18250892016379 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 6179.974501819635
 z_phi[pipe08_N05_exit03]_outer_lin_approx_47:
   24.70821563581952 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 6451.589638241764
 z_phi[pipe08_N05_exit03]_outer_lin_approx_48:
   25.23392235147526 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 6729.045960393401
 z_phi[pipe08_N05_exit03]_outer_lin_approx_49:
   25.759629067131 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 7012.343468274549
 z_phi[pipe08_N05_exit03]_outer_lin_approx_50:
   26.28533578278673 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 7301.482161885203
 z_phi[pipe08_N05_exit03]_outer_lin_approx_51:
   26.81104249844246 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 7596.462041225364
 z_phi[pipe08_N05_exit03]_outer_lin_approx_52:
   27.3367492140982 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 7897.283106295034
 z_phi[pipe08_N05_exit03]_outer_lin_approx_53:
   27.86245592975393 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 8203.945357094215
 z_phi[pipe08_N05_exit03]_outer_lin_approx_54:
   28.38816264540967 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 8516.4487936229
 z_phi[pipe08_N05_exit03]_outer_lin_approx_55:
   28.9138693610654 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 8834.793415881095
 z_phi[pipe08_N05_exit03]_outer_lin_approx_56:
   29.43957607672113 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 9158.979223868797
 z_phi[pipe08_N05_exit03]_outer_lin_approx_57:
   29.96528279237687 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 9489.006217586008
 z_phi[pipe08_N05_exit03]_outer_lin_approx_58:
   30.49098950803261 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 9824.874397032729
 z_phi[pipe08_N05_exit03]_outer_lin_approx_59:
   31.01669622368834 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 10166.58376220896
 z_phi[pipe08_N05_exit03]_outer_lin_approx_60:
   31.54240293934408 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 10514.13431311469
 z_phi[pipe08_N05_exit03]_outer_lin_approx_61:
   32.06810965499981 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 10867.52604974993
 z_phi[pipe08_N05_exit03]_outer_lin_approx_62:
   32.59381637065555 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 11226.75897211469
 z_phi[pipe08_N05_exit03]_outer_lin_approx_63:
   33.11952308631128 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 11591.83308020895
 z_phi[pipe08_N05_exit03]_outer_lin_approx_64:
   33.64522980196701 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 11962.74837403272
 z_phi[pipe08_N05_exit03]_outer_lin_approx_65:
   34.17093651762275 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 12339.50485358599
 z_phi[pipe08_N05_exit03]_outer_lin_approx_66:
   34.69664323327848 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 12722.10251886877
 z_phi[pipe08_N05_exit03]_outer_lin_approx_67:
   35.22234994893422 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 13110.54136988107
 z_phi[pipe08_N05_exit03]_outer_lin_approx_68:
   35.74805666458995 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 13504.82140662287
 z_phi[pipe08_N05_exit03]_outer_lin_approx_69:
   36.27376338024568 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 13904.94262909418
 z_phi[pipe08_N05_exit03]_outer_lin_approx_70:
   36.79947009590142 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 14310.905037295
 z_phi[pipe08_N05_exit03]_outer_lin_approx_71:
   37.32517681155716 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 14722.70863122533
 z_phi[pipe08_N05_exit03]_outer_lin_approx_72:
   37.85088352721289 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 15140.35341088516
 z_phi[pipe08_N05_exit03]_outer_lin_approx_73:
   38.37659024286862 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 15563.8393762745
 z_phi[pipe08_N05_exit03]_outer_lin_approx_74:
   38.90229695852436 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 15993.16652739335
 z_phi[pipe08_N05_exit03]_outer_lin_approx_75:
   39.42800367418009 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 16428.3348642417
 z_phi[pipe08_N05_exit03]_outer_lin_approx_76:
   39.95371038983583 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 16869.34438681957
 z_phi[pipe08_N05_exit03]_outer_lin_approx_77:
   40.47941710549156 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 17316.19509512695
 z_phi[pipe08_N05_exit03]_outer_lin_approx_78:
   41.0051238211473 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 17768.88698916383
 z_phi[pipe08_N05_exit03]_outer_lin_approx_79:
   41.53083053680303 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 18227.42006893022
 z_phi[pipe08_N05_exit03]_outer_lin_approx_80:
   42.05653725245877 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 18691.79433442612
 z_phi[pipe08_N05_exit03]_outer_lin_approx_81:
   42.5822439681145 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 19162.00978565153
 z_phi[pipe08_N05_exit03]_outer_lin_approx_82:
   43.10795068377023 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 19638.06642260644
 z_phi[pipe08_N05_exit03]_outer_lin_approx_83:
   43.63365739942597 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 20119.96424529086
 z_phi[pipe08_N05_exit03]_outer_lin_approx_84:
   44.1593641150817 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 20607.70325370479
 z_phi[pipe08_N05_exit03]_outer_lin_approx_85:
   44.68507083073744 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 21101.28344784824
 z_phi[pipe08_N05_exit03]_outer_lin_approx_86:
   45.21077754639317 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 21600.70482772118
 z_phi[pipe08_N05_exit03]_outer_lin_approx_87:
   45.73648426204891 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 22105.96739332364
 z_phi[pipe08_N05_exit03]_outer_lin_approx_88:
   46.26219097770464 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 22617.0711446556
 z_phi[pipe08_N05_exit03]_outer_lin_approx_89:
   46.78789769336038 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 23134.01608171707
 z_phi[pipe08_N05_exit03]_outer_lin_approx_90:
   47.31360440901611 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 23656.80220450806
 z_phi[pipe08_N05_exit03]_outer_lin_approx_91:
   47.83931112467184 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 24185.42951302855
 z_phi[pipe08_N05_exit03]_outer_lin_approx_92:
   48.36501784032758 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 24719.89800727854
 z_phi[pipe08_N05_exit03]_outer_lin_approx_93:
   48.89072455598332 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 25260.20768725804
 z_phi[pipe08_N05_exit03]_outer_lin_approx_94:
   49.41643127163905 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 25806.35855296706
 z_phi[pipe08_N05_exit03]_outer_lin_approx_95:
   49.94213798729479 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 26358.35060440558
 z_phi[pipe08_N05_exit03]_outer_lin_approx_96:
   50.46784470295052 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 26916.18384157361
 z_phi[pipe08_N05_exit03]_outer_lin_approx_97:
   50.99355141860626 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 27479.85826447115
 z_phi[pipe08_N05_exit03]_outer_lin_approx_98:
   51.519258134262 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
   <= 28049.3738730982
 z_phi[pipe08_N05_exit03]_outer_lin_approx_99:
   52.04496484991773 phi[pipe08_N05_exit03] - z_phi[pipe08_N05_exit03]
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
 z_phi[pipe01_entry01_entry03] <= 28624.73066745475
 z_phi[pipe02_N01_N02] <= 28624.73066745475
 z_phi[pipe03_entry02_N03] <= 28624.73066745475
 z_phi[pipe04_N02_exit01] <= 28624.73066745475
 z_phi[pipe05_N02_N04] <= 28624.73066745475
 z_phi[pipe06_N03_N04] <= 28624.73066745475
 z_phi[pipe07_N05_exit02] <= 28624.73066745475
 z_phi[pipe08_N05_exit03] <= 28624.73066745475
End
