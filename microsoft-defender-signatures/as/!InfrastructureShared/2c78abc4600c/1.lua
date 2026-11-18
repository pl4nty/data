-- Threat: !InfrastructureShared
-- Name: 2c78abc4600c
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
