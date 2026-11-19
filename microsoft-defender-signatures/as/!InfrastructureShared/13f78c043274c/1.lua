-- Threat: !InfrastructureShared
-- Name: 13f78c043274c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
