-- Threat: !InfrastructureShared
-- Name: a778db1a3916
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
