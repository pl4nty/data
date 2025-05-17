-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\26bb3a7f6e802\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid or not GetAppomalyProcessAttribute(l_0_0.ppid) then
  return mp.CLEAN
end
for l_0_4 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_5 = sigattr_tail[l_0_4]
  if l_0_5.matched and l_0_5.attribute == 16384 and l_0_5.utf8p1 then
    local l_0_6 = "\\.(php|ps1|bat|aar|armx|asax|asbx|ascx|ashx|asmx|asp|aspq|aspx|axd|cfm|cgi|cshtm|cshtml|jsp|jar|js|jspx|phar|phtml|shtml|swf|vbhtm|vbhtml|php2|php3|php4|php5)$"
    local l_0_7 = (string.lower)((l_0_5.utf8p1):match("([^\\]+)$"))
    local l_0_8 = (MpCommon.StringRegExpSearch)(l_0_6, l_0_7)
    if l_0_8 then
      AppendToRollingQueue("PFApp_Parent_FileDropped", l_0_0.ppid, NormalizeDirectory(l_0_5.utf8p1) .. NormalizeFileName(l_0_7), 1800, 100, 0)
    end
  end
end
return mp.INFECTED

