-- Threat: !InfrastructureShared
-- Name: 6178a055a601
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
