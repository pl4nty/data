-- Threat: !InfrastructureShared
-- Name: dd78c775272c
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
