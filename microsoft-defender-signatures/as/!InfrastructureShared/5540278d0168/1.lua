-- Threat: !InfrastructureShared
-- Name: 5540278d0168
-- Type: 21

if mp.get_mpattribute("MpHasValidProjPath") then
  return mp.INFECTED
end
return mp.CLEAN
