-- Threat: !InfrastructureShared
-- Name: 5978d6db2ae3
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
