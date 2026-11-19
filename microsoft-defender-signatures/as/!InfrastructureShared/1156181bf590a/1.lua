-- Threat: !InfrastructureShared
-- Name: 1156181bf590a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
