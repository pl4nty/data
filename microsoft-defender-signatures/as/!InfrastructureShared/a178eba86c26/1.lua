-- Threat: !InfrastructureShared
-- Name: a178eba86c26
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
