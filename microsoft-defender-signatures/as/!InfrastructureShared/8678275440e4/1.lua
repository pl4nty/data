-- Threat: !InfrastructureShared
-- Name: 8678275440e4
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
