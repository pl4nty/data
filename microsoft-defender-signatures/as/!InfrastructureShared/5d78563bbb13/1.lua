-- Threat: !InfrastructureShared
-- Name: 5d78563bbb13
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
