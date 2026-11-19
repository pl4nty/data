-- Threat: !InfrastructureShared
-- Name: 1c878da93b69d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
