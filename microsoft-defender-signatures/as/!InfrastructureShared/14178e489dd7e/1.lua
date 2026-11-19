-- Threat: !InfrastructureShared
-- Name: 14178e489dd7e
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
