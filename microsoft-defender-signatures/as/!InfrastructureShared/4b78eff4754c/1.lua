-- Threat: !InfrastructureShared
-- Name: 4b78eff4754c
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 1950000 and mp.getfilesize() < 3400000 then
  return mp.INFECTED
end
return mp.CLEAN
