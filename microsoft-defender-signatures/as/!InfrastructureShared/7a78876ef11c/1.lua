-- Threat: !InfrastructureShared
-- Name: 7a78876ef11c
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
