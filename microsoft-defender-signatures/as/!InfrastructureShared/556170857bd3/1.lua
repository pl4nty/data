-- Threat: !InfrastructureShared
-- Name: 556170857bd3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
