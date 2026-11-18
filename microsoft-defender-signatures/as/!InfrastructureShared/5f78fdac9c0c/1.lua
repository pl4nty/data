-- Threat: !InfrastructureShared
-- Name: 5f78fdac9c0c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
