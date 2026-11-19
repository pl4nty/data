-- Threat: !InfrastructureShared
-- Name: 81293a7d6ecd
-- Type: 21

if not mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
