-- Threat: !InfrastructureShared
-- Name: 1786135ea5c2b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
