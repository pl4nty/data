-- Threat: !InfrastructureShared
-- Name: 1f780d79dbcc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
