-- Threat: !InfrastructureShared
-- Name: a978f5b41f67
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
