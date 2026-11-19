-- Threat: !InfrastructureShared
-- Name: 6f78853474e4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
