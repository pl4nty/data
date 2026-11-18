-- Threat: !InfrastructureShared
-- Name: 64782f291048
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
