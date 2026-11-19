-- Threat: !InfrastructureShared
-- Name: b678b0326612
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 450000 and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
