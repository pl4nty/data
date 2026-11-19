-- Threat: !InfrastructureShared
-- Name: 9a7861e525ee
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
