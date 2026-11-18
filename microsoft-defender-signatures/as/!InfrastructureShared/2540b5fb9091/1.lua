-- Threat: !InfrastructureShared
-- Name: 2540b5fb9091
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
