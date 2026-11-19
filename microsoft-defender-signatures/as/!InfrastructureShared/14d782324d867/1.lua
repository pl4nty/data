-- Threat: !InfrastructureShared
-- Name: 14d782324d867
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 600000 then
  return mp.INFECTED
end
return mp.CLEAN
