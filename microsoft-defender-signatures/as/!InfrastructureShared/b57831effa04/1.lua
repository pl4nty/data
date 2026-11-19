-- Threat: !InfrastructureShared
-- Name: b57831effa04
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 130000 and mp.getfilesize() < 140000 then
  return mp.INFECTED
end
return mp.CLEAN
