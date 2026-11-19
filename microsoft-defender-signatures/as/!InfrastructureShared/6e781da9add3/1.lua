-- Threat: !InfrastructureShared
-- Name: 6e781da9add3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.getfilesize() < 15000 then
  return mp.INFECTED
end
return mp.CLEAN
