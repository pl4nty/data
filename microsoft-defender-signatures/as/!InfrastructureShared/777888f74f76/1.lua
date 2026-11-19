-- Threat: !InfrastructureShared
-- Name: 777888f74f76
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
