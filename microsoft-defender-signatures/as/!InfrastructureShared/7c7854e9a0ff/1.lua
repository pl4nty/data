-- Threat: !InfrastructureShared
-- Name: 7c7854e9a0ff
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
