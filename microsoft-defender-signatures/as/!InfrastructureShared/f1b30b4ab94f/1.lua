-- Threat: !InfrastructureShared
-- Name: f1b30b4ab94f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
else
  return mp.CLEAN
end
if l_0_0 == nil then
  return mp.CLEAN
end
if contains(l_0_0, {
  "rundll32.exe",
  "regsvr32.exe"
}) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.match(l_0_0, "targetprocessppid:(%d+):(%d+)")
if not l_0_1 or not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = "pid:" .. l_0_1 .. ",ProcessStart:" .. l_0_2
local l_0_4 = sysio.GetFileNameFromProcess(l_0_3)
if l_0_4 and contains(l_0_4, "\\windows\\syswow64") then
  if contains(l_0_4, {
    "svchost.exe"
  }) then
    return mp.CLEAN
  end
  bm.add_related_string("Injected_imagepath", l_0_4, bm.RelatedStringBMReport)
  triggerMemoryScanOnProcessTree(true, true, "SMS_M", 100, "Behavior:Win32/DllInject.SE")
  return mp.INFECTED
end
return mp.CLEAN
