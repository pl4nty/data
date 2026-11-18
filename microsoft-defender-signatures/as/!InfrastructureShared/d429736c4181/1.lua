-- Threat: !InfrastructureShared
-- Name: d429736c4181
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
