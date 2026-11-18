-- Threat: !InfrastructureShared
-- Name: 5b78823837e3
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
