-- Threat: !InfrastructureShared
-- Name: 28782672b677
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
