-- Threat: !InfrastructureShared
-- Name: 1f782384d7e7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
