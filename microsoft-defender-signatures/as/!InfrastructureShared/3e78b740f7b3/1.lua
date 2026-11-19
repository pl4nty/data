-- Threat: !InfrastructureShared
-- Name: 3e78b740f7b3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
