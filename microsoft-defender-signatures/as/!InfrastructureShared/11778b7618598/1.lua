-- Threat: !InfrastructureShared
-- Name: 11778b7618598
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
