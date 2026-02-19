-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4078d9ef4f26\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_PATH)
if l_0_0 and l_0_0 ~= "" then
  local l_0_1 = ""
  local l_0_2 = "setting.dat"
  if (string.sub)(l_0_0, -1) == "\\" then
    l_0_1 = l_0_0 .. l_0_2
  else
    l_0_1 = l_0_0 .. "\\" .. l_0_2
  end
  if (sysio.IsFileExists)(l_0_1) then
    (mp.ReportLowfi)(l_0_1, 2130772754)
  end
end
do
  return mp.INFECTED
end

