-- Threat: !InfrastructureShared
-- Name: c77856fdfb4e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
