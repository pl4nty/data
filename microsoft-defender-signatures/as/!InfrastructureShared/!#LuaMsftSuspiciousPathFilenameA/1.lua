-- Threat: !InfrastructureShared
-- Name: !#Lua:MsftSuspiciousPathFilename.A
-- Type: 11

if mp.get_mpattribute("Lua:SuspiciousPathFilename.A") then
  return mp.LOWFI
end
return mp.CLEAN
