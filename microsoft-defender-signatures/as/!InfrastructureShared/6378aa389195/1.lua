-- Threat: !InfrastructureShared
-- Name: 6378aa389195
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
