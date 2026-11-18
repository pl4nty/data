-- Threat: !InfrastructureShared
-- Name: b061b07c1f64
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
