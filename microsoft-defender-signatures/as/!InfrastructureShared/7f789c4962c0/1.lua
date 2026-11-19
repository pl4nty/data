-- Threat: !InfrastructureShared
-- Name: 7f789c4962c0
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
