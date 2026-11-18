-- Threat: !InfrastructureShared
-- Name: 1547809f8db77
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
