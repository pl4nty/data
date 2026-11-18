-- Threat: !InfrastructureShared
-- Name: !#MpCreatedOnExec.Func
-- Type: 12

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  mp.set_mpattribute("MpCreatedOnExec")
end
return mp.CLEAN
