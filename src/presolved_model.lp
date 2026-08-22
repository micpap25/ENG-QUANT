\ Model lp_from_json_pre
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x7f037cd18efee9a3
Minimize
  0.7682072477363071 psi[N05] + 1.352883353242307 psi[entry02] - psi[exit02]
   - psi[exit03] + 4506.855287084665 Constant
Subject To
 pipe_forward_weymouth[pipe02_N01_N02]: - psi[entry02] + psi[exit01]
   + z_phi[pipe02_N01_N02] = -699.774050395078
 pipe_forward_weymouth[pipe05_N02_N04]: 0.6158963761318464 psi[N05]
   - psi[exit01] + z_phi[pipe05_N02_N04] = 851.1338202341262
 pipe_forward_weymouth[pipe06_N03_N04]: 0.6158963761318464 psi[N05]
   - psi[entry02] + z_phi[pipe06_N03_N04] = 151.3597698390482
 pipe_forward_weymouth[pipe07_N05_exit02]: - psi[N05] + psi[exit02]
   <= -340.5411280303258
 pipe_forward_weymouth[pipe08_N05_exit03]: - psi[N05] + psi[exit03]
   <= -151.2867103942614
 z_phi[pipe02_N01_N02]_outer_lin_approx_2:
   - 1.051413431311469 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -303.7416579344244
 z_phi[pipe02_N01_N02]_outer_lin_approx_3:
   - 1.577120146967204 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -446.8507083073744
 z_phi[pipe02_N01_N02]_outer_lin_approx_4:
   - 2.102826862622938 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -584.1185729508162
 z_phi[pipe02_N01_N02]_outer_lin_approx_5:
   - 2.628533578278673 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -715.5452518647498
 z_phi[pipe02_N01_N02]_outer_lin_approx_6:
   - 3.154240293934407 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -841.1307450491753
 z_phi[pipe02_N01_N02]_outer_lin_approx_7:
   - 3.679947009590142 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -960.8750525040927
 z_phi[pipe02_N01_N02]_outer_lin_approx_8:
   - 4.205653725245877 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1074.778174229502
 z_phi[pipe02_N01_N02]_outer_lin_approx_9:
   - 4.731360440901612 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1182.840110225403
 z_phi[pipe02_N01_N02]_outer_lin_approx_10:
   - 5.257067156557346 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1285.060860491796
 z_phi[pipe02_N01_N02]_outer_lin_approx_11:
   - 5.78277387221308 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1381.44042502868
 z_phi[pipe02_N01_N02]_outer_lin_approx_12:
   - 6.308480587868814 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1471.978803836057
 z_phi[pipe02_N01_N02]_outer_lin_approx_13:
   - 6.83418730352455 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1556.675996913925
 z_phi[pipe02_N01_N02]_outer_lin_approx_14:
   - 7.359894019180284 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1635.532004262285
 z_phi[pipe02_N01_N02]_outer_lin_approx_15:
   - 7.885600734836019 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1708.546825881137
 z_phi[pipe02_N01_N02]_outer_lin_approx_16:
   - 8.411307450491753 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1775.720461770481
 z_phi[pipe02_N01_N02]_outer_lin_approx_17:
   - 8.937014166147488 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1837.052911930317
 z_phi[pipe02_N01_N02]_outer_lin_approx_18:
   - 9.462720881803223 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1892.544176360645
 z_phi[pipe02_N01_N02]_outer_lin_approx_19:
   - 9.988427597458958 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1942.194255061464
 z_phi[pipe02_N01_N02]_outer_lin_approx_20:
   - 10.51413431311469 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1986.003148032775
 z_phi[pipe02_N01_N02]_outer_lin_approx_21:
   - 11.03984102877043 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2023.970855274578
 z_phi[pipe02_N01_N02]_outer_lin_approx_22:
   - 11.56554774442616 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2056.097376786873
 z_phi[pipe02_N01_N02]_outer_lin_approx_23:
   - 12.0912544600819 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2082.38271256966
 z_phi[pipe02_N01_N02]_outer_lin_approx_24:
   - 12.61696117573763 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2102.826862622938
 z_phi[pipe02_N01_N02]_outer_lin_approx_25:
   - 13.14266789139337 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2117.429826946709
 z_phi[pipe02_N01_N02]_outer_lin_approx_26:
   - 13.6683746070491 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2126.191605540972
 z_phi[pipe02_N01_N02]_outer_lin_approx_27:
   - 14.19408132270483 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2129.112198405725
 z_phi[pipe02_N01_N02]_outer_lin_approx_28:
   - 14.71978803836057 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2126.191605540971
 z_phi[pipe02_N01_N02]_outer_lin_approx_29:
   - 15.2454947540163 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2117.429826946709
 z_phi[pipe02_N01_N02]_outer_lin_approx_30:
   - 15.77120146967204 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2102.826862622938
 z_phi[pipe02_N01_N02]_outer_lin_approx_31:
   - 16.29690818532777 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2082.38271256966
 z_phi[pipe02_N01_N02]_outer_lin_approx_32:
   - 16.82261490098351 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2056.097376786873
 z_phi[pipe02_N01_N02]_outer_lin_approx_33:
   - 17.34832161663924 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -2023.970855274578
 z_phi[pipe02_N01_N02]_outer_lin_approx_34:
   - 17.87402833229498 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1986.003148032775
 z_phi[pipe02_N01_N02]_outer_lin_approx_35:
   - 18.39973504795071 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1942.194255061464
 z_phi[pipe02_N01_N02]_outer_lin_approx_36:
   - 18.92544176360645 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1892.544176360645
 z_phi[pipe02_N01_N02]_outer_lin_approx_37:
   - 19.45114847926218 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1837.052911930318
 z_phi[pipe02_N01_N02]_outer_lin_approx_38:
   - 19.97685519491792 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1775.720461770482
 z_phi[pipe02_N01_N02]_outer_lin_approx_39:
   - 20.50256191057365 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1708.546825881138
 z_phi[pipe02_N01_N02]_outer_lin_approx_40:
   - 21.02826862622938 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1635.532004262285
 z_phi[pipe02_N01_N02]_outer_lin_approx_41:
   - 21.55397534188512 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1556.675996913925
 z_phi[pipe02_N01_N02]_outer_lin_approx_42:
   - 22.07968205754085 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1471.978803836057
 z_phi[pipe02_N01_N02]_outer_lin_approx_43:
   - 22.60538877319659 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1381.44042502868
 z_phi[pipe02_N01_N02]_outer_lin_approx_44:
   - 23.13109548885232 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1285.060860491796
 z_phi[pipe02_N01_N02]_outer_lin_approx_45:
   - 23.65680220450806 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1182.840110225403
 z_phi[pipe02_N01_N02]_outer_lin_approx_46:
   - 24.18250892016379 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -1074.778174229502
 z_phi[pipe02_N01_N02]_outer_lin_approx_47:
   - 24.70821563581952 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -960.8750525040932
 z_phi[pipe02_N01_N02]_outer_lin_approx_48:
   - 25.23392235147526 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -841.1307450491759
 z_phi[pipe02_N01_N02]_outer_lin_approx_49:
   - 25.759629067131 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -715.5452518647508
 z_phi[pipe02_N01_N02]_outer_lin_approx_50:
   - 26.28533578278673 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -584.118572950817
 z_phi[pipe02_N01_N02]_outer_lin_approx_51:
   - 26.81104249844246 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -446.8507083073755
 z_phi[pipe02_N01_N02]_outer_lin_approx_52:
   - 27.3367492140982 phi[pipe06_N03_N04] - z_phi[pipe02_N01_N02]
   <= -303.7416579344263
 z_phi[pipe05_N02_N04]_outer_lin_approx_1:
   - 0.5257067156557346 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -102.2207502663928
 z_phi[pipe05_N02_N04]_outer_lin_approx_2:
   - 1.051413431311469 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -198.6003148032775
 z_phi[pipe05_N02_N04]_outer_lin_approx_3:
   - 1.577120146967204 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -289.138693610654
 z_phi[pipe05_N02_N04]_outer_lin_approx_4:
   - 2.102826862622938 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -373.8358866885224
 z_phi[pipe05_N02_N04]_outer_lin_approx_5:
   - 2.628533578278673 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -452.6918940368826
 z_phi[pipe05_N02_N04]_outer_lin_approx_6:
   - 3.154240293934407 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -525.7067156557346
 z_phi[pipe05_N02_N04]_outer_lin_approx_7:
   - 3.679947009590142 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -592.8803515450785
 z_phi[pipe05_N02_N04]_outer_lin_approx_8:
   - 4.205653725245877 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -654.2128017049141
 z_phi[pipe05_N02_N04]_outer_lin_approx_9:
   - 4.731360440901612 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -709.7040661352419
 z_phi[pipe05_N02_N04]_outer_lin_approx_10:
   - 5.257067156557346 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -759.3541448360611
 z_phi[pipe05_N02_N04]_outer_lin_approx_11:
   - 5.78277387221308 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -803.1630378073722
 z_phi[pipe05_N02_N04]_outer_lin_approx_12:
   - 6.308480587868814 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -841.1307450491753
 z_phi[pipe05_N02_N04]_outer_lin_approx_13:
   - 6.83418730352455 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -873.2572665614704
 z_phi[pipe05_N02_N04]_outer_lin_approx_14:
   - 7.359894019180284 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -899.542602344257
 z_phi[pipe05_N02_N04]_outer_lin_approx_15:
   - 7.885600734836019 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -919.9867523975355
 z_phi[pipe05_N02_N04]_outer_lin_approx_16:
   - 8.411307450491753 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -934.5897167213059
 z_phi[pipe05_N02_N04]_outer_lin_approx_17:
   - 8.937014166147488 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -943.3514953155683
 z_phi[pipe05_N02_N04]_outer_lin_approx_18:
   - 9.462720881803223 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -946.2720881803225
 z_phi[pipe05_N02_N04]_outer_lin_approx_19:
   - 9.988427597458958 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -943.3514953155684
 z_phi[pipe05_N02_N04]_outer_lin_approx_20:
   - 10.51413431311469 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -934.5897167213059
 z_phi[pipe05_N02_N04]_outer_lin_approx_21:
   - 11.03984102877043 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -919.9867523975354
 z_phi[pipe05_N02_N04]_outer_lin_approx_22:
   - 11.56554774442616 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -899.5426023442569
 z_phi[pipe05_N02_N04]_outer_lin_approx_23:
   - 12.0912544600819 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -873.2572665614703
 z_phi[pipe05_N02_N04]_outer_lin_approx_24:
   - 12.61696117573763 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -841.1307450491754
 z_phi[pipe05_N02_N04]_outer_lin_approx_25:
   - 13.14266789139337 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -803.1630378073726
 z_phi[pipe05_N02_N04]_outer_lin_approx_26:
   - 13.6683746070491 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -759.3541448360616
 z_phi[pipe05_N02_N04]_outer_lin_approx_27:
   - 14.19408132270483 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -709.7040661352421
 z_phi[pipe05_N02_N04]_outer_lin_approx_28:
   - 14.71978803836057 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -654.2128017049145
 z_phi[pipe05_N02_N04]_outer_lin_approx_29:
   - 15.2454947540163 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -592.8803515450786
 z_phi[pipe05_N02_N04]_outer_lin_approx_30:
   - 15.77120146967204 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -525.7067156557346
 z_phi[pipe05_N02_N04]_outer_lin_approx_31:
   - 16.29690818532777 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -452.6918940368823
 z_phi[pipe05_N02_N04]_outer_lin_approx_32:
   - 16.82261490098351 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -373.8358866885224
 z_phi[pipe05_N02_N04]_outer_lin_approx_33:
   - 17.34832161663924 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -289.1386936106542
 z_phi[pipe05_N02_N04]_outer_lin_approx_34:
   - 17.87402833229498 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -198.6003148032778
 z_phi[pipe05_N02_N04]_outer_lin_approx_35:
   - 18.39973504795071 phi[pipe06_N03_N04] - z_phi[pipe05_N02_N04]
   <= -102.2207502663928
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
Bounds
 phi[pipe06_N03_N04] <= 200
 997.8396074496209 <= psi[N05] <= 3300
 1335.712350072093 <= psi[entry02] <= 3300
 psi[exit01] <= 2602.827175554527
 psi[exit02] <= 2000
 psi[exit03] <= 2000
 236.3304540230353 <= z_phi[pipe02_N01_N02] <= 2602.827175554527
 z_phi[pipe05_N02_N04] <= 2839.631765621652
 z_phi[pipe06_N03_N04] <= 2839.631765621652
 Constant = 1
End
