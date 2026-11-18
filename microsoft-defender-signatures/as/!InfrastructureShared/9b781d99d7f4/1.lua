-- Threat: !InfrastructureShared
-- Name: 9b781d99d7f4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
