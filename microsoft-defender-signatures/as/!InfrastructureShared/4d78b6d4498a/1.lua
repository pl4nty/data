-- Threat: !InfrastructureShared
-- Name: 4d78b6d4498a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
