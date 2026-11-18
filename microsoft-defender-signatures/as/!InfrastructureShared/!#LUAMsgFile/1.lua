-- Threat: !InfrastructureShared
-- Name: !#LUA:MsgFile
-- Type: 12

if mp.get_mpattribute("PACKED_WITH:(MSG)") then
  return mp.INFECTED
end
return mp.CLEAN
