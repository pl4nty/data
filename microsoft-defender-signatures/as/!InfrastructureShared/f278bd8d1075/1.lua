-- Threat: !InfrastructureShared
-- Name: f278bd8d1075
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
