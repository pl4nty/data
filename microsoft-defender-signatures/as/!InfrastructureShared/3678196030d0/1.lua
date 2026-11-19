-- Threat: !InfrastructureShared
-- Name: 3678196030d0
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
