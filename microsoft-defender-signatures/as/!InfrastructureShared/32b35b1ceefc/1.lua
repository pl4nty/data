-- Threat: !InfrastructureShared
-- Name: 32b35b1ceefc
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  bm.add_related_string("Evidence", this_sigattrlog[1].utf8p2, bm.RelatedStringBMReport)
  local l_0_0 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = {
    "onedrivestandaloneupdater.exe",
    "OneDrive.exe",
    "gup.exe",
    "WinHex.exe",
    "EBWebView.exe"
  }
  if contains(l_0_0.AppName, l_0_1) then
    if l_0_0.Dll_Path then
      bm.add_threat_file(l_0_0.Dll_Path)
    end
    local l_0_2, l_0_3 = pcall(reportBmInfo)
    if not l_0_2 and l_0_3 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_3), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
  local l_0_4 = bm.get_imagepath()
  if not l_0_4 then
    return mp.CLEAN
  end
  local l_0_5 = MpCommon.GetOriginalFileName(l_0_4)
  if not l_0_5 then
    local l_0_6 = sysio.GetPEVersionInfo(l_0_4)
    if l_0_6 and l_0_6.OriginalFilename then
      l_0_5 = l_0_6.OriginalFilename .. tostring(l_0_6.FileDescription)
    end
  end
  local l_0_7 = {
    "update.exetrend",
    "vpnserver.*softether"
  }
  if l_0_5 and contains(string.lower(l_0_5), l_0_7, false) then
    if l_0_0.Dll_Path then
      bm.add_threat_file(l_0_0.Dll_Path)
    end
    local l_0_8, l_0_9 = pcall(reportBmInfo)
    if not l_0_8 and l_0_9 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_9), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
