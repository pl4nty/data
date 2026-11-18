-- Threat: !InfrastructureShared
-- Name: 83784f82c8f7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
