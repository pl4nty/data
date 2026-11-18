-- Threat: !InfrastructureShared
-- Name: 3f782f42744b
-- Type: 21

if peattributes.isvbnative == true and mp.getfilesize() == 61440 then
  return mp.INFECTED
end
return mp.CLEAN
