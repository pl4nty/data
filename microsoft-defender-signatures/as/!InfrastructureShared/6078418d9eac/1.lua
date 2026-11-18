-- Threat: !InfrastructureShared
-- Name: 6078418d9eac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
