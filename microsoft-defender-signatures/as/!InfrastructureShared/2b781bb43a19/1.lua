-- Threat: !InfrastructureShared
-- Name: 2b781bb43a19
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
