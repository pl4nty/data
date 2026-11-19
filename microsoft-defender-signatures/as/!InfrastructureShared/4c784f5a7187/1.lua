-- Threat: !InfrastructureShared
-- Name: 4c784f5a7187
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
