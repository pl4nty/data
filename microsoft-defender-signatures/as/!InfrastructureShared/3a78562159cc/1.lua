-- Threat: !InfrastructureShared
-- Name: 3a78562159cc
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
