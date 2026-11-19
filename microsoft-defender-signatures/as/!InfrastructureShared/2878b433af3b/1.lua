-- Threat: !InfrastructureShared
-- Name: 2878b433af3b
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
