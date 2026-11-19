-- Threat: !InfrastructureShared
-- Name: a8780017bc3a
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
