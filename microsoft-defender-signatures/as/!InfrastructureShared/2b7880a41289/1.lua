-- Threat: !InfrastructureShared
-- Name: 2b7880a41289
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
