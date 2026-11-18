-- Threat: !InfrastructureShared
-- Name: b5784906142f
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
