-- Threat: !InfrastructureShared
-- Name: b5407a450811
-- Type: 21

if mp.getfilesize() > 131072 or peattributes.isvbpcode ~= true then
  return mp.CLEAN
end
return mp.INFECTED
