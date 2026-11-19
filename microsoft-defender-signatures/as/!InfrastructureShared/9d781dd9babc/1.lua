-- Threat: !InfrastructureShared
-- Name: 9d781dd9babc
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
