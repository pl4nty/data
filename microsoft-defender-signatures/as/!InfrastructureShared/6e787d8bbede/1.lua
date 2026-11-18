-- Threat: !InfrastructureShared
-- Name: 6e787d8bbede
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
