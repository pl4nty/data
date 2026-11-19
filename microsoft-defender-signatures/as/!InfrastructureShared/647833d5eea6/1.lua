-- Threat: !InfrastructureShared
-- Name: 647833d5eea6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
