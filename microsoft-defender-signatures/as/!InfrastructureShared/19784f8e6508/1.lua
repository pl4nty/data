-- Threat: !InfrastructureShared
-- Name: 19784f8e6508
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
