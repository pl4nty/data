-- Threat: !InfrastructureShared
-- Name: 117786a80a7b2
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
