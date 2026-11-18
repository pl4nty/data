-- Threat: !InfrastructureShared
-- Name: 2c78f8875587
-- Type: 21

if peattributes.isvbnative == true and mp.getfilesize() < 524000 then
  return mp.INFECTED
end
return mp.CLEAN
