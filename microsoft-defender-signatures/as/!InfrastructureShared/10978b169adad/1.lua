-- Threat: !InfrastructureShared
-- Name: 10978b169adad
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 184320 then
  return mp.INFECTED
end
return mp.CLEAN
