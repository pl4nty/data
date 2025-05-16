-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bbb310e22a0e\0x000005b9_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetTaintLevelHR()
if l_0_0 ~= "Medium" and l_0_0 ~= "High" then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[2]
local l_0_2 = this_sigattrlog[3]
if not l_0_1.matched and not l_0_2.matched then
  return mp.CLEAN
end
local l_0_6, l_0_7 = , (string.match)((l_0_1.matched and l_0_1 or l_0_2).utf8p2, "^([0-9]+);regionsize:([0-9]+)")
if isnull(l_0_7) or isnull(R7_PC40) then
  return mp.CLEAN
end
l_0_7 = tonumber(R7_PC40)
-- DECOMPILER ERROR at PC51: Overwrote pending register: R7 in 'AssignReg'

if tonumber(R7_PC40) < 80000 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC61: Overwrote pending register: R7 in 'AssignReg'

local l_0_8, l_0_9 = , (bm.VirtualQuery)(R7_PC40)
if not l_0_9 or R7_PC40.state_type ~= (mp.bitor)(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE) then
  return mp.CLEAN
end
local l_0_10 = R7_PC40
local l_0_11 = nil
do
  local l_0_12 = nil
  if (bm.ReadProcMem)(l_0_7 - l_0_7 % 65536, l_0_11) ~= nil then
    local l_0_13 = nil
    if (mp.readu_u32)((bm.ReadProcMem)(l_0_7 - l_0_7 % 65536, l_0_11), 1) == 9460301 then
      local l_0_14 = nil
      if (mp.readu_u32)(l_0_13, (mp.readu_u32)(l_0_13, 61)) ~= 4542464 then
        return mp.CLEAN
      end
      local l_0_15 = nil
      if (mp.bitand)((mp.readu_u16)(l_0_13, (mp.readu_u32)(l_0_13, 61) + 22 + 1), 8192) ~= 0 then
        local l_0_19 = nil
        TriggerTargetedMemoryScan(l_0_12)
        if (bm.get_current_process_startup_info)() == nil or ((bm.get_current_process_startup_info)()).ppid == nil then
          return mp.CLEAN
        end
        TrackPidAndTechniqueBM(((bm.get_current_process_startup_info)()).ppid, "T1620", "reflective_dll_loaded")
        return mp.INFECTED
      end
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

