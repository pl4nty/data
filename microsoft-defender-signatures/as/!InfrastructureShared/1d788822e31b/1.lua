-- Threat: !InfrastructureShared
-- Name: 1d788822e31b
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
