-- Threat: !InfrastructureShared
-- Name: 7b7818a17275
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
