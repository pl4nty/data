-- Threat: !InfrastructureShared
-- Name: 2a787ed9d78c
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
