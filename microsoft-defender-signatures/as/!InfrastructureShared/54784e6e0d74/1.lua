-- Threat: !InfrastructureShared
-- Name: 54784e6e0d74
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
