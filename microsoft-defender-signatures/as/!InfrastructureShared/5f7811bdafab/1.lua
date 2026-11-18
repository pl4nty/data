-- Threat: !InfrastructureShared
-- Name: 5f7811bdafab
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
