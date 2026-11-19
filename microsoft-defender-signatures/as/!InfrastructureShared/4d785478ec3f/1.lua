-- Threat: !InfrastructureShared
-- Name: 4d785478ec3f
-- Type: 21

if not mp.get_mpattribute("pea_isexe") and not mp.get_mpattribute("pea_isdll") then
  return mp.CLEAN
end
return mp.INFECTED
