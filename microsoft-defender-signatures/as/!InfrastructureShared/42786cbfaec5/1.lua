-- Threat: !InfrastructureShared
-- Name: 42786cbfaec5
-- Type: 21

if mp.getfilesize() < 30000 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
