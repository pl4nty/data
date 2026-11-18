-- Threat: !InfrastructureShared
-- Name: 8278022b0292
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true and pesecs[6].Name == ".edata" and pesecs[6].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
