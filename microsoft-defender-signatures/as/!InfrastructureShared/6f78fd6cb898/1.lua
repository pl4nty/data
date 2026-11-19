-- Threat: !InfrastructureShared
-- Name: 6f78fd6cb898
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
