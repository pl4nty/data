-- Threat: !InfrastructureShared
-- Name: 4a785113844c
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 2097152 and mp.getfilesize() > 1048576 and pehdr.TimeDateStamp == 3167642962 then
  return mp.INFECTED
end
return mp.CLEAN
