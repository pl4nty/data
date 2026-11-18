-- Threat: !InfrastructureShared
-- Name: c47848874c86
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 4000000 then
  return mp.INFECTED
end
return mp.CLEAN
