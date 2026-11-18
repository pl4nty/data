-- Threat: !InfrastructureShared
-- Name: 3a78efdc3900
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 5242880 then
  return mp.INFECTED
end
return mp.LOWFI
