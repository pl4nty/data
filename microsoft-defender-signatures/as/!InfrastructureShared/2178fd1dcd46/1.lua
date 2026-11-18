-- Threat: !InfrastructureShared
-- Name: 2178fd1dcd46
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
