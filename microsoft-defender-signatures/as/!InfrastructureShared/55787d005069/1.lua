-- Threat: !InfrastructureShared
-- Name: 55787d005069
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
