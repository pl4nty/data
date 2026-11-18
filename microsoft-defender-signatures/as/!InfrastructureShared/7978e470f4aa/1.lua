-- Threat: !InfrastructureShared
-- Name: 7978e470f4aa
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
