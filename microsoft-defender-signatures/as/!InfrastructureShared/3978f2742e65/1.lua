-- Threat: !InfrastructureShared
-- Name: 3978f2742e65
-- Type: 21

if peattributes.isexe and peattributes.no_security == false and peattributes.x86_image == false and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
