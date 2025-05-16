-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\151b32947c6e3\0x0000005e_luac 

-- params : ...
-- function num : 0
if not IsKeyInRollingQueue("KernelCallBackAddress", "fn_AddressRange_min", true) or not IsKeyInRollingQueue("KernelCallBackAddress", "fn_AddressRange_max", true) then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[7]).utf8p2
local l_0_1 = (this_sigattrlog[7]).ppid
local l_0_2 = nil
_ = (string.find)(l_0_0, "vmbaseaddress:(%d+);")
-- DECOMPILER ERROR at PC35: Overwrote pending register: R2 in 'AssignReg'

local l_0_3 = tonumber(GetRollingQueueKeyValue("KernelCallBackAddress", "fn_AddressRange_min"))
local l_0_4 = tonumber(GetRollingQueueKeyValue("KernelCallBackAddress", "fn_AddressRange_max"))
if not l_0_2 or not l_0_4 or not l_0_3 then
  return mp.CLEAN
end
if l_0_2 <= l_0_4 and l_0_3 <= l_0_2 then
  (bm.add_related_process)(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN

