-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!SuspWDACPolicyFileA\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0
  local l_1_3 = ""
  if l_1_1 + 4 < l_1_2 then
    local l_1_4 = (mp.readu_u32)((mp.readfile)(l_1_1, 4), 1)
    l_1_1 = l_1_1 + 4
    if l_1_4 <= 0 then
      return "", l_1_1
    end
    -- DECOMPILER ERROR at PC38: Overwrote pending register: R3 in 'AssignReg'

    if l_1_1 + l_1_4 < l_1_2 then
      if l_1_0 and l_1_3 == nil then
        do
          l_1_1 = l_1_1 + l_1_4 + (mp.bitand)(4 - l_1_4 % 4, 3)
          return l_1_3, l_1_1
        end
      end
    end
  end
end

local l_0_1 = function(l_2_0, l_2_1)
  -- function num : 0_1
  local l_2_2 = ""
  do
    if l_2_0 + 4 < l_2_1 then
      local l_2_3 = (mp.readu_u32)((mp.readfile)(l_2_0, 4), 1)
      l_2_0 = l_2_0 + 4
      if l_2_3 <= 0 then
        l_2_0 = l_2_0 + 4
        return "", l_2_0
      end
      -- DECOMPILER ERROR at PC44: Overwrote pending register: R2 in 'AssignReg'

      -- DECOMPILER ERROR at PC46: Overwrote pending register: R0 in 'AssignReg'

    end
    if l_2_0 + l_2_3 < l_2_1 and l_2_2 ~= nil then
      return l_2_2, l_2_0
    end
  end
end

if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = {}
-- DECOMPILER ERROR at PC32: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC33: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC34: Overwrote pending register: R5 in 'AssignReg'

if ("SecurityPackStartup.exe")("pg_basebackup.exe", l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC44: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC45: Overwrote pending register: R5 in 'AssignReg'

local l_0_5 = (("Windows\\System32\\CodeIntegrity\\SiPolicy.p7b").getfilename)()
if l_0_5 and contains(l_0_5, l_0_4) then
  return mp.CLEAN
end
local l_0_6 = (mp.getfilesize)()
if l_0_6 < 68 then
  return mp.CLEAN
end
if l_0_6 > 1048576 then
  return mp.CLEAN
end
local l_0_7 = (mp.readu_u32)(headerpage, 1)
local l_0_8 = (mp.readu_u32)(headerpage, 41)
local l_0_9 = (mp.readu_u32)(headerpage, 45)
if l_0_9 <= 0 then
  return mp.CLEAN
end
if l_0_9 > 300 then
  return mp.CLEAN
end
local l_0_10 = 68
;
(mp.readprotection)(false)
if l_0_8 > 0 then
  for l_0_14 = 1, l_0_8 do
    l_0_14 = l_0_0(false, l_0_10, l_0_6)
  end
end
do
  local l_0_15 = {}
  l_0_15["mssense.exe"] = true
  l_0_15["msmpeng.exe"] = true
  l_0_15["wdfilter.sys"] = true
  l_0_15["wdnisdrv.sys"] = true
  l_0_15["mssecflt.sys"] = true
  l_0_15["msseccore.sys"] = true
  l_0_15["mssecwfp.sys"] = true
  l_0_15["mpcoredefenderservice.exe"] = true
  l_0_15["senseir.exe"] = true
  local l_0_16 = false
  local l_0_17 = {}
  for l_0_21 = 1, l_0_9 do
    if l_0_10 + 4 <= l_0_6 then
      local l_0_22 = (mp.readu_u32)((mp.readfile)(l_0_10, 4), 1)
      -- DECOMPILER ERROR at PC144: Overwrote pending register: R10 in 'AssignReg'

      local l_0_23 = ""
      -- DECOMPILER ERROR at PC150: Overwrote pending register: R10 in 'AssignReg'

      l_0_23 = l_0_1(l_0_10, l_0_6)
      if l_0_22 == 0 and l_0_15[(string.lower)(l_0_23)] then
        (mp.set_mpattribute)((string.format)("MpInternal_researchdata=MDEFileDenied=%s", (MpCommon.Base64Encode)(l_0_23)))
        return mp.INFECTED
      end
      -- DECOMPILER ERROR at PC175: Overwrote pending register: R10 in 'AssignReg'

      local l_0_24 = ""
      -- DECOMPILER ERROR at PC182: Overwrote pending register: R10 in 'AssignReg'

      l_0_24 = l_0_0(true, l_0_10, l_0_6)
      if l_0_22 == 0 and l_0_23 == "" and l_0_24 == "" then
        l_0_16 = true
        l_0_17[l_0_21] = true
      end
    end
  end
  do
    if l_0_16 == false or l_0_7 ~= 7 then
      return mp.CLEAN
    end
    local l_0_25 = 0
    -- DECOMPILER ERROR at PC201: Overwrote pending register: R10 in 'AssignReg'

    if l_0_6 - 68 < 4000 then
      l_0_25 = l_0_6 - 68
    else
      l_0_25 = 4000
      -- DECOMPILER ERROR at PC208: Overwrote pending register: R10 in 'AssignReg'

    end
    local l_0_26 = (mp.readfile)(l_0_10, l_0_25)
    if l_0_26 == nil then
      return mp.CLEAN
    end
    local l_0_27 = "\006%z%z%z" .. ("."):rep(36) .. "\a%z%z%z"
    local l_0_28 = l_0_26:find(l_0_27)
    if l_0_28 == nil then
      return mp.CLEAN
    end
    local l_0_29 = {}
    l_0_29["c:\\programdata\\microsoft\\windows defender"] = true
    l_0_29["c:\\programdata\\microsoft\\windows defender advanced threat protection"] = true
    l_0_29["c:\\program files\\windows defender advanced threat protection"] = true
    l_0_29["c:\\program files (x86)\\windows defender advanced threat protection"] = true
    l_0_29["c:\\program files\\windows defender"] = true
    l_0_29["c:\\program files (x86)\\windows defender"] = true
    l_0_29["c:\\windows\\*"] = true
    l_0_29["c:\\program files\\*"] = true
    l_0_29["c:\\program files (x86)\\*"] = true
    local l_0_30 = 1
    local l_0_31 = l_0_28 + 44
    while 1 do
      if l_0_31 + 4 <= l_0_6 and l_0_30 <= l_0_9 then
        local l_0_32 = (mp.readu_u32)(l_0_26, l_0_31)
        l_0_31 = l_0_31 + 4
        local l_0_33 = ""
        local l_0_34 = (mp.bitand)(4 - l_0_32 % 4, 3)
        local l_0_35 = l_0_31
        if l_0_35 + l_0_32 <= l_0_6 then
          for l_0_39 = l_0_31, l_0_35 + l_0_32, 2 do
            local l_0_40 = (mp.readu_u16)(l_0_26, l_0_39)
            if l_0_40 ~= 0 then
              l_0_33 = l_0_33 .. (string.char)(l_0_40)
              l_0_31 = l_0_31 + 2
            end
          end
          l_0_31 = l_0_31 + l_0_34 + 4
          if l_0_29[(string.lower)(l_0_33)] and l_0_17[l_0_30] then
            local l_0_41 = (MpCommon.NormalizeString)(l_0_33, "CmdLineNormalizationStandard")
            ;
            (mp.set_mpattribute)((string.format)("MpInternal_researchdata=MDEPathDenied=%s", (MpCommon.Base64Encode)(l_0_41)))
            ;
            (mp.changedetectionname)(805306763)
            return mp.INFECTED
          end
        end
        do
          do
            l_0_30 = l_0_30 + 1
            -- DECOMPILER ERROR at PC323: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC323: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC323: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    return mp.CLEAN
  end
end

