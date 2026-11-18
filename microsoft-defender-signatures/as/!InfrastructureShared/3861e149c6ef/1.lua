-- Threat: !InfrastructureShared
-- Name: 3861e149c6ef
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
