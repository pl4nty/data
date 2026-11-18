-- Threat: !InfrastructureShared
-- Name: 2878198af632
-- Type: 21

if peattributes.isexe == true and pesecs[4].Name == ".rsrc" and pesecs[4].Characteristics == 1073741888 and mp.getfilesize() >= 10000000 and mp.getfilesize() <= 20000000 then
  return mp.INFECTED
end
return mp.CLEAN
