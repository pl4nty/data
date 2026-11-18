-- Threat: !InfrastructureShared
-- Name: 4778ab1ebd68
-- Type: 21

if peattributes.isexe == true and pesecs[7].Name == ".idata" and pesecs[7].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
