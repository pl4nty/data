-- Threat: !InfrastructureShared
-- Name: 66299ad753a2
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
