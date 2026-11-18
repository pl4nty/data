-- Threat: !InfrastructureShared
-- Name: ef78a7c6b38c
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
