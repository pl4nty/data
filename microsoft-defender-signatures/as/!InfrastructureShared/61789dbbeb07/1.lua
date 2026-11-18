-- Threat: !InfrastructureShared
-- Name: 61789dbbeb07
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
