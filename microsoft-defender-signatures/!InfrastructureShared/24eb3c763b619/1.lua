-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\24eb3c763b619\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 and next(l_0_0) and l_0_0.ppid then
  local l_0_1 = l_0_0.ppid
  local l_0_2, l_0_3 = pcall(bm.GetModAddress, l_0_1, "clr.dll")
  if not l_0_2 or isnull(l_0_3) then
    return mp.CLEAN
  end
  local l_0_4 = (mp.bitand)((mp.shr64)(l_0_3, 24), 16777215)
  if isnull(l_0_4) or l_0_4 == 0 then
    return mp.CLEAN
  end
  local l_0_5 = (bm.ReadProcMem)(l_0_4, 64000, l_0_1)
  if isnull(l_0_5) then
    return mp.CLEAN
  end
  local l_0_6 = l_0_5:lower()
  local l_0_7 = (string.find)(l_0_6, "amsiscanbuffer", 1, true)
  if isnull(l_0_7) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

