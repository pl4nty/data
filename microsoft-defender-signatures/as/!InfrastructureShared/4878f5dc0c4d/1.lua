-- Threat: !InfrastructureShared
-- Name: 4878f5dc0c4d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
