-- Threat: !InfrastructureShared
-- Name: 19786635d902
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
