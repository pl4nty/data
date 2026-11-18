-- Threat: !InfrastructureShared
-- Name: 327840d8b0c7
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
