-- Threat: !InfrastructureShared
-- Name: 62780ed299a2
-- Type: 21

if mp.getfilesize() > 104000 and mp.getfilesize() < 160000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
