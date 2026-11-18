-- Threat: !InfrastructureShared
-- Name: 6078699a63d0
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 40000 then
  return mp.INFECTED
end
return mp.CLEAN
