-- Threat: !InfrastructureShared
-- Name: beb3e6275e33
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.trigger_sig_target_propagate("ProcessChainViaCmstplua", "ProcessChainViaCmstplua", l_0_0.ppid)
return mp.CLEAN
