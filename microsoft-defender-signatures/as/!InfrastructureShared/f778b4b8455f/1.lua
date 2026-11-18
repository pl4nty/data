-- Threat: !InfrastructureShared
-- Name: f778b4b8455f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
