-- Threat: !InfrastructureShared
-- Name: !#ALF:PUA:Win32/PiriformBundler
-- Type: 13
-- MpAttributes: SCPT:PiriformAvastOffer & SCPT:CCleanerPing & SCPT:PiriformReg

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("LUAUFS:NSISHasPiriformCert", true)
if l_0_0 == 0 and l_0_1 then
  if not mp.get_mpattribute("Lua:IsPUA") then
    mp.set_mpattribute("LUA:PiriformAvastBundler")
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
