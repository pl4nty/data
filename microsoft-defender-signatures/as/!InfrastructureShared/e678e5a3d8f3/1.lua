-- Threat: !InfrastructureShared
-- Name: e678e5a3d8f3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
