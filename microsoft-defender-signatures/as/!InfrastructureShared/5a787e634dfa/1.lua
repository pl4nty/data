-- Threat: !InfrastructureShared
-- Name: 5a787e634dfa
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
