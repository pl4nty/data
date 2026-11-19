-- Threat: !InfrastructureShared
-- Name: 7d78b8d83afa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
