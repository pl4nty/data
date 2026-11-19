-- Threat: !InfrastructureShared
-- Name: b778b5b7b302
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
