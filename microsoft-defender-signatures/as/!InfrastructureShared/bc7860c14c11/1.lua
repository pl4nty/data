-- Threat: !InfrastructureShared
-- Name: bc7860c14c11
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
