-- Threat: !InfrastructureShared
-- Name: 757824fe7227
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 2600000 then
  return mp.INFECTED
end
return mp.CLEAN
