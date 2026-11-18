-- Threat: !InfrastructureShared
-- Name: 23784a178e17
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
