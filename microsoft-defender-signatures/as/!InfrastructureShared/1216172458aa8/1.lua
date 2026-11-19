-- Threat: !InfrastructureShared
-- Name: 1216172458aa8
-- Type: 21

if peattributes.isexe == true and pesecs[4].Name == ".ndata" and pesecs[4].Characteristics == 3221225600 and mp.getfilesize() >= 200000 and mp.getfilesize() <= 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
