-- Threat: !InfrastructureShared
-- Name: 45780cab38dd
-- Type: 21

if peattributes.no_security and mp.getfilesize() > 617000 and mp.getfilesize() < 623000 then
  return mp.INFECTED
end
return mp.CLEAN
