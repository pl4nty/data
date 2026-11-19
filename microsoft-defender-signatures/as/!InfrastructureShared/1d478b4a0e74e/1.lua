-- Threat: !InfrastructureShared
-- Name: 1d478b4a0e74e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() > 35000 then
  return mp.INFECTED
end
return mp.CLEAN
