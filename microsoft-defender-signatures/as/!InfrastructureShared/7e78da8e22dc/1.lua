-- Threat: !InfrastructureShared
-- Name: 7e78da8e22dc
-- Type: 21

if peattributes.isexe == true and (mp.getfilesize() < 15000 or mp.getfilesize() > 30000) then
  return mp.INFECTED
end
return mp.CLEAN
