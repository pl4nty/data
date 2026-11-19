-- Threat: !InfrastructureShared
-- Name: 9178968c64ec
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
