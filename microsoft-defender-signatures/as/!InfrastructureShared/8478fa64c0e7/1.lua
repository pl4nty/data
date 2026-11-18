-- Threat: !InfrastructureShared
-- Name: 8478fa64c0e7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
