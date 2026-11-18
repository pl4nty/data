-- Threat: !InfrastructureShared
-- Name: 1e78e3e8a1b9
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
