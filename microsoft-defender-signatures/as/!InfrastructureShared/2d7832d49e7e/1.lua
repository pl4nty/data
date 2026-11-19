-- Threat: !InfrastructureShared
-- Name: 2d7832d49e7e
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
