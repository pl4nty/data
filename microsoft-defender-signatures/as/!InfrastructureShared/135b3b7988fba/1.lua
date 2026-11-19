-- Threat: !InfrastructureShared
-- Name: 135b3b7988fba
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.image_path ~= nil and string.lower(l_0_1.image_path) or ""
local l_0_4 = l_0_1.integrity_level ~= nil and l_0_1.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID
local l_0_5 = mp.GetParentProcInfo()
local l_0_6 = l_0_5 ~= nil and l_0_5.image_path ~= nil and string.lower(l_0_5.image_path) or ""
local l_0_7 = string.find(l_0_0, "historysavepath", 1, true) or string.find(l_0_0, "consolehost_history.txt", 1, true)
local l_0_8 = string.find(l_0_0, "history -c", 1, true) or string.find(l_0_0, "history -w", 1, true)
local l_0_9 = string.find(l_0_0, "/.bash_history", 1, true) or string.find(l_0_0, "\\.bash_history", 1, true)
local l_0_11 = (string.find(l_0_2, "c:\\windows\\system32\\", 1, true) == 1 or string.find(l_0_2, "c:\\windows\\syswow64\\", 1, true) == 1 or string.find(l_0_2, "c:\\program files\\", 1, true) == 1 or string.find(l_0_2, "c:\\program files (x86)\\", 1, true) == 1) and l_0_4
local l_0_12 = string.find(l_0_2, "\\temp\\", 1, true) or string.find(l_0_2, "\\downloads\\", 1, true) or string.find(l_0_2, "\\appdata\\", 1, true) or string.find(l_0_2, "\\programdata\\", 1, true) or string.find(l_0_2, "\\users\\public\\", 1, true)
local l_0_14 = l_0_6:sub(-16) == "\\wsmprovhost.exe" or l_0_6:sub(-14) == "\\winrshost.exe" or l_0_6:sub(-13) == "\\psexesvc.exe" or l_0_6:sub(-10) == "\\mshta.exe" or l_0_6:sub(-13) == "\\rundll32.exe" or l_0_6:sub(-13) == "\\regsvr32.exe" or l_0_6:sub(-9) == "\\wmic.exe"
local l_0_15 = string.find(l_0_0, "-encodedcommand", 1, true) or string.find(l_0_0, "frombase64string", 1, true) or string.find(l_0_0, "iex(", 1, true) or string.find(l_0_0, "downloadstring", 1, true) or string.find(l_0_0, " -enc ", 1, true)
if not (l_0_7 or l_0_8 or l_0_9) or not l_0_12 and not l_0_14 and not l_0_15 and not not l_0_11 then
  return mp.CLEAN
end
return mp.INFECTED
