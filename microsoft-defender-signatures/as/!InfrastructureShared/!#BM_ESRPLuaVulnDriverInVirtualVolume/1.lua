-- Threat: !InfrastructureShared
-- Name: !#BM_ESRP:Lua:VulnDriverInVirtualVolume
-- Type: 11
-- MpAttributes: RPF:TopLevelFile & MpOnOpenRtpScan & MpFileIsOnRemovableDrive & (BM_ESRP:Lua:UnversionedSignedDriver | BM_ESRP:Lua:VersionedSignedDriver | BM_ESRP:Lua:RenamedSignedDriver)

local l_0_0 = mp.getfilename()
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
local l_0_1 = MpCommon.GetMountedFileBackingFilePath(l_0_0)
if l_0_1 ~= nil then
  local l_0_2 = mp.enum_mpattributesubstring("ESRP:PEStatic:")
  if 0 < #l_0_2 then
    return mp.INFECTED
  end
  local l_0_3 = mp.enum_mpattributesubstring("BM_ESRP:")
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if l_0_5 == "BM_ESRP:Lua:VulnerableAsrNotOnClose" then
      return mp.INFECTED
    end
    local l_0_6 = string.find(l_0_5, "^BM_ESRP:Hstr:")
    if l_0_6 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
