-- Threat: !InfrastructureShared
-- Name: 676170a23611
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() <= 4100 then
  return mp.INFECTED
end
return mp.CLEAN
