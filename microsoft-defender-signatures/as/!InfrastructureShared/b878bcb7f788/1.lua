-- Threat: !InfrastructureShared
-- Name: b878bcb7f788
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
