-- Threat: !InfrastructureShared
-- Name: 12b789406336b
-- Type: 21

if peattributes.isdll == false and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
