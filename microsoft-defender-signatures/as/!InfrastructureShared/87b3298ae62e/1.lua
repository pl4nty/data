-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\87b3298ae62e\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or isnull((this_sigattrlog[2]).utf8p2) then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
if not (string.find)(l_0_0, "127.0.0.1", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_0, "rmdir /s /q", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_0, "del /q", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1)
local l_0_3 = (string.match)(l_0_2, "([^\\/]+)$")
local l_0_4 = (string.match)(l_0_2, "^(.*)[\\/][^\\/]+$")
do
  -- DECOMPILER ERROR at PC105: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC108: freeLocal<0 in 'ReleaseLocals'

  if not (not l_0_3 or not (string.find)(l_0_0, l_0_3, 1, true)) and #l_0_4 > 3 and (string.find)(l_0_0, l_0_4, 1, true) then
    return mp.CLEAN
  end
  if is_excluded_parent_proc_auto() then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("SELFDELETE_CMDLINE", (this_sigattrlog[2]).utf8p2, bm.RelatedStringBMReport)
  -- DECOMPILER ERROR at PC131: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (bm.add_related_file)(l_0_1)
  add_parents()
  TrackPidAndTechniqueBM("BM", "T1070.004", "AntinoSelfDelete.AM")
  do return mp.INFECTED end
  -- DECOMPILER ERROR at PC143: freeLocal<0 in 'ReleaseLocals'

  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

