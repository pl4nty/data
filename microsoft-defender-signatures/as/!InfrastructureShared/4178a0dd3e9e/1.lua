-- Threat: !InfrastructureShared
-- Name: 4178a0dd3e9e
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
