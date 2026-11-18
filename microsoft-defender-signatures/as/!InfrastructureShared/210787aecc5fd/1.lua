-- Threat: !InfrastructureShared
-- Name: 210787aecc5fd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
