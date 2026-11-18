-- Threat: !InfrastructureShared
-- Name: 472998d51b90
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
