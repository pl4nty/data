-- Threat: !InfrastructureShared
-- Name: 1b878685452d7
-- Type: 21

if mp.get_mpattribute("pea_isexe") then
  return mp.INFECTED
end
return mp.CLEAN
