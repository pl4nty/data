-- Threat: !InfrastructureShared
-- Name: 547823546fc4
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
