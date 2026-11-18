-- Threat: !InfrastructureShared
-- Name: 3729bda7d6dd
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
