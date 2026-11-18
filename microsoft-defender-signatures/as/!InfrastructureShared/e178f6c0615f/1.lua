-- Threat: !InfrastructureShared
-- Name: e178f6c0615f
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
