-- Threat: !InfrastructureShared
-- Name: 17db346bbafc9
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0, -9))
  if l_0_1 ~= "\\w3wp.exe" then
    return mp.CLEAN
  end
end
local l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_2 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_2 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].utf8p1
end
if l_0_2 ~= nil then
  local l_0_3 = string.sub(l_0_2, -4)
  local l_0_4 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_4, l_0_3, 1, true) == nil then
    return mp.CLEAN
  end
end
local l_0_5 = bm.get_current_process_startup_info()
local l_0_6 = l_0_5.command_line
if not string.find(l_0_6, "-ap \"MSExchange", 1, true) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_2) then
  local l_0_7 = string.match(l_0_2, "(.*\\)[^\\]+$")
  if l_0_7 then
    bm.trigger_sig("TriggerShellPath", l_0_7)
  end
  mp.ReportLowfi(l_0_2, 560784057)
  bm.add_related_file(l_0_2)
  bm.add_threat_file(l_0_2)
end
return mp.INFECTED
