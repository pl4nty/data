-- Threat: !InfrastructureShared
-- Name: aa7805c7b84a
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
