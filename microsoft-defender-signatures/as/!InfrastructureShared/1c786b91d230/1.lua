-- Threat: !InfrastructureShared
-- Name: 1c786b91d230
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
