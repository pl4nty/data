-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaAppDomainManagerAssemblyBindingAM\1.luac 

-- params : ...
-- function num : 0
if not peattributes.ismsil then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = normalize_path(l_0_0)
if isnull(l_0_0) then
  return mp.CLEAN
end
if (string.match)(l_0_0, "^%a:\\program files\\") or (string.match)(l_0_0, "^%a:\\program files %(x86%)\\") then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2 = {}
;
(function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_2, l_0_1
  if isnull(l_1_0) then
    return 
  end
  local l_1_1 = (string.lower)(tostring(l_1_0))
  if not (string.match)(l_1_1, "([^\\/]+)$") then
    l_1_1 = (string.gsub)(l_1_1, "%.dll$", "")
    l_1_1 = (string.gsub)(l_1_1, "%.exe$", "")
    l_1_1 = (string.match)(l_1_1, "^%s*(.-)%s*$") or ""
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

    if l_1_1 ~= "" and not l_0_2[l_1_1] then
      l_0_2[l_1_1] = true
      -- DECOMPILER ERROR at PC53: Confused about usage of register: R2 in 'UnsetPending'

      l_0_1[#l_0_1 + 1] = l_1_1
    end
  end
end
)(l_0_0)
local l_0_4, l_0_5 = , pcall(pe.get_versioninfo)
if l_0_5 and not isnull(R7_PC70) then
  l_0_4(R7_PC70)
  -- DECOMPILER ERROR at PC77: Overwrote pending register: R7 in 'AssignReg'

  l_0_4(R7_PC70)
end
if #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_6 = nil
-- DECOMPILER ERROR at PC86: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC87: Overwrote pending register: R7 in 'AssignReg'

R7_PC70 = R7_PC70(l_0_0, "^(.*)\\[^\\]+$")
local l_0_7 = {}
while not isnull(R7_PC70) and #R7_PC70 >= 3 and #l_0_7 < 12 do
  l_0_7[#l_0_7 + 1] = R7_PC70
  R7_PC70 = (string.match)(R7_PC70, "^(.*)\\[^\\]+$")
end
if #l_0_7 == 0 then
  return mp.CLEAN
end
local l_0_8 = nil
local l_0_9 = "AppDomainManagerBoundLoaderV1"
local l_0_10 = "PendingPath"
local l_0_11 = "PendingBinding"
if (mp.get_mpattribute)("SLF:Trojan:MSIL/AppDomainManagerAssemblyLoadIL.AM") then
  local l_0_12 = nil
  local l_0_13 = #{} + 1
  l_0_12[l_0_13] = {"SeenPathAM", "SeenBindingAM"}
end
do
  -- DECOMPILER ERROR at PC141: Confused about usage of register: R11 in 'UnsetPending'

  if (mp.get_mpattribute)("SLF:Trojan:MSIL/AppDomainManagerNativeExecIL.AM") then
    local l_0_14 = nil
    local l_0_15 = #l_0_12 + 1
    l_0_14[l_0_15] = {"SeenPathAN", "SeenBindingAN"}
  end
  do
    -- DECOMPILER ERROR at PC148: Confused about usage of register: R11 in 'UnsetPending'

    if #l_0_14 == 0 then
      return mp.CLEAN
    end
    local l_0_16 = nil
    local l_0_17 = 86400
    do
      local l_0_19 = 512
      for l_0_23,l_0_24 in ipairs(l_0_16) do
        local l_0_20, l_0_21 = function(l_2_0, l_2_1)
  -- function num : 0_1 , upvalues : l_0_8
  if isnull(l_2_1) or l_2_1 == "" then
    return false
  end
  local l_2_2, l_2_3 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_2_0, l_0_8, l_2_1)
  if l_2_2 then
    do
      do return not isnull(l_2_3) end
      -- DECOMPILER ERROR at PC23: freeLocal<0 in 'ReleaseLocals'

    end
  end
end
, false
        -- DECOMPILER ERROR at PC164: Confused about usage of register: R20 in 'UnsetPending'

        AppendToRollingQueueNamespaced(R20_PC164[1], l_0_9, l_0_0, 1, l_0_17, l_0_19, 1)
        if l_0_20(l_0_10, l_0_0) then
          l_0_21 = true
        end
        for l_0_28,l_0_29 in ipairs(l_0_1) do
          for l_0_33,l_0_34 in ipairs(l_0_7) do
            -- DECOMPILER ERROR at PC189: Confused about usage of register: R30 in 'UnsetPending'

            AppendToRollingQueueNamespaced(l_0_26[2], l_0_9, l_0_31 .. "|" .. R30_PC189, 1, l_0_17, l_0_19, 1)
            -- DECOMPILER ERROR at PC202: Confused about usage of register: R31 in 'UnsetPending'

            if l_0_20(l_0_11, l_0_31 .. "|" .. R30_PC189) then
              l_0_21 = true
            end
          end
        end
      end
      -- DECOMPILER ERROR at PC213: Confused about usage of register: R15 in 'UnsetPending'

      if not l_0_21 then
        return mp.CLEAN
      end
      do return mp.INFECTED end
      -- DECOMPILER ERROR at PC221: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

