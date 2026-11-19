-- Threat: !InfrastructureShared
-- Name: a77870cf2a63
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
