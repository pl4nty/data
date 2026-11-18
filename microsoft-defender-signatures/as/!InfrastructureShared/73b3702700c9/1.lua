-- Threat: !InfrastructureShared
-- Name: 73b3702700c9
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
local l_0_1 = {
  "\\program files",
  "\\appdata\\local\\apps\\2.0\\",
  "icue.exe"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {
  "winword.exe",
  "excel.exe",
  "powerpnt.exe",
  "mspub.exe",
  "wscript.exe",
  "cscript.exe",
  "mshta.exe",
  "powershell.exe",
  "pwsh.exe",
  "rundll32.exe",
  "regsvr32.exe",
  "wmic.exe",
  "wmiprvse.exe"
}
if IsProcNameInParentProcessTree("BM", l_0_2) then
  add_parents()
  local l_0_3 = bm.get_imagepath()
  if l_0_3 == nil then
    return mp.CLEAN
  end
  l_0_3 = string.lower(l_0_3)
  if string.find(l_0_3, "\\appdata\\", 1, true) and string.find(l_0_3, "_x\\", 1, true) or string.find(l_0_3, "\\appdata\\local\\temp\\", 1, true) then
    local l_0_4 = bm.get_current_process_startup_info()
    if l_0_4 == nil or l_0_4.ppid == nil then
      return mp.CLEAN
    end
    bm.request_SMS(l_0_4.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1000)
  end
  return mp.INFECTED
end
return mp.CLEAN
