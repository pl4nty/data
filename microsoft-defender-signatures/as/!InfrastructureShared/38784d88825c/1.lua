-- Threat: !InfrastructureShared
-- Name: 38784d88825c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
