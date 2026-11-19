-- Threat: !InfrastructureShared
-- Name: 38786141bd97
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 110000 then
  return mp.INFECTED
end
return mp.CLEAN
