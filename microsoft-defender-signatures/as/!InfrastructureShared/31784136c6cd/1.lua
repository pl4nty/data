-- Threat: !InfrastructureShared
-- Name: 31784136c6cd
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
