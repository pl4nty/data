-- Threat: !InfrastructureShared
-- Name: 1067879a58d78
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
