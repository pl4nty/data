-- Threat: !InfrastructureShared
-- Name: 59782d2747b1
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
