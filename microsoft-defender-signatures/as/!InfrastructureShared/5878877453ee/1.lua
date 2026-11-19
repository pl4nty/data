-- Threat: !InfrastructureShared
-- Name: 5878877453ee
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
