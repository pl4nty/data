-- Threat: !InfrastructureShared
-- Name: 13f78eb6d15e2
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources and peattributes.x86_image and peattributes.suspicious_number_of_dirs then
  return mp.INFECTED
end
return mp.CLEAN
