-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\16bb3cc73dbf9\0x000000a9_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["5a9342bd58c799c7ad6ee5ee4cf97cae63f9e3d4"] = true
l_0_0.a738f2d8360e0243af067b2bb537c54d52bf679f = true
l_0_0["2b0d8125167d52a26327884a925c7f3e9ba95475"] = true
local l_0_1 = (versioning.GetOrgID)()
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = scrubData(l_0_1)
if not l_0_0[l_0_2] then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched and not (this_sigattrlog[5]).matched and not (this_sigattrlog[6]).matched then
  return mp.CLEAN
end
local l_0_3 = nil
l_0_3 = ((not (this_sigattrlog[4]).matched or not this_sigattrlog[4]) and (not (this_sigattrlog[5]).matched or not this_sigattrlog[5]) and ((this_sigattrlog[6]).matched and this_sigattrlog[6])) or nil
local l_0_4, l_0_5 = (string.match)(l_0_3.utf8p2, "^([0-9]+);regionsize:([0-9]+)")
if isnull(l_0_4) or isnull(l_0_5) then
  return mp.CLEAN
end
l_0_4 = tonumber(l_0_4)
l_0_5 = tonumber(l_0_5)
local l_0_6 = {}
-- DECOMPILER ERROR at PC102: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC103: Overwrote pending register: R7 in 'AssignReg'

local l_0_7 = "NtTraceEvent"
-- DECOMPILER ERROR at PC104: Overwrote pending register: R8 in 'AssignReg'

local l_0_8 = (("EtwEventWrite").get_current_process_startup_info)()
-- DECOMPILER ERROR at PC107: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC108: Overwrote pending register: R10 in 'AssignReg'

for l_0_12,l_0_13 in ("EtwEventWriteEx")("EtwEventWriteTransfer") do
  l_0_7 = (bm.GetProcAddress)(l_0_8.ppid, "ntdll.dll", l_0_13)
  if l_0_7 ~= nil then
    local l_0_14, l_0_15 = (bm.VirtualQuery)(l_0_7)
    if l_0_14 and l_0_15.base_addr == l_0_4 then
      TrackPidAndTechniqueBM(l_0_8.ppid, "1562.006", "etw_patch_rt")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

