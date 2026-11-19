-- Threat: !InfrastructureShared
-- Name: 10c7809a10e13
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
