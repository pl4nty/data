-- Threat: !InfrastructureShared
-- Name: 5d78b17b9f87
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
