-- Threat: !InfrastructureShared
-- Name: c97884d2df34
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
