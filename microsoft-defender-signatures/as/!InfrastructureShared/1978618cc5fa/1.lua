-- Threat: !InfrastructureShared
-- Name: 1978618cc5fa
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
