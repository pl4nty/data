-- Threat: !InfrastructureShared
-- Name: cb7861b8d8c7
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
