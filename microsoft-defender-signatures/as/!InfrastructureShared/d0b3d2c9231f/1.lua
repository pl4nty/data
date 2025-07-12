-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d0b3d2c9231f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "PrintProcessor"
local l_0_1 = (string.match)((this_sigattrlog[3]).utf8p1 or "", "%\\([^%\\]+)%\\%\\")
local l_0_2 = (this_sigattrlog[3]).utf8p2
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_2, "\\", 1, true) or not l_0_2 then
    local l_0_4, l_0_5, l_0_6 = (string.format)("C:\\Windows\\System32\\spool\\prtprocs\\x64\\%s", l_0_2)
  end
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R3 in 'UnsetPending'

  local l_0_7 = nil
  if (sysio.IsFileExists)(l_0_4) then
    (bm.add_related_file)(l_0_7)
  end
  local l_0_8 = nil
  local l_0_9 = bm.add_related_string
  local l_0_10 = l_0_0
  local l_0_11 = safeJsonSerialize
  l_0_11 = l_0_11({DriverName = l_0_1, DriverFile = l_0_2, DriverPath = l_0_7, DriverExists = l_0_8})
  l_0_9(l_0_10, l_0_11, bm.RelatedStringBMReport)
  l_0_9 = bm
  l_0_9 = l_0_9.get_current_process_startup_info
  l_0_9 = l_0_9()
  if l_0_9 then
    l_0_10 = l_0_9.ppid
    if l_0_10 then
      l_0_10 = TrackPidAndTechniqueBM
      l_0_11 = l_0_9.ppid
      l_0_10(l_0_11, "T1547.012", "persist_printprocessor_driver")
    end
  end
  l_0_10 = mp
  l_0_10 = l_0_10.INFECTED
  return l_0_10
end

