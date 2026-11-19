-- Threat: !InfrastructureShared
-- Name: 207813e20fe0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
