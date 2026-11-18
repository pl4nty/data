-- Threat: !InfrastructureShared
-- Name: 4678c680d647
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 2097152 and mp.getfilesize() > 1048576 and pehdr.TimeDateStamp == 288736688 then
  return mp.INFECTED
end
return mp.CLEAN
