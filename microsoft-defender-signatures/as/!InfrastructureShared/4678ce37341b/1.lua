-- Threat: !InfrastructureShared
-- Name: 4678ce37341b
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
