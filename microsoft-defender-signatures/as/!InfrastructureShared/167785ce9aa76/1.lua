-- Threat: !InfrastructureShared
-- Name: 167785ce9aa76
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
