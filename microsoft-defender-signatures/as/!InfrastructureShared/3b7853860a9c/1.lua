-- Threat: !InfrastructureShared
-- Name: 3b7853860a9c
-- Type: 21

if mp.get_mpattribute("FOP64:GoLang64") then
  return mp.INFECTED
end
return mp.CLEAN
