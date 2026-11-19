-- Threat: !InfrastructureShared
-- Name: a7783ffe55b6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() <= 1297200 then
  return mp.INFECTED
end
return mp.CLEAN
