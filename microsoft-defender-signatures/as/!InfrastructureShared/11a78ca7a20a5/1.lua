-- Threat: !InfrastructureShared
-- Name: 11a78ca7a20a5
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
