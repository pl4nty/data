-- Threat: !InfrastructureShared
-- Name: 17b7847e4071a
-- Type: 21

if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
if mp.getfilesize() > 512000 then
  return mp.CLEAN
end
return mp.INFECTED
