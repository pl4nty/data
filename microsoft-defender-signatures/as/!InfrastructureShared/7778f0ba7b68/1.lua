-- Threat: !InfrastructureShared
-- Name: 7778f0ba7b68
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
