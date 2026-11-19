-- Threat: !InfrastructureShared
-- Name: 31780e8ba80f
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
