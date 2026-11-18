-- Threat: !InfrastructureShared
-- Name: 5078a9986f8f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
