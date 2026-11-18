-- Threat: !InfrastructureShared
-- Name: 607821456251
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
