-- Threat: !InfrastructureShared
-- Name: 4329d9c324c7
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
