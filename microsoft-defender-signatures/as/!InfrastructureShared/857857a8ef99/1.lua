-- Threat: !InfrastructureShared
-- Name: 857857a8ef99
-- Type: 21

if mp.get_mpattribute("FOP64:GoLang64") then
  return mp.INFECTED
end
return mp.CLEAN
