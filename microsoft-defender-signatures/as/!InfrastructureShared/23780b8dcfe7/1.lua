-- Threat: !InfrastructureShared
-- Name: 23780b8dcfe7
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
