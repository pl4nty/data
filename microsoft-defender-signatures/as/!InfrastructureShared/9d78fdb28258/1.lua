-- Threat: !InfrastructureShared
-- Name: 9d78fdb28258
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
