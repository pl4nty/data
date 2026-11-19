-- Threat: !InfrastructureShared
-- Name: 71782bab35fe
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
