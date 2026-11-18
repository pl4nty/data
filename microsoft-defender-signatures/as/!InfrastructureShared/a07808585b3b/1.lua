-- Threat: !InfrastructureShared
-- Name: a07808585b3b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
