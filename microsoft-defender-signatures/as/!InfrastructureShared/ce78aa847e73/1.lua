-- Threat: !InfrastructureShared
-- Name: ce78aa847e73
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
