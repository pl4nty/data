-- Threat: !InfrastructureShared
-- Name: 1c540c0cdc616
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and mp.getfilesize() < 143211 then
  return mp.INFECTED
end
return mp.CLEAN
