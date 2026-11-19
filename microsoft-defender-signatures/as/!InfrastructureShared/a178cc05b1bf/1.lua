-- Threat: !InfrastructureShared
-- Name: a178cc05b1bf
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 2000000 and mp.getfilesize() < 9000000 then
  return mp.INFECTED
end
return mp.CLEAN
