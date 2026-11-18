-- Threat: !InfrastructureShared
-- Name: 857806481139
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
