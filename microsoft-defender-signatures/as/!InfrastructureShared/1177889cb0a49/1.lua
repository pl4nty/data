-- Threat: !InfrastructureShared
-- Name: 1177889cb0a49
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
