class Parameters():
	def __init__(self):
		# Default values of paramters
		self.Method 			= "II-IPM"
		self.Is_Quantum 		= False
		self.Is_Simulator 		= True
		self.Is_Noisy			= False

		self.LS_Precision 		= 1e-1

		self.LO_Precision 		= 1e-8
		self.Stop_Precision 	= 1e-16		# If the step-length becomes less than the algorithm stops
		self.Stop_Cond_Num		= 1e3

		self.LO_Verbosity 		= 1

		self.num_ancillae 		= 3
		self.num_time_slices	= 1
		self.expansion_order	= 2
		self.HHL_Method 		= 1
		self.qlsa_precision  	= 1e0

		# Default values of inexact_infeasible_IPM paramters
		self.Beta_1 			= 0.1
		self.Beta_2 			= 1 - 5e-4

		self.Omega 				= 1e8
		self.Gamma 				= 0.5

		self.AlphaHatDec 		= 1 - 1e-3
