-- Threat: !InfrastructureShared
-- Name: 4e78cab2b494
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
