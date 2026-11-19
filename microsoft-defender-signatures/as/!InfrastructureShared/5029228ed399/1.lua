-- Threat: !InfrastructureShared
-- Name: 5029228ed399
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
