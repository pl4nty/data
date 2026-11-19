-- Threat: !InfrastructureShared
-- Name: 5678cb486ddc
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
