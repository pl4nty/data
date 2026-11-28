-- Threat: !InfrastructureShared
-- Name: 47782c34c877
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
