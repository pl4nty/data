-- Threat: !InfrastructureShared
-- Name: 39784728aa29
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
