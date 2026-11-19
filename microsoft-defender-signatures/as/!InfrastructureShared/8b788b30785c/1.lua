-- Threat: !InfrastructureShared
-- Name: 8b788b30785c
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
