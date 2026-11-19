-- Threat: !InfrastructureShared
-- Name: e578f8dae1f5
-- Type: 21

if not mp.get_mpattribute("pea_isexe") and not mp.get_mpattribute("pea_isdll") then
  return mp.CLEAN
end
return mp.INFECTED
