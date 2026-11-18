-- Threat: !InfrastructureShared
-- Name: 267813e0b794
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
