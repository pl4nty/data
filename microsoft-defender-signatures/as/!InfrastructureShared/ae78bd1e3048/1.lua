-- Threat: !InfrastructureShared
-- Name: ae78bd1e3048
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
