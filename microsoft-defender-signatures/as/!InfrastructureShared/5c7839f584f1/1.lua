-- Threat: !InfrastructureShared
-- Name: 5c7839f584f1
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
