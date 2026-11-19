-- Threat: !InfrastructureShared
-- Name: 257873340f40
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
