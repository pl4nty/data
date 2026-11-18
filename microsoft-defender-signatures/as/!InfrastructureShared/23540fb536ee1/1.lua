-- Threat: !InfrastructureShared
-- Name: 23540fb536ee1
-- Type: 21

if peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
