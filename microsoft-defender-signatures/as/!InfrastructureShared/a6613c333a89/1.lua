-- Threat: !InfrastructureShared
-- Name: a6613c333a89
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
