-- Threat: !InfrastructureShared
-- Name: b378ed9fff07
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
