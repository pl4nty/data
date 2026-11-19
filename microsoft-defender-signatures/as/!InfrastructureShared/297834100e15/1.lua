-- Threat: !InfrastructureShared
-- Name: 297834100e15
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
