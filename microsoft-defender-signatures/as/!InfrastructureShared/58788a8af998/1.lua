-- Threat: !InfrastructureShared
-- Name: 58788a8af998
-- Type: 21

if peattributes.no_security == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
