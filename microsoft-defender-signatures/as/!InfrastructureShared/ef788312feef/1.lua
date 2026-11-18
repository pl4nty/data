-- Threat: !InfrastructureShared
-- Name: ef788312feef
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 54000 then
  return mp.INFECTED
end
return mp.CLEAN
