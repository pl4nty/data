-- Threat: !InfrastructureShared
-- Name: 4f78dbff50ea
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
