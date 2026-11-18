-- Threat: !InfrastructureShared
-- Name: 2c786260e5ad
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
