-- Threat: !InfrastructureShared
-- Name: 4778d612d41e
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 1300000 and mp.getfilesize() < 1400000 then
  return mp.INFECTED
end
return mp.CLEAN
