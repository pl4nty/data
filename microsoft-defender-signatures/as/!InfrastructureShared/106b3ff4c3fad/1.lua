-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\106b3ff4c3fad\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0.ppid ~= nil and ((string.find)(l_0_0.ppid, "pid:4$", 1, false) ~= nil or (string.find)(l_0_0.ppid, "pid:4,", 1, true) ~= nil) then
  return mp.CLEAN
end
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
  local l_0_1 = (this_sigattrlog[5]).utf8p1
  local l_0_2 = (this_sigattrlog[5]).utf8p2
  if l_0_1 ~= nil and l_0_2 ~= nil then
    AppendToRollingQueue("BmMsSenseComponentTamperA", l_0_1, l_0_2, 180)
  end
end
do
  return mp.INFECTED
end

