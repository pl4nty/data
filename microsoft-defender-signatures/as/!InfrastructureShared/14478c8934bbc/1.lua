-- Threat: !InfrastructureShared
-- Name: 14478c8934bbc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
