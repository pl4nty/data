-- Threat: !InfrastructureShared
-- Name: 120789634ba9e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
