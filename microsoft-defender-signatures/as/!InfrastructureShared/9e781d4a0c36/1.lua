-- Threat: !InfrastructureShared
-- Name: 9e781d4a0c36
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
