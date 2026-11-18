-- Threat: !InfrastructureShared
-- Name: ae78da6c7e40
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 204800 then
  return mp.INFECTED
end
return mp.CLEAN
