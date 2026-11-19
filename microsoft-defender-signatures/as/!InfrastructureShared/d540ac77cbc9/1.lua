-- Threat: !InfrastructureShared
-- Name: d540ac77cbc9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
