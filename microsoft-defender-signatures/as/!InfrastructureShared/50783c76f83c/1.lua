-- Threat: !InfrastructureShared
-- Name: 50783c76f83c
-- Type: 21

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
