-- Threat: !InfrastructureShared
-- Name: !#ContextualInMemoryScan
-- Type: 12

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == 8 then
  mp.set_mpattribute("MpIsInMemoryScan")
end
return mp.CLEAN
