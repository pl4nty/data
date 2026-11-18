-- Threat: !InfrastructureShared
-- Name: f4783f6b8a3c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
