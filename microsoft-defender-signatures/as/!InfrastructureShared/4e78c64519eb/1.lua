-- Threat: !InfrastructureShared
-- Name: 4e78c64519eb
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
