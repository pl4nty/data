-- Threat: !InfrastructureShared
-- Name: 43540567190d3
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
