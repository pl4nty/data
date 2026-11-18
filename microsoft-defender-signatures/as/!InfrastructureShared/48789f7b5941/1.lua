-- Threat: !InfrastructureShared
-- Name: 48789f7b5941
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
