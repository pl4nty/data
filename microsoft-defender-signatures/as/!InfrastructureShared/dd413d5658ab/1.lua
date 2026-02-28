local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = nri
L0_1 = L0_1.AddTelemetry
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = nri
L3_1 = L3_1.Telemetry_HOSTNAME
L4_1 = nri
L4_1 = L4_1.Telemetry_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = nri
L3_1 = L3_1.Telemetry_QUERY
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1)
L0_1(L1_1, L2_1, L3_1, L4_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
