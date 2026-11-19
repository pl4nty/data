-- Threat: !InfrastructureShared
-- Name: 2478436c08d6
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
