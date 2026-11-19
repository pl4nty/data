-- Threat: !InfrastructureShared
-- Name: 9e7882eab0d0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
