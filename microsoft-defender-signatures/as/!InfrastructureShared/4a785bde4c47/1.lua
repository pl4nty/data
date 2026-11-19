-- Threat: !InfrastructureShared
-- Name: 4a785bde4c47
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
