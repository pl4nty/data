-- Threat: !InfrastructureShared
-- Name: 696116a9cb00
-- Type: 21

if peattributes.no_security == false and mp.get_mpattribute("LUA:FileSizeGT1M.A") and mp.get_mpattribute("TEL:Trojan:Win32/FlawedAmmyy!fa1") then
  return mp.INFECTED
end
return mp.CLEAN
