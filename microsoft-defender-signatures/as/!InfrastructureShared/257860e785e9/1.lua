-- Threat: !InfrastructureShared
-- Name: 257860e785e9
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
