-- Threat: !InfrastructureShared
-- Name: 26784db961dd
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
