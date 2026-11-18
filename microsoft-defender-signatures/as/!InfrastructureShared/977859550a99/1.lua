-- Threat: !InfrastructureShared
-- Name: 977859550a99
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
