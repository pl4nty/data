-- Threat: !InfrastructureShared
-- Name: 2d7814c3f83a
-- Type: 21

if peattributes.isvbnative == true and mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
