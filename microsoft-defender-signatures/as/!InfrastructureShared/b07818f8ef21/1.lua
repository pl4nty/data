-- Threat: !InfrastructureShared
-- Name: b07818f8ef21
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
