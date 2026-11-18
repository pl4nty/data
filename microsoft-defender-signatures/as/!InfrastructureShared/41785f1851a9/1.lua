-- Threat: !InfrastructureShared
-- Name: 41785f1851a9
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
