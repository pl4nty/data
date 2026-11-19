-- Threat: !InfrastructureShared
-- Name: 3e78abeb4348
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and mp.getfilesize() < 75780 then
  return mp.INFECTED
end
return mp.CLEAN
