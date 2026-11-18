-- Threat: !InfrastructureShared
-- Name: c97823b6f7ab
-- Type: 21

if mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
