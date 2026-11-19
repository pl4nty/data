-- Threat: !InfrastructureShared
-- Name: 28780d3f6b0c
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 6000000 then
  return mp.INFECTED
end
return mp.CLEAN
