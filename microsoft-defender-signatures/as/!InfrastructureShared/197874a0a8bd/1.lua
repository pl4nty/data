-- Threat: !InfrastructureShared
-- Name: 197874a0a8bd
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
