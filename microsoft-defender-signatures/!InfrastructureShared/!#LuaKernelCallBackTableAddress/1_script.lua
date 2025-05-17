-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaKernelCallBackTableAddress\1_luac 

-- params : ...
-- function num : 0
check_KCT_table_x64 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = {}
  local l_1_3 = 1
  for l_1_7 = 0, l_1_1 - 1 do
    local l_1_8 = (mp.readu_u64)(l_1_0, 8 * l_1_7 + 1)
    local l_1_9 = false
    if l_1_8 == 0 then
      l_1_9 = true
    else
      if (mp.bitand)(l_1_8, -1099511627776) < 1.3963797672755e+14 then
        l_1_9 = false
      else
        l_1_2[l_1_3] = l_1_8
        l_1_9 = true
        l_1_3 = l_1_3 + 1
      end
    end
    if l_1_9 == false then
      l_1_2[1] = 3735928559
      return l_1_2
    end
  end
  return l_1_2
end

getArrayMinMax = function(l_2_0)
  -- function num : 0_1
  local l_2_1 = #l_2_0
  local l_2_2 = {}
  l_2_2.min = 1
  l_2_2.max = 2
  if l_2_1 == 1 then
    l_2_2.max = l_2_0[1]
    l_2_2.min = l_2_0[1]
    return l_2_2
  end
  if l_2_0[2] < l_2_0[1] then
    l_2_2.max = l_2_0[1]
    l_2_2.min = l_2_0[2]
  else
    l_2_2.max = l_2_0[2]
    l_2_2.min = l_2_0[1]
  end
  for l_2_6 = 3, l_2_1 do
    if l_2_2.max < l_2_0[l_2_6] then
      l_2_2.max = l_2_0[l_2_6]
    else
      if l_2_0[l_2_6] < l_2_2.min then
        l_2_2.min = l_2_0[l_2_6]
      end
    end
  end
  return l_2_2
end

if (mp.get_mpattribute)("KernelCallBackTableObtained") then
  return mp.CLEAN
end
local l_0_0 = (MpCommon.GetTickCount64)()
local l_0_1 = 0
if IsKeyInRollingQueue("KernelCallBackAddress", "Recorded_Time", true) then
  l_0_1 = tonumber(GetRollingQueueKeyValue("KernelCallBackAddress", "Recorded_Time"))
end
if IsKeyInRollingQueue("KernelCallBackAddress", "fn_AddressRange_min", true) and IsKeyInRollingQueue("KernelCallBackAddress", "fn_AddressRange_max", true) and l_0_1 ~= 0 and l_0_1 < l_0_0 and l_0_0 > 86400000 then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetPEBAddress)()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = (mp.GetSMSProcArchitecture)()
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_4 ~= mp.SMS_PROC_ARCH_X64 then
  return mp.CLEAN
end
local l_0_5 = (mp.ReadProcMem)(l_0_3 + 88, 8)
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = (mp.readu_u64)(l_0_5, 1)
local l_0_7 = 128
local l_0_8 = (mp.ReadProcMem)(l_0_6, l_0_7 * 8)
if l_0_8 == nil then
  return mp.CLEAN
end
local l_0_9 = check_KCT_table_x64(l_0_8, l_0_7)
if l_0_9 == nil then
  return mp.CLEAN
else
  if #l_0_9 == 0 then
    return mp.CLEAN
  else
    if l_0_9[1] == 3735928559 then
      local l_0_10 = (mp.GetProcessCommandLine)(l_0_2)
      ;
      (mp.set_mpattribute)((string.format)("MpInternal_researchdata=Modified KCT=%s", (string.lower)(l_0_10)))
      ;
      (mp.set_mpattribute)("KernelCallBackTableObtained")
      return mp.INFECTED
    else
      do
        local l_0_11 = getArrayMinMax(l_0_9)
        local l_0_12 = l_0_11.min
        do
          local l_0_13 = l_0_11.max
          pcall(MpCommon.RollingQueueErase, "KernelCallBackAddress")
          AppendToRollingQueue("KernelCallBackAddress", "fn_AddressRange_min", l_0_12, 31536000)
          AppendToRollingQueue("KernelCallBackAddress", "fn_AddressRange_max", l_0_13, 31536000)
          AppendToRollingQueue("KernelCallBackAddress", "Recorded_Time", l_0_0, 31536000)
          ;
          (mp.set_mpattribute)("KernelCallBackTableObtained")
          return mp.INFECTED
        end
      end
    end
  end
end

