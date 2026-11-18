-- Threat: !InfrastructureShared
-- Name: 8c78168bf2a4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
