-- Threat: !InfrastructureShared
-- Name: 3761620678d9
-- Type: 21

if mp.get_mpattribute("LUA:FileSizeLE40000.A") and mp.get_mpattribute("Lua:FileSizeGEC350") and mp.get_mpattribute("BM_DropperObfuscatorUR") and mp.get_mpattribute("MpHasExpensiveLoop") and mp.get_mpattribute("PEPCODE:HasDigitalSignature") and mp.get_mpattribute("LUA:OverlaySize_0xd30_to_0xd40") and pehdr.TimeDateStamp ~= 0 then
  local l_0_0 = MpCommon.GetCurrentTimeT()
  if l_0_0 > pehdr.TimeDateStamp then
    local l_0_1 = l_0_0 - pehdr.TimeDateStamp
    if l_0_1 <= 2592000 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
