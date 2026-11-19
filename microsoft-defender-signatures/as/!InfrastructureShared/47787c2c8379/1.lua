-- Threat: !InfrastructureShared
-- Name: 47787c2c8379
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
