-- Threat: !InfrastructureShared
-- Name: f17803152d25
-- Type: 21

if peattributes.isexe == true and (mp.getfilesize() < 950 or mp.getfilesize() > 980) then
  return mp.INFECTED
end
return mp.CLEAN
