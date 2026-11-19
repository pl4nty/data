-- Threat: !InfrastructureShared
-- Name: 6b786b4d0f50
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 800000 then
  return mp.INFECTED
end
return mp.CLEAN
