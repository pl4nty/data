-- Threat: !InfrastructureShared
-- Name: 787873d20b0f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
