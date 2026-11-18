-- Threat: !InfrastructureShared
-- Name: 1194162c9f7ba
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
