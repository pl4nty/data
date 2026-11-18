-- Threat: !InfrastructureShared
-- Name: 2b78005f05cb
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
