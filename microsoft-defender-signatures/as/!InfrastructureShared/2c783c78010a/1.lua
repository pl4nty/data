-- Threat: !InfrastructureShared
-- Name: 2c783c78010a
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
