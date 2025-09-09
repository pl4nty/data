-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\64bb36bae3b59\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
local l_0_2 = "T1204"
-- DECOMPILER ERROR at PC13: Overwrote pending register: R2 in 'AssignReg'

if ((not (this_sigattrlog[17]).matched and not (this_sigattrlog[18]).matched) or (this_sigattrlog[16]).matched) and ((this_sigattrlog[16]).utf8p1 == nil or (this_sigattrlog[16]).utf8p1 == "" or not (string.match)(l_0_1, "/DAFOM%-%d+%.%d+%.%d+%.dmg$")) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC64: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC77: Overwrote pending register: R0 in 'AssignReg'

-- DECOMPILER ERROR at PC89: Unhandled construct in 'MakeBoolean' P3

if ((this_sigattrlog[26]).matched or (this_sigattrlog[19]).matched) and ((((this_sigattrlog[26]).utf8p1 == nil or (this_sigattrlog[26]).utf8p1 == "" or (this_sigattrlog[19]).utf8p1 ~= nil) and l_0_1 == nil) or not (string.match)(l_0_1, "/DAFOM%-%d+%.%d+%.%d+%.app/")) then
  return mp.CLEAN
end
local l_0_3, l_0_4 = "Execution_UserExecution_ExactMatch", (bm.get_process_relationships)()
if l_0_1 ~= nil then
  for l_0_8,l_0_9 in ipairs(R6_PC97) do
    local l_0_5 = nil
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (bm.trigger_sig)("BmTraverseTreeBlockMac", "Detected", R9_PC103.ppid)
  end
end
do
  if (this_sigattrlog[20]).matched or (this_sigattrlog[21]).matched or (this_sigattrlog[22]).matched or (this_sigattrlog[23]).matched or (this_sigattrlog[24]).matched or (this_sigattrlog[25]).matched or (this_sigattrlog[26]).matched then
    local l_0_10 = nil
    if IsExcludedByImagePathMacOS((bm.get_imagepath)()) then
      return mp.CLEAN
    end
    local l_0_11 = nil
    if (bm.get_current_process_startup_info)() == nil then
      return mp.CLEAN
    end
    local l_0_12 = nil
    if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) then
      return mp.CLEAN
    end
    if (SuspMacPathsToMonitor(l_0_11, true) or (string.find)(l_0_11, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_11, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_11, "/Users/[^/]+/Desktop/", 1, false)) and (sysio.IsFileExists)(l_0_11) then
      (bm.add_threat_file)(l_0_11)
    end
  end
  do
    TrackPidAndTechniqueBM("BM", l_0_2, l_0_3)
    return mp.INFECTED
  end
end

