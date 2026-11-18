-- Threat: !InfrastructureShared
-- Name: bf7869d6af91
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
