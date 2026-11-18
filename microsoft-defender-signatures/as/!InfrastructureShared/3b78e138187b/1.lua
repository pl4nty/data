-- Threat: !InfrastructureShared
-- Name: 3b78e138187b
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
