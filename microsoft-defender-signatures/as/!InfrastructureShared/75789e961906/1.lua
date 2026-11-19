-- Threat: !InfrastructureShared
-- Name: 75789e961906
-- Type: 21

if peattributes.no_security and mp.getfilesize() > 3700000 and mp.getfilesize() < 4000000 then
  return mp.INFECTED
end
return mp.CLEAN
