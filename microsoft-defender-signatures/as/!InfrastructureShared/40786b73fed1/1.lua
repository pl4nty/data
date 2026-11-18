-- Threat: !InfrastructureShared
-- Name: 40786b73fed1
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
