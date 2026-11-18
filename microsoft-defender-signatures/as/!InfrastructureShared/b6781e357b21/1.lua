-- Threat: !InfrastructureShared
-- Name: b6781e357b21
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
