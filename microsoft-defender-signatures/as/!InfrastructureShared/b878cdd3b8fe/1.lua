-- Threat: !InfrastructureShared
-- Name: b878cdd3b8fe
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
