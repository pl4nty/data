-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f7b39828e1b6\1_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[4]).matched then
  return mp.CLEAN
end
local l_0_0 = nil
l_0_0 = this_sigattrlog[4]
local l_0_1, l_0_2 = (string.match)(l_0_0.utf8p2, "^([0-9]+);regionsize:([0-9]+)")
if isnull(l_0_1) or isnull(l_0_2) then
  return mp.CLEAN
end
l_0_1 = tonumber(l_0_1)
l_0_2 = tonumber(l_0_2)
if l_0_2 >= 5 then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC47: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC48: Overwrote pending register: R4 in 'AssignReg'

local l_0_4 = "NtTraceEvent"
-- DECOMPILER ERROR at PC49: Overwrote pending register: R5 in 'AssignReg'

local l_0_5 = (("EtwEventWrite").get_current_process_startup_info)()
-- DECOMPILER ERROR at PC52: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC53: Overwrote pending register: R7 in 'AssignReg'

for l_0_9,l_0_10 in ("EtwEventWriteEx")("EtwEventWriteTransfer") do
  l_0_4 = (bm.GetProcAddress)(l_0_5.ppid, "ntdll.dll", l_0_10)
  if l_0_4 ~= nil then
    local l_0_11, l_0_12 = (bm.VirtualQuery)(l_0_4)
    if l_0_11 and l_0_12.base_addr == l_0_1 then
      TrackPidAndTechniqueBM(l_0_5.ppid, "1562.006", "etw_patch_rt")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

