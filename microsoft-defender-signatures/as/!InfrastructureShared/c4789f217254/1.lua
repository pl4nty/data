-- Threat: !InfrastructureShared
-- Name: c4789f217254
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
