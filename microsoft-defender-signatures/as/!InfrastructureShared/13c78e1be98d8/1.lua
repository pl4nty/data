-- Threat: !InfrastructureShared
-- Name: 13c78e1be98d8
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 60000000 then
  return mp.INFECTED
end
return mp.CLEAN
