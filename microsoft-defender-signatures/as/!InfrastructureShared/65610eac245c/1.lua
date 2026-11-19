-- Threat: !InfrastructureShared
-- Name: 65610eac245c
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true and mp.getfilesize() < 983040 then
  return mp.INFECTED
end
return mp.CLEAN
