-- Threat: !InfrastructureShared
-- Name: c578f6dc3672
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
