-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/LnkInMountedDrive
-- Type: 13
-- Includes: Path
-- MpAttributes: MpOnOpenOrCloseRtpScan & (FILE_DEVICE_IS_MOUNTED | FILE_REMOVABLE_MEDIA | FILE_READ_ONLY_DEVICE | MpFileIsOnRemovableDrive)

local l_0_0 = mp.getfilesize()
if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") and l_0_0 < 1048576 then
  local l_0_1
  if l_0_0 <= 4096 then
    l_0_1 = tostring(headerpage)
  else
    mp.readprotection(false)
    l_0_1 = mp.readfile(0, mp.getfilesize())
  end
  local l_0_2 = l_0_1:match("regsvr32[.%a]*%s+([%a%d\\.]*)")
  if l_0_2 == nil then
    l_0_2 = l_0_1:match("rundll32[.%a]*%s+([%a%d\\.]*)")
  end
  if l_0_2 ~= nil then
    local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
    l_0_3 = l_0_3:match("(.*)\\") .. "\\" .. l_0_2
    l_0_3 = normalize_path(l_0_3)
    local l_0_4 = "DllLoadedViaLnk"
    local l_0_5 = MpCommon.QueryPersistContext(l_0_3, l_0_4)
    if not l_0_5 then
      MpCommon.AppendPersistContext(l_0_3, l_0_4, 100)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
