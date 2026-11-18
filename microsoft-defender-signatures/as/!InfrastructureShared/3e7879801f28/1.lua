-- Threat: !InfrastructureShared
-- Name: 3e7879801f28
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
