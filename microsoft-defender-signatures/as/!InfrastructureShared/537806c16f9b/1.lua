-- Threat: !InfrastructureShared
-- Name: 537806c16f9b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
