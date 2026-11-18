-- Threat: !InfrastructureShared
-- Name: 9378fbe71051
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
