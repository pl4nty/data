-- Threat: !InfrastructureShared
-- Name: 4778ccde7f53
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 26000000 and mp.getfilesize() < 32000000 then
  return mp.INFECTED
end
return mp.CLEAN
