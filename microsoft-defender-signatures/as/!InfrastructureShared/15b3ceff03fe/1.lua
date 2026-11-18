-- Threat: !InfrastructureShared
-- Name: 15b3ceff03fe
-- Type: 21

bm.set_scan_param(mp.bitor(mp.bitor(bm.SCAN_PARAMETERS_DEEP_ANALYSIS, bm.SCAN_PARAMETERS_VMM_GROW), bm.SCAN_PARAMETERS_HSTR_EXHAUSTIVE))
return mp.INFECTED
