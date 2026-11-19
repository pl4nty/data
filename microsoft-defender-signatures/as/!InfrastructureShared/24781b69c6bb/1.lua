-- Threat: !InfrastructureShared
-- Name: 24781b69c6bb
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
