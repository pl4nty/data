-- Threat: !InfrastructureShared
-- Name: b67876a2905b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
