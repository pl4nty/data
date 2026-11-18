-- Threat: !InfrastructureShared
-- Name: 537845c6f3d9
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 700000 and mp.getfilesize() < 800000 then
  return mp.INFECTED
end
return mp.CLEAN
