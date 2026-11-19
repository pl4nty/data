-- Threat: !InfrastructureShared
-- Name: a378dd550042
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
