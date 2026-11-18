-- Threat: !InfrastructureShared
-- Name: 7278d5c35140
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
