-- Threat: !InfrastructureShared
-- Name: 267815ae9de1
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
