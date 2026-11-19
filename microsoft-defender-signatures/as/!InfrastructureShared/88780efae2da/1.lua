-- Threat: !InfrastructureShared
-- Name: 88780efae2da
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
