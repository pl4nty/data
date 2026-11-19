-- Threat: !InfrastructureShared
-- Name: 2b780d51cba2
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
