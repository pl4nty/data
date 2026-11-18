-- Threat: !InfrastructureShared
-- Name: a6786efbad4c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
