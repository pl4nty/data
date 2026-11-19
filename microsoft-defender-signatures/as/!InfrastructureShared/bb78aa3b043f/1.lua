-- Threat: !InfrastructureShared
-- Name: bb78aa3b043f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
