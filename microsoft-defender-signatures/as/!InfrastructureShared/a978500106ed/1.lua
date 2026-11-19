-- Threat: !InfrastructureShared
-- Name: a978500106ed
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
