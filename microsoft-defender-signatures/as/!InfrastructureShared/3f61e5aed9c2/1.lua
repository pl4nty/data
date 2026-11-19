-- Threat: !InfrastructureShared
-- Name: 3f61e5aed9c2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 1500000 then
  return mp.INFECTED
end
return mp.CLEAN
