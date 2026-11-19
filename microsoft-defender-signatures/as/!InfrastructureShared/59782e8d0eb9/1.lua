-- Threat: !InfrastructureShared
-- Name: 59782e8d0eb9
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
