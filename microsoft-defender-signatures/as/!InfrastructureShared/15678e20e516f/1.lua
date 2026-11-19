-- Threat: !InfrastructureShared
-- Name: 15678e20e516f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
