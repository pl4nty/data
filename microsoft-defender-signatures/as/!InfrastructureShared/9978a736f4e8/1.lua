-- Threat: !InfrastructureShared
-- Name: 9978a736f4e8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
