-- Threat: !InfrastructureShared
-- Name: 18d78bca3a8c1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
