-- Threat: !InfrastructureShared
-- Name: 2878e266ca0c
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
