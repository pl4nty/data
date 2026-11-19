-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/SmallRarWithExeAndIoav
-- Type: 13
-- MpAttributes: MpNewlyCreatedHint & Lua:RarHasEncryptedFileWithExeExtension & MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if 20971520 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_3 = "Lua:Context/SmallRarWithExeAndIoav"
mp.set_mpattribute("Lua:Context/SmallRarWithExeAndIoav")
local l_0_4 = MpCommon.QueryPersistContext(l_0_2, l_0_3)
if not l_0_4 then
  MpCommon.AppendPersistContext(l_0_2, l_0_3, 300)
end
mp.set_mpattribute("MpDisableCaching")
return mp.INFECTED
