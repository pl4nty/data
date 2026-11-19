-- Threat: !InfrastructureShared
-- Name: 105785be14f8e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
