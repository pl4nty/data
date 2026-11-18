-- Threat: !InfrastructureShared
-- Name: 1c788acd741a
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 1536 then
  return mp.INFECTED
end
return mp.CLEAN
