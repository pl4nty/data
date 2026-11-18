-- Threat: !InfrastructureShared
-- Name: 119618c31584e
-- Type: 21

if peattributes.no_security == true and peattributes.isdll and pehdr.Machine == 34404 then
  return mp.INFECTED
end
return mp.CLEAN
