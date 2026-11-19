-- Threat: !InfrastructureShared
-- Name: 1cf7899ae88be
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
