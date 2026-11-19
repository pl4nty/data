-- Threat: !InfrastructureShared
-- Name: 5029bdf02f40
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
