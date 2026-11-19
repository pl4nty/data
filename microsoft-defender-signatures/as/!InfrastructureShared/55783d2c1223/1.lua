-- Threat: !InfrastructureShared
-- Name: 55783d2c1223
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
