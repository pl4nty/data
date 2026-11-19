-- Threat: !InfrastructureShared
-- Name: 365407d6ab792
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
