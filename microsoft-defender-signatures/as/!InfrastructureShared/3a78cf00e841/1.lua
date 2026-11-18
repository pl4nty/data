-- Threat: !InfrastructureShared
-- Name: 3a78cf00e841
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
