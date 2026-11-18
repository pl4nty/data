-- Threat: !InfrastructureShared
-- Name: 26fb35a568c60
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  ".sysmain.sdb"
}
if contains(l_0_0.command_line, l_0_1) then
  return mp.CLEAN
end
if l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  local l_0_2 = {
    "wscript.exe",
    "cscript.exe",
    "regsvr32.exe",
    "mshta.exe",
    "vbc.exe",
    "msbuild.exe",
    "wmic.exe",
    "cmstp.exe",
    "regasm.exe",
    "installutil.exe",
    "regsvcs.exe",
    "msxsl.exe",
    "xwizard.exe",
    "csc.exe",
    "winword.exe",
    "excel.exe",
    "powerpnt.exe",
    "cmd.exe",
    "powershell.exe",
    "pwsh.exe",
    "forfiles.exe"
  }
  local l_0_3 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
  if l_0_3 and next(l_0_3) and l_0_3.IntegrityLevel and l_0_3.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_HIGH_RID and IsProcNameInParentProcessTree("BM", l_0_2) then
    local l_0_4
    if this_sigattrlog[6].matched then
      l_0_4 = this_sigattrlog[6].utf8p1
    end
    local l_0_5 = sysio.GetFileSize(l_0_4)
    if not sysio.GetLastResult().Success then
      return mp.CLEAN
    end
    l_0_5 = 65536 < l_0_5 and 65536 or l_0_5
    local l_0_6 = sysio.ReadFile(l_0_4, 0, l_0_5)
    if not sysio.GetLastResult().Success then
      return mp.CLEAN
    end
    local l_0_7 = tostring(l_0_6)
    local l_0_8 = {
      "I\000n\000j\000e\000c\000t\000D\000l\000l\000",
      "P\000a\000t\000c\000h\000W\0003\0002\000",
      "P\000a\000t\000c\000h\000W\0006\0004\000",
      "I\000g\000n\000o\000r\000e\000L\000o\000a\000d\000L\000i\000b\000r\000a\000r\000y\000",
      "R\000e\000d\000i\000r\000e\000c\000t\000E\000X\000E\000"
    }
    local l_0_9 = {"1\192\195", "H1\192\195"}
    
    local function l_0_10(l_1_0, l_1_1)
      for l_1_2, l_1_3 in ipairs(l_1_1) do
        if l_1_0:find(l_1_3, 1, true) then
          return true
        end
      end
      return false
    end
    
    if string.find(l_0_7, "sdbf", 1, true) ~= nil and string.find(l_0_7, "n\000t\000d\000l\000l\000.\000d\000l\000l\000", 1, true) ~= nil then
      if l_0_10(l_0_7, l_0_8) then
        bm.add_related_string("[=>] FIX_IDS: ", tostring(l_0_8), bm.RelatedStringBMReport)
        bm.add_related_string("[->] MEDICATED COMMAND LINE: ", l_0_0.command_line, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
      if l_0_10(l_0_7, l_0_9) then
        bm.add_related_string("[=>] FIX_IDS: ", tostring(l_0_9), bm.RelatedStringBMReport)
        bm.add_related_string("[->] MEDICATED COMMAND LINE: ", l_0_0.command_line, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
