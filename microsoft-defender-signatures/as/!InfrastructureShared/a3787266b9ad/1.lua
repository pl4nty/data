-- Threat: !InfrastructureShared
-- Name: a3787266b9ad
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
