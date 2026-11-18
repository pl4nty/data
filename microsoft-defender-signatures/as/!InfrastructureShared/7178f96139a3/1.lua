-- Threat: !InfrastructureShared
-- Name: 7178f96139a3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
