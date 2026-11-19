-- Threat: !InfrastructureShared
-- Name: a978c36c3bf4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
