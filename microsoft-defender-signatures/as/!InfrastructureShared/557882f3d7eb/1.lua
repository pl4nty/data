-- Threat: !InfrastructureShared
-- Name: 557882f3d7eb
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
