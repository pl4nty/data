-- Threat: \x84!AdSyncDump!EntraConnect
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: (Detection:HackTool:MSIL/ADSync.B | Detection:HackTool:MSIL/ADSyncDecrypt.B | Detection:Backdoor:MSIL/SuspAdsyncBin.D | AGGR:PossibleADSyncAccess)

if mp.get_mpattribute("Lua:PeOriginalName!win32ntv.dll") then
  return mp.CLEAN
end
if IsADConnectRole() then
  return mp.INFECTED
end
return mp.CLEAN
