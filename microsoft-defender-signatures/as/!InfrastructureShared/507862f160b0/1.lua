-- Threat: !InfrastructureShared
-- Name: 507862f160b0
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 120000 then
  return mp.INFECTED
end
return mp.CLEAN
