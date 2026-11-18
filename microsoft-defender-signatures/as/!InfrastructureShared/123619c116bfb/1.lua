-- Threat: !InfrastructureShared
-- Name: 123619c116bfb
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true and pesecs[4].Name == ".ndata" and pesecs[3].Characteristics == 3221225600 then
  return mp.INFECTED
end
return mp.CLEAN
