-- Threat: !InfrastructureShared
-- Name: 20780d4050f4
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
