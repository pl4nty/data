-- Threat: !InfrastructureShared
-- Name: 2278c3398b69
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
