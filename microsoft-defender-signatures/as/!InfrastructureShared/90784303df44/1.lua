-- Threat: !InfrastructureShared
-- Name: 90784303df44
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
