-- Threat: !InfrastructureShared
-- Name: fd7805e5a0f6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
