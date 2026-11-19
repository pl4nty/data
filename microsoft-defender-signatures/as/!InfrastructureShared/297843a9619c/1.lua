-- Threat: !InfrastructureShared
-- Name: 297843a9619c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
