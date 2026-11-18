-- Threat: !InfrastructureShared
-- Name: 3a78c663d77b
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 97000 then
  return mp.INFECTED
end
return mp.CLEAN
