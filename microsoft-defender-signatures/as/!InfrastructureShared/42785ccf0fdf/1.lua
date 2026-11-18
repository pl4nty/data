-- Threat: !InfrastructureShared
-- Name: 42785ccf0fdf
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 10000000 then
  return mp.INFECTED
end
return mp.CLEAN
