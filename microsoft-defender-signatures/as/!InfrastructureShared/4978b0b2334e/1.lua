-- Threat: !InfrastructureShared
-- Name: 4978b0b2334e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
