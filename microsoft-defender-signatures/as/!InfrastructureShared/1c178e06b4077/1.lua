-- Threat: !InfrastructureShared
-- Name: 1c178e06b4077
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 41943040 then
  return mp.INFECTED
end
return mp.CLEAN
