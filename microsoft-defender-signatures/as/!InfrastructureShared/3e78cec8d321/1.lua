-- Threat: !InfrastructureShared
-- Name: 3e78cec8d321
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
