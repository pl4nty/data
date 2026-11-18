-- Threat: !InfrastructureShared
-- Name: 7c78ceeaf201
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 17000000 and mp.getfilesize() > 15000000 then
  return mp.INFECTED
end
return mp.CLEAN
