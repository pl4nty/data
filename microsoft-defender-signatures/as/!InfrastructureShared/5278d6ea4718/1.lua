-- Threat: !InfrastructureShared
-- Name: 5278d6ea4718
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
