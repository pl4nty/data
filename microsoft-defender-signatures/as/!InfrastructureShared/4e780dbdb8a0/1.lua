-- Threat: !InfrastructureShared
-- Name: 4e780dbdb8a0
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
