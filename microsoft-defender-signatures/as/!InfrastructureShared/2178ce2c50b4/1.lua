-- Threat: !InfrastructureShared
-- Name: 2178ce2c50b4
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
