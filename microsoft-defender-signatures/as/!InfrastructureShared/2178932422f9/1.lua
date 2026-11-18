-- Threat: !InfrastructureShared
-- Name: 2178932422f9
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
