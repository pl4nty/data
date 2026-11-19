-- Threat: !InfrastructureShared
-- Name: a9789173aa68
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 35000 then
  return mp.INFECTED
end
return mp.CLEAN
