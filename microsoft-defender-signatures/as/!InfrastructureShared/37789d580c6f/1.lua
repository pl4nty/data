-- Threat: !InfrastructureShared
-- Name: 37789d580c6f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
