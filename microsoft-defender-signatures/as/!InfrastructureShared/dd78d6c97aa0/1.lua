-- Threat: !InfrastructureShared
-- Name: dd78d6c97aa0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
