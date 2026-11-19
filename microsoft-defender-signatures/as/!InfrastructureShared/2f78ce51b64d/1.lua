-- Threat: !InfrastructureShared
-- Name: 2f78ce51b64d
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
