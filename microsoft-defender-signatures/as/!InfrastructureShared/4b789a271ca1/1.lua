-- Threat: !InfrastructureShared
-- Name: 4b789a271ca1
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
