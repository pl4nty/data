-- Threat: !InfrastructureShared
-- Name: 34785d55ed72
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
