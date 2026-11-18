-- Threat: !InfrastructureShared
-- Name: b97828b3f68b
-- Type: 21

if (peattributes.no_security and peattributes.isdll) == true and mp.get_mpattribute("Lua:Context/FileExportCountGTE!10") then
  return mp.INFECTED
end
return mp.CLEAN
