-- Threat: !InfrastructureShared
-- Name: 10078a728c44b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
