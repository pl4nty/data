-- Threat: !InfrastructureShared
-- Name: 9e78177fded7
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
