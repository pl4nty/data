-- Threat: !InfrastructureShared
-- Name: c3787885472b
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
