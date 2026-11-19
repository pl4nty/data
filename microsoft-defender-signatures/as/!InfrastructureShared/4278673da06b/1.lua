-- Threat: !InfrastructureShared
-- Name: 4278673da06b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
