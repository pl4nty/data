-- Threat: !InfrastructureShared
-- Name: 654021e300bb
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
