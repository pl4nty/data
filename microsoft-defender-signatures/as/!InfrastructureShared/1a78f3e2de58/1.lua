-- Threat: !InfrastructureShared
-- Name: 1a78f3e2de58
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
