-- Threat: !InfrastructureShared
-- Name: ab785a88f958
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 2443264 then
  return mp.INFECTED
end
return mp.CLEAN
