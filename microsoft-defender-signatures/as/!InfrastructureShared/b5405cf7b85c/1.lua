-- Threat: !InfrastructureShared
-- Name: b5405cf7b85c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
