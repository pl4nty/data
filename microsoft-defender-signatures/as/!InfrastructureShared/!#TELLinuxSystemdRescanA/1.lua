-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxSystemdRescanA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or #l_0_0 < 20 then
  return mp.CLEAN
end
if (string.match)(l_0_0, "/etc/systemd/system/([%w%-_]+)%.service") then
  local l_0_1 = tostring(headerpage)
  l_0_1 = (l_0_1:gsub("\r\n", "\n")):gsub("\r", "\n")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = false
  local l_0_3 = nil
  for l_0_7 in (string.gmatch)(l_0_1, "[^\n]+") do
    l_0_3 = l_0_7:match("^%s*ExecStart%s*=%s*%-?%s*\"?([^\"%s]+)\"?%s*(.*)")
    if not l_0_3 then
      l_0_3 = l_0_7:match("^%s*ExecStartPre%s*=%s*%-?%s*\"?([^\"%s]+)\"?%s*(.*)")
    end
    if not l_0_3 then
      l_0_3 = l_0_7:match("^%s*ExecStartPost%s*=%s*%-?%s*\"?([^\"%s]+)\"?%s*(.*)")
    end
    if l_0_3 and (sysio.IsFileExists)(l_0_3) then
      (mp.ReportLowfi)(l_0_3, 215366886)
      l_0_2 = true
    end
    l_0_3 = nil
  end
  if l_0_2 then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

