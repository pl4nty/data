-- Threat: !InfrastructureShared
-- Name: 165406d379dbc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
