-- Threat: !InfrastructureShared
-- Name: 837835592f1e
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 338000 then
  return mp.INFECTED
end
return mp.CLEAN
