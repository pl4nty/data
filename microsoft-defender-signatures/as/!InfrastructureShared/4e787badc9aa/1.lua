-- Threat: !InfrastructureShared
-- Name: 4e787badc9aa
-- Type: 21

if peattributes.isexe and peattributes.x86_image == false and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
