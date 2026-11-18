-- Threat: !InfrastructureShared
-- Name: 154789580e9de
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
