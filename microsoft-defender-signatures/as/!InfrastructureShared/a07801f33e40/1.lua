-- Threat: !InfrastructureShared
-- Name: a07801f33e40
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
