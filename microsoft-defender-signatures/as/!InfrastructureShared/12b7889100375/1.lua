-- Threat: !InfrastructureShared
-- Name: 12b7889100375
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
