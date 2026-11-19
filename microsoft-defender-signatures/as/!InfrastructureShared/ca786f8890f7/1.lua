-- Threat: !InfrastructureShared
-- Name: ca786f8890f7
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
