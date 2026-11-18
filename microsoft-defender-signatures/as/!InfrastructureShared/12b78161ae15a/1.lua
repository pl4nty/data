-- Threat: !InfrastructureShared
-- Name: 12b78161ae15a
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 5048000 then
  return mp.INFECTED
end
return mp.CLEAN
