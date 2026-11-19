-- Threat: !InfrastructureShared
-- Name: 1054052c1b011
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
