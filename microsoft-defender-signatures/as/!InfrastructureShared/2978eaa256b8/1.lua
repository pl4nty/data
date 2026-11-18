-- Threat: !InfrastructureShared
-- Name: 2978eaa256b8
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
