-- Threat: !InfrastructureShared
-- Name: 6378a8eec6c4
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 288768 then
  return mp.INFECTED
end
return mp.CLEAN
