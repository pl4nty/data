-- Threat: !InfrastructureShared
-- Name: d67896109638
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
