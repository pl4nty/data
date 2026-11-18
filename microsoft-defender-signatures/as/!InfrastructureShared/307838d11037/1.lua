-- Threat: !InfrastructureShared
-- Name: 307838d11037
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
