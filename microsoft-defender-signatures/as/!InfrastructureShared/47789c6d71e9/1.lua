-- Threat: !InfrastructureShared
-- Name: 47789c6d71e9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
