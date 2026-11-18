-- Threat: !InfrastructureShared
-- Name: 11b7824f7c497
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
