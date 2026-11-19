-- Threat: !InfrastructureShared
-- Name: e97886ea0732
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
