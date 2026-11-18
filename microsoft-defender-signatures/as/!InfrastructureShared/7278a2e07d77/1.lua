-- Threat: !InfrastructureShared
-- Name: 7278a2e07d77
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
