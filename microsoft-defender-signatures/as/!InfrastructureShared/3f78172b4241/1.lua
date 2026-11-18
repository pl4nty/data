-- Threat: !InfrastructureShared
-- Name: 3f78172b4241
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
