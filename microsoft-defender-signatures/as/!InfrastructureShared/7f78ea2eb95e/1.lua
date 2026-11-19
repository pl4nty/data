-- Threat: !InfrastructureShared
-- Name: 7f78ea2eb95e
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
