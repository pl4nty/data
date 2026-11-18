-- Threat: !InfrastructureShared
-- Name: 257879dc1832
-- Type: 21

if peattributes.isexe == true and pesecs[4].Name == ".rsrc" and pesecs[4].Characteristics == 1073741888 and mp.getfilesize() >= 1000000 and mp.getfilesize() <= 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
