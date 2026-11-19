-- Threat: !InfrastructureShared
-- Name: 4e78ebf25ed3
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
