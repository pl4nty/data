-- Threat: !InfrastructureShared
-- Name: 6d7813fe8057
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
