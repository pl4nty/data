-- Threat: !InfrastructureShared
-- Name: 4d78a76d6153
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
