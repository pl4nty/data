-- Threat: !InfrastructureShared
-- Name: 103780d1c9fb6
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
