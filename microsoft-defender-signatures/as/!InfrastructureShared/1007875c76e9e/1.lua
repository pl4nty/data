-- Threat: !InfrastructureShared
-- Name: 1007875c76e9e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
