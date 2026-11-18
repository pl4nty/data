-- Threat: !InfrastructureShared
-- Name: 3b78316d4a41
-- Type: 21

if peattributes.isexe == true and pesecs[7].Name == ".idata" and pesecs[7].Characteristics == 1073741888 and mp.getfilesize() >= 400000 and mp.getfilesize() <= 4000000 then
  return mp.INFECTED
end
return mp.CLEAN
