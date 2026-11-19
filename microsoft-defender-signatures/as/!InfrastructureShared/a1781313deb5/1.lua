-- Threat: !InfrastructureShared
-- Name: a1781313deb5
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
