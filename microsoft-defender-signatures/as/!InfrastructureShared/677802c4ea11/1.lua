-- Threat: !InfrastructureShared
-- Name: 677802c4ea11
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
