-- Threat: !InfrastructureShared
-- Name: 3e78a7b3c7e0
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
