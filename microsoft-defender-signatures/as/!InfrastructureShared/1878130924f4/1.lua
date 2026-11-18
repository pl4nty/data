-- Threat: !InfrastructureShared
-- Name: 1878130924f4
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
