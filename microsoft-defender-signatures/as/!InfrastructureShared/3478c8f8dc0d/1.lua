-- Threat: !InfrastructureShared
-- Name: 3478c8f8dc0d
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
