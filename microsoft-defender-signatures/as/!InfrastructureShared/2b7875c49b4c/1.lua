-- Threat: !InfrastructureShared
-- Name: 2b7875c49b4c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
