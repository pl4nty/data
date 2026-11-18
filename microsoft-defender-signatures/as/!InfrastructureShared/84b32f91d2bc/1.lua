-- Threat: !InfrastructureShared
-- Name: 84b32f91d2bc
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2:lower()
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2:lower()
end
local l_0_1 = {
  "alexansisplugin",
  "zzzzinvokemanagedcustomactionoutofproc",
  "shcreatelocalserverrundll",
  "hp deskjet 3050a j611 series"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if not l_0_0 then
  return mp.CLEAN
end
if not contains(l_0_0, {
  "\\programdata\\",
  "\\users\\public\\",
  "%userprofile%"
}) then
  return mp.CLEAN
end
local l_0_2 = {
  "(?:rundll32|regsvr32)(?:.exe)?\\s+\\w:\\\\(?:programdata|users\\\\public)\\\\[^\\\\]+\\.\\w{2,4}\\s*[,\\w$]+",
  "(?:rundll32|regsvr32)(?:.exe)?\\s+%userprofile%\\\\[^\\\\]+\\.\\w{2,4}\\s*[,\\w$]+"
}
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_2) do
  l_0_3, l_0_4 = MpCommon.StringRegExpSearch(l_0_5, l_0_0)
  if l_0_3 then
    reportRelatedBmHits()
    local l_0_6 = bm.get_current_process_startup_info()
    if l_0_6 and l_0_6.ppid then
      bm.request_SMS(l_0_6.ppid, "H")
      bm.add_action("SmsAsyncScanEvent", 1)
    end
    local l_0_7 = extractDllForRegproc(l_0_0)
    if l_0_7 and checkFileLastWriteTime(l_0_7, 3600) == false and mp.IsKnownFriendlyFile(l_0_7, true, false) == false then
      bm.add_threat_file(l_0_7)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
