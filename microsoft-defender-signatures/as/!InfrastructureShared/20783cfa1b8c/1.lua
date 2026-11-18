-- Threat: !InfrastructureShared
-- Name: 20783cfa1b8c
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
