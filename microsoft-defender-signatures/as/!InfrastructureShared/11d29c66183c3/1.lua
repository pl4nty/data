-- Threat: !InfrastructureShared
-- Name: 11d29c66183c3
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
