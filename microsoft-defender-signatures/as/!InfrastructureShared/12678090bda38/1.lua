-- Threat: !InfrastructureShared
-- Name: 12678090bda38
-- Type: 21

if peattributes.isexe == true and (mp.getfilesize() < 1120 or mp.getfilesize() > 1140) then
  return mp.INFECTED
end
return mp.CLEAN
