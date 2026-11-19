-- Threat: !InfrastructureShared
-- Name: 43781cbc2305
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
