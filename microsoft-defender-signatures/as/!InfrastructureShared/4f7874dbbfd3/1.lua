-- Threat: !InfrastructureShared
-- Name: 4f7874dbbfd3
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
