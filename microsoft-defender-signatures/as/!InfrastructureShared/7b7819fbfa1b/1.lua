-- Threat: !InfrastructureShared
-- Name: 7b7819fbfa1b
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
