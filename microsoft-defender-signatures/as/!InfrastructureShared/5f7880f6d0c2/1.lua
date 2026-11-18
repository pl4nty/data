-- Threat: !InfrastructureShared
-- Name: 5f7880f6d0c2
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
