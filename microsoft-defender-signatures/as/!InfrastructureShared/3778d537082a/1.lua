-- Threat: !InfrastructureShared
-- Name: 3778d537082a
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
