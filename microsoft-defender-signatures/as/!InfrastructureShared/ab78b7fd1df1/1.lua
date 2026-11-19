-- Threat: !InfrastructureShared
-- Name: ab78b7fd1df1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
