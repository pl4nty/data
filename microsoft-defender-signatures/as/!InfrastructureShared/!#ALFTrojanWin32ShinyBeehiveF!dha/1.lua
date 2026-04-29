-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32ShinyBeehiveF!dha\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
l_0_0 = l_0_0:match("^(.*\\)")
local l_0_1 = tostring(headerpage) .. tostring(footerpage)
for l_0_5 in l_0_1:gmatch("[^\r\n]+") do
  local l_0_6 = l_0_5:match("^App%d+%s*=%s*([%w%._%-]+%.exe)$")
  if l_0_6 then
    l_0_6 = l_0_0 .. l_0_6
    if (sysio.IsFileExists)(l_0_6) then
      (mp.ReportLowfi)(l_0_6, 2341576232)
    end
  end
end
return mp.INFECTED

