-- Threat: !InfrastructureShared
-- Name: 5278fbf36d87
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
