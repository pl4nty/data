-- Threat: !InfrastructureShared
-- Name: 387811c100fd
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
