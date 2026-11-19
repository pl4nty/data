-- Threat: !InfrastructureShared
-- Name: 26bb3a7f6e802
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_current_process_startup_info()
if not (l_0_0 and l_0_0.ppid) or not GetAppomalyProcessAttribute(l_0_0.ppid) then
  return mp.CLEAN
end
for l_0_1 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_2 = sigattr_tail[l_0_1]
  if l_0_2.matched and l_0_2.attribute == 16384 and l_0_2.utf8p1 then
    local l_0_3 = "\\.(php|ps1|bat|aar|armx|asax|asbx|ascx|ashx|asmx|asp|aspq|aspx|axd|cfm|cgi|cshtm|cshtml|jsp|jar|js|jspx|phar|phtml|shtml|swf|vbhtm|vbhtml|php2|php3|php4|php5)$"
    local l_0_4 = string.lower(l_0_2.utf8p1:match("([^\\]+)$"))
    local l_0_5 = MpCommon.StringRegExpSearch(l_0_3, l_0_4)
    if l_0_5 then
      AppendToRollingQueue("PFApp_Parent_FileDropped", l_0_0.ppid, NormalizeDirectory(l_0_2.utf8p1) .. NormalizeFileName(l_0_4), 1800, 100, 0)
    end
  end
end
return mp.INFECTED
