-- Threat: !InfrastructureShared
-- Name: 5378f7f44242
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
