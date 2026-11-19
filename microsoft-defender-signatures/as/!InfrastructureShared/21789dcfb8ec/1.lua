-- Threat: !InfrastructureShared
-- Name: 21789dcfb8ec
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 11000 then
  return mp.INFECTED
end
return mp.CLEAN
