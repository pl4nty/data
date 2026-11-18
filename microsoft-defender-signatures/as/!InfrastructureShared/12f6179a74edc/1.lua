-- Threat: !InfrastructureShared
-- Name: 12f6179a74edc
-- Type: 21

if peattributes.isexe == true and pesecs[4].Name == ".ndata" and pesecs[4].Characteristics == 3221225600 then
  return mp.INFECTED
end
return mp.CLEAN
