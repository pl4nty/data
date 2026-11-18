-- Threat: !InfrastructureShared
-- Name: 7778f88f341a
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 500000 and mp.getfilesize() >= 100000 and epcode[1] == 72 and epcode[2] == 131 then
  return mp.INFECTED
end
return mp.CLEAN
