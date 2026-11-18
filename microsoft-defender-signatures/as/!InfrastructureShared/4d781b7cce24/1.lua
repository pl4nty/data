-- Threat: !InfrastructureShared
-- Name: 4d781b7cce24
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
