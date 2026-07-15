-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\HstrLuaLib\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = "RdTrace"
  local l_1_2 = (string.format)("%x", (crypto.CRC32Buffer)(-1, l_1_0, 0, #l_1_0))
  AppendToRollingQueue(l_1_1, l_1_2, 0, 120, 32, 1)
end

getTamperProtectionState = function()
  -- function num : 0_1
  local l_2_0 = (sysio.RegOpenKey)("HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features")
  do
    if l_2_0 then
      local l_2_1 = (sysio.GetRegValueAsDword)(l_2_0, "TamperProtection")
      if l_2_1 then
        return l_2_1
      end
    end
    return nil
  end
end

isTamperProtectionOn = function()
  -- function num : 0_2
  local l_3_0 = getTamperProtectionState()
  if l_3_0 then
    if (mp.bitand)(l_3_0, 1) == 1 then
      return true, l_3_0
    else
      return false, l_3_0
    end
  end
  return nil
end

checkIfCertificateHit = function()
  -- function num : 0_3
  local l_4_0 = (mp.get_mpattributevalue)("RPF:MpCertVA")
  if l_4_0 == nil then
    return false
  end
  local l_4_1 = (mp.get_mpattributevalue)("RPF:MpCertSz")
  local l_4_2 = (mp.hstr_full_log)()
  for l_4_6,l_4_7 in pairs(l_4_2) do
    if l_4_7.matched and l_4_7.VA and l_4_0 < l_4_7.VA and l_4_7.VA < l_4_0 + l_4_1 then
      return true
    end
  end
  return false
end

isSafeToRead = function(l_5_0, l_5_1, l_5_2)
  -- function num : 0_4
  if not l_5_1 or not l_5_2 then
    return false
  end
  if l_5_1 <= 0 or l_5_2 <= 0 then
    return false
  end
  local l_5_3, l_5_4 = (mp.SMSVirtualQuery)(l_5_1)
  if not l_5_3 then
    return false
  end
  local l_5_5 = l_5_0[l_5_4.found_ix]
  if not l_5_5 then
    return false
  end
  do
    local l_5_6 = (mp.bitand)(l_5_5.prot, 255)
    if l_5_6 ~= 32 and l_5_6 ~= 64 and l_5_6 ~= 128 and l_5_6 ~= 8 and l_5_6 ~= 4 and l_5_6 ~= 2 then
      return false
    end
    do return l_5_5.addr < l_5_1 + l_5_2 and l_5_1 + l_5_2 <= l_5_5.addr + l_5_5.size end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

maceExtract_ZLoader = function()
  -- function num : 0_5
  if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
    return mp.INFECTED
  end
  local l_6_0 = function(l_7_0)
    -- function num : 0_5_0
    l_7_0 = (mp.bitand)(l_7_0, 4294967295)
    local l_7_1, l_7_2, l_7_3, l_7_4 = (mp.bsplit)(l_7_0, 8)
    return (string.char)(l_7_1) .. (string.char)(l_7_2) .. (string.char)(l_7_3) .. (string.char)(l_7_4)
  end

  local l_6_1 = function(l_8_0, l_8_1)
    -- function num : 0_5_1
    local l_8_2 = ""
    for l_8_6 = l_8_1, #l_8_0 do
      if (string.byte)(l_8_0, l_8_6) >= 32 then
        do
          if (string.byte)(l_8_0, l_8_6) > 126 then
            break
          end
          l_8_2 = l_8_2 .. (string.char)((string.byte)(l_8_0, l_8_6))
          -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC30: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
    return l_8_2
  end

  local l_6_2 = (mp.hstr_full_log)()
  local l_6_3 = ""
  for l_6_7,l_6_8 in ipairs(l_6_2) do
    if l_6_8.matched then
      local l_6_9 = (mp.ReadProcMem)(l_6_8.VA, 80)
      if not l_6_9 then
        return mp.INFECTED
      end
      if (mp.readu_u16)(l_6_9, 1) == 50307 then
        local l_6_10 = "\\x83\\xC4\\x04\\x84\\xC0\\x74.\\xE8....\\xE8....\\xE8....\\xE8....[\\x00-\\x67\\x69-\\xFF]+\\x68(....)\\x68(....)"
        local l_6_11, l_6_12, l_6_13 = (MpCommon.BinaryRegExpSearch)(l_6_10, l_6_9)
        if l_6_11 then
          l_6_12 = (mp.readu_u32)(l_6_12, 1)
          l_6_13 = (mp.readu_u32)(l_6_13, 1)
          local l_6_14, l_6_15 = (mp.bsplit)(l_6_12, 16)
          local l_6_16, l_6_17 = (mp.bsplit)(l_6_13, 16)
          if l_6_15 ~= l_6_17 then
            return mp.INFECTED
          end
          local l_6_18 = (mp.ReadProcMem)(l_6_12, 48)
          if not l_6_18 then
            return mp.INFECTED
          end
          local l_6_19 = l_6_1(l_6_18, 1)
          if #l_6_19 == 0 or #l_6_19 == 48 then
            return mp.INFECTED
          end
          local l_6_20 = (mp.ReadProcMem)(l_6_13, 880)
          if not l_6_20 then
            return mp.INFECTED
          end
          l_6_3 = "ZLOA" .. l_6_0(#l_6_19) .. l_6_19 .. l_6_0(#l_6_20) .. l_6_20
          l_6_3 = (MpCommon.Base64Encode)(l_6_3)
        end
        break
      end
    end
  end
  do
    do
      if l_6_3 ~= "" then
        local l_6_21 = "mace_zloader"
        AppendToRollingQueue(l_6_21, l_6_3, 0, 60, 32, 1)
      end
      return mp.INFECTED
    end
  end
end

maceExtract_CobaltStrike = function(l_7_0)
  -- function num : 0_6 , upvalues : l_0_0
  if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
    return 
  end
  local l_7_4 = (mp.GetSMSProcArchitecture)() == mp.SMS_PROC_ARCH_X64
  local l_7_5 = (mp.GetScannedPPID)()
  local l_7_8 = (mp.GetSMSMemRanges)()
  local l_7_9 = function(l_8_0, l_8_1)
    -- function num : 0_6_0 , upvalues : l_7_6
    if not l_8_0 or not l_8_1 then
      return false
    end
    if l_8_0 <= 0 or l_8_1 <= 0 then
      return false
    end
    local l_8_2, l_8_3 = (mp.SMSVirtualQuery)(l_8_0)
    if not l_8_2 then
      return false
    end
    local l_8_4 = l_7_6[l_8_3.found_ix]
    if not l_8_4 then
      return false
    end
    do
      local l_8_5 = (mp.bitand)(l_8_4.prot, 255)
      if l_8_5 ~= 32 and l_8_5 ~= 64 and l_8_5 ~= 128 and l_8_5 ~= 8 and l_8_5 ~= 4 then
        return false
      end
      do return l_8_4.addr < l_8_0 + l_8_1 and l_8_0 + l_8_1 <= l_8_4.addr + l_8_4.size end
      -- DECOMPILER ERROR: 1 unprocessed JMP targets
    end
  end

  local l_7_10 = function(l_9_0, l_9_1)
    -- function num : 0_6_1 , upvalues : l_7_7
    if not l_7_7(l_9_0, l_9_1) then
      return nil
    end
    local l_9_2 = mp.ReadProcMem
    local l_9_3 = l_9_0
    do
      local l_9_4 = l_9_1
      do return l_9_2(l_9_3, l_9_4) end
      -- DECOMPILER ERROR at PC14: Confused about usage of register R3 for local variables in 'ReleaseLocals'

    end
  end

  local l_7_13 = function(l_10_0)
    -- function num : 0_6_2
    local l_10_1 = ""
    local l_10_2 = 6
    local l_10_3 = 0
    if not l_10_0 or #l_10_0 == 0 then
      return -1
    end
    if (string.byte)(l_10_0, 1) == 0 then
      l_10_1 = "([\\x00-\\xFF]+)\\x00\\x25\\x00\\x02\\x00\\x04"
    else
      if (string.byte)(l_10_0, 1) == 46 then
        l_10_1 = "([\\x00-\\xFF]+)\\x2e\\x0b\\x2e\\x2c\\x2e\\x2a"
        l_10_3 = 46
      else
        if (string.byte)(l_10_0, 1) == 105 then
          l_10_1 = "([\\x00-\\xFF]+)\\x69\\x4c\\x69\\x6b\\x69\\x6d"
          l_10_3 = 105
        else
          if (string.byte)(l_10_0, 1) == 78 then
            l_10_1 = "([\\x00-\\xFF]+)\\x4e\\x6b\\x4e\\x4c\\x4e\\x4a"
            l_10_3 = 78
          else
            return -1
          end
        end
      end
    end
    if l_10_1 == "" then
      return -1
    end
    local l_10_4, l_10_5 = (MpCommon.BinaryRegExpSearch)(l_10_1, l_10_0)
    if not l_10_4 then
      return -1
    end
    local l_10_6 = #l_10_5 + l_10_2 + 1
    if #l_10_0 < l_10_6 + 4 then
      return -1
    end
    do
      local l_10_11, l_10_12, l_10_13, l_10_14 = (string.char)((mp.bitxor)((string.byte)(l_10_0, l_10_6 + 3), l_10_3)), (string.char)((mp.bitxor)((string.byte)(l_10_0, l_10_6 + 2), l_10_3)), (string.char)((mp.bitxor)((string.byte)(l_10_0, l_10_6 + 1), l_10_3)), string.char
      l_10_14 = l_10_14((mp.bitxor)((string.byte)(l_10_0, l_10_6 + 0), l_10_3))
      l_10_11 = l_10_11 .. l_10_12 .. l_10_13 .. l_10_14
      local l_10_7 = nil
      l_10_12 = mp
      l_10_12 = l_10_12.readu_u32
      local l_10_8 = nil
      l_10_13 = l_10_11
      local l_10_9 = nil
      l_10_14 = 1
      local l_10_10 = nil
      do return l_10_12(l_10_13, l_10_14) end
      -- DECOMPILER ERROR at PC128: Confused about usage of register R9 for local variables in 'ReleaseLocals'

    end
  end

  local l_7_14 = function(l_11_0)
    -- function num : 0_6_3
    local l_11_1 = ""
    local l_11_2 = 6
    local l_11_3 = 0
    if not l_11_0 or #l_11_0 == 0 then
      return nil
    end
    if (string.byte)(l_11_0, 1) == 0 then
      l_11_1 = "([\\x00-\\xFF]+)\\x00\\x08\\x00\\x03\\x01\\x00"
    else
      if (string.byte)(l_11_0, 1) == 46 then
        l_11_1 = "([\\x00-\\xFF]+)\\x2e\\x26\\x2e\\x2d\\x2f\\x2e"
        l_11_3 = 46
      else
        if (string.byte)(l_11_0, 1) == 105 then
          l_11_1 = "([\\x00-\\xFF]+)\\x69\\x61\\x69\\x6a\\x68\\x69"
          l_11_3 = 105
        else
          if (string.byte)(l_11_0, 1) == 78 then
            l_11_1 = "([\\x00-\\xFF]+)\\x4e\\x46\\x4e\\x4d\\x4f\\x4e"
            l_11_3 = 78
          else
            return nil
          end
        end
      end
    end
    if l_11_1 == "" then
      return nil
    end
    local l_11_4, l_11_5 = (MpCommon.BinaryRegExpSearch)(l_11_1, l_11_0)
    if not l_11_4 then
      return nil
    end
    local l_11_6 = #l_11_5 + l_11_2 + 1
    if #l_11_0 < l_11_6 + 4 then
      return nil
    end
    local l_11_7 = ""
    for l_11_11 = l_11_6, #l_11_0 do
      local l_11_12 = (mp.bitxor)((string.byte)(l_11_0, l_11_11), l_11_3)
      if l_11_12 == 0 then
        break
      end
      l_11_7 = l_11_7 .. (string.char)(l_11_12)
    end
    do
      return l_11_7
    end
  end

  local l_7_15 = function(l_12_0, l_12_1)
    -- function num : 0_6_4
    -- DECOMPILER ERROR at PC5: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC11: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC17: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC23: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC29: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC35: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC41: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC47: Overwrote pending register: R9 in 'AssignReg'

    return nil + nil * 256 + nil * 65536 + nil * 16777216 + nil * 4294967296 + nil * 1099511627776 + nil * 2.8147497671066e+14 + nil * 7.2057594037928e+16
  end

  do
    if not l_7_0 then
      local l_7_16 = function(l_13_0, l_13_1, l_13_2)
    -- function num : 0_6_5 , upvalues : l_7_8, l_7_11
    local l_13_3 = ""
    local l_13_4 = l_7_8(l_13_0, l_13_1 * 128)
    if not l_13_4 then
      return ""
    end
    local l_13_5 = 1
    local l_13_6 = 2
    local l_13_7 = 3
    local l_13_8 = {}
    local l_13_9 = {}
    l_13_9.pos = 1
    l_13_9.fieldType = l_13_5
    l_13_9.size = 2
    local l_13_10 = {}
    l_13_10.pos = 2
    l_13_10.fieldType = l_13_5
    l_13_10.size = 2
    local l_13_11 = {}
    l_13_11.pos = 3
    l_13_11.fieldType = l_13_6
    l_13_11.size = 4
    local l_13_12 = {}
    l_13_12.pos = 4
    l_13_12.fieldType = l_13_6
    l_13_12.size = 4
    local l_13_13 = {}
    l_13_13.pos = 5
    l_13_13.fieldType = l_13_5
    l_13_13.size = 2
    local l_13_14 = {}
    l_13_14.pos = 6
    l_13_14.fieldType = l_13_5
    l_13_14.size = 2
    local l_13_15 = {}
    l_13_15.pos = 7
    l_13_15.fieldType = l_13_7
    l_13_15.size = 256
    local l_13_16 = {}
    l_13_16.pos = 8
    l_13_16.fieldType = l_13_7
    l_13_16.size = 256
    local l_13_17 = {}
    l_13_17.pos = 9
    l_13_17.fieldType = l_13_7
    l_13_17.size = 128
    local l_13_18 = {}
    l_13_18.pos = 10
    l_13_18.fieldType = l_13_7
    l_13_18.size = 64
    local l_13_19 = {}
    l_13_19.pos = 11
    l_13_19.fieldType = l_13_7
    l_13_19.size = 256
    local l_13_20 = {}
    l_13_20.pos = 12
    l_13_20.fieldType = l_13_7
    l_13_20.size = 256
    local l_13_21 = {}
    l_13_21.pos = 13
    l_13_21.fieldType = l_13_7
    l_13_21.size = 256
    local l_13_22 = {}
    l_13_22.pos = 14
    l_13_22.fieldType = l_13_7
    l_13_22.size = 16
    local l_13_23 = {}
    l_13_23.pos = 15
    l_13_23.fieldType = l_13_7
    l_13_23.size = 128
    local l_13_24 = {}
    l_13_24.pos = 19
    l_13_24.fieldType = l_13_6
    l_13_24.size = 4
    local l_13_25 = {}
    l_13_25.pos = 20
    l_13_25.fieldType = l_13_6
    l_13_25.size = 4
    local l_13_26 = {}
    l_13_26.pos = 21
    l_13_26.fieldType = l_13_7
    l_13_26.size = 256
    local l_13_27 = {}
    l_13_27.pos = 22
    l_13_27.fieldType = l_13_5
    l_13_27.size = 2
    local l_13_28 = {}
    l_13_28.pos = 23
    l_13_28.fieldType = l_13_7
    l_13_28.size = 128
    local l_13_29 = {}
    l_13_29.pos = 24
    l_13_29.fieldType = l_13_7
    l_13_29.size = 128
    local l_13_30 = {}
    l_13_30.pos = 25
    l_13_30.fieldType = l_13_7
    l_13_30.size = 6144
    local l_13_31 = {}
    l_13_31.pos = 26
    l_13_31.fieldType = l_13_7
    l_13_31.size = 16
    local l_13_32 = {}
    l_13_32.pos = 27
    l_13_32.fieldType = l_13_7
    l_13_32.size = 16
    local l_13_33 = {}
    l_13_33.pos = 28
    l_13_33.fieldType = l_13_6
    l_13_33.size = 4
    local l_13_34 = {}
    l_13_34.pos = 29
    l_13_34.fieldType = l_13_7
    l_13_34.size = 64
    local l_13_35 = {}
    l_13_35.pos = 30
    l_13_35.fieldType = l_13_7
    l_13_35.size = 64
    local l_13_36 = {}
    l_13_36.pos = 31
    l_13_36.fieldType = l_13_6
    l_13_36.size = 4
    local l_13_37 = {}
    l_13_37.pos = 32
    l_13_37.fieldType = l_13_7
    l_13_37.size = 128
    local l_13_38 = {}
    l_13_38.pos = 33
    l_13_38.fieldType = l_13_7
    l_13_38.size = 64
    local l_13_39 = {}
    l_13_39.pos = 34
    l_13_39.fieldType = l_13_7
    l_13_39.size = 64
    local l_13_40 = {}
    l_13_40.pos = 35
    l_13_40.fieldType = l_13_5
    l_13_40.size = 2
    local l_13_41 = {}
    l_13_41.pos = 37
    l_13_41.fieldType = l_13_6
    l_13_41.size = 4
    local l_13_42 = {}
    l_13_42.pos = 38
    l_13_42.fieldType = l_13_5
    l_13_42.size = 2
    local l_13_43 = {}
    l_13_43.pos = 39
    l_13_43.fieldType = l_13_5
    l_13_43.size = 2
    local l_13_44 = {}
    l_13_44.pos = 40
    l_13_44.fieldType = l_13_6
    l_13_44.size = 4
    local l_13_45 = {}
    l_13_45.pos = 43
    l_13_45.fieldType = l_13_5
    l_13_45.size = 2
    local l_13_46 = {}
    l_13_46.pos = 44
    l_13_46.fieldType = l_13_5
    l_13_46.size = 2
    local l_13_47 = {}
    l_13_47.pos = 45
    l_13_47.fieldType = l_13_6
    l_13_47.size = 4
    local l_13_48 = {}
    l_13_48.pos = 46
    l_13_48.fieldType = l_13_7
    l_13_48.size = 256
    local l_13_49 = {}
    l_13_49.pos = 47
    l_13_49.fieldType = l_13_7
    l_13_49.size = 256
    local l_13_50 = {}
    l_13_50.pos = 51
    l_13_50.fieldType = l_13_7
    l_13_50.size = 128
    local l_13_51 = {}
    l_13_51.pos = 52
    l_13_51.fieldType = l_13_5
    l_13_51.size = 2
    local l_13_52 = {}
    l_13_52.pos = 50
    l_13_52.fieldType = l_13_5
    l_13_52.size = 2
    do
      local l_13_53 = {}
      l_13_53.pos = 54
      l_13_53.fieldType = l_13_7
      l_13_53.size = 128
      -- DECOMPILER ERROR at PC193: No list found for R8 , SetList fails

      l_13_9 = ipairs
      l_13_10 = l_13_8
      l_13_9 = l_13_9(l_13_10)
      for l_13_12,l_13_13 in l_13_9 do
        l_13_14 = mp
        l_13_14 = l_13_14.bsplit
        l_13_15 = l_13_13.size
        l_13_16 = 8
        l_13_14 = l_13_14(l_13_15, l_13_16)
        l_13_16 = l_13_13.pos
        l_13_16 = l_13_16 * l_13_2
        l_13_16 = l_13_16 + 1
        l_13_17 = l_13_16 + l_13_1
        l_13_18 = "\000"
        l_13_19 = string
        l_13_19 = l_13_19.char
        l_13_20 = l_13_13.pos
        l_13_19 = l_13_19(l_13_20)
        l_13_20 = "\000"
        l_13_21 = string
        l_13_21 = l_13_21.char
        l_13_22 = l_13_13.fieldType
        l_13_21 = l_13_21(l_13_22)
        l_13_22 = string
        l_13_22 = l_13_22.char
        l_13_23 = 
        l_13_22 = l_13_22(l_13_23)
        l_13_23 = string
        l_13_23 = l_13_23.char
        l_13_24 = l_13_14
        l_13_23 = l_13_23(l_13_24)
        l_13_18 = l_13_18 .. l_13_19 .. l_13_20 .. l_13_21 .. l_13_22 .. l_13_23
        l_13_19 = string
        l_13_19 = l_13_19.byte
        l_13_20 = l_13_4
        l_13_21 = l_13_16
        l_13_19 = l_13_19(l_13_20, l_13_21)
        l_13_20 = l_13_13.fieldType
        if l_13_19 == l_13_20 then
          l_13_19 = l_13_13.fieldType
          if l_13_19 ~= l_13_7 then
            l_13_19 = string
            l_13_19 = l_13_19.sub
            l_13_20 = l_13_4
            l_13_21 = l_13_17
            l_13_22 = l_13_13.size
            l_13_22 = l_13_22 - 1
            l_13_22 = l_13_17 + (l_13_22)
            l_13_19 = l_13_19(l_13_20, l_13_21, l_13_22)
            l_13_20 = l_13_3
            l_13_21 = l_13_18
            l_13_3 = l_13_20 .. l_13_21
            l_13_20 = l_13_3
            l_13_21 = string
            l_13_21 = l_13_21.reverse
            l_13_22 = l_13_19
            l_13_21 = l_13_21(l_13_22)
            l_13_3 = l_13_20 .. l_13_21
          else
            l_13_19 = 0
            if l_13_1 == 4 then
              l_13_20 = mp
              l_13_20 = l_13_20.readu_u32
              l_13_21 = l_13_4
              l_13_22 = l_13_17
              l_13_20 = l_13_20(l_13_21, l_13_22)
              l_13_19 = l_13_20
            else
              l_13_20 = l_7_11
              l_13_21 = l_13_4
              l_13_22 = l_13_17
              l_13_20 = l_13_20(l_13_21, l_13_22)
              l_13_19 = l_13_20
            end
            if l_13_19 ~= 0 then
              l_13_20 = l_7_8
              l_13_21 = l_13_19
              l_13_22 = l_13_13.size
              l_13_20 = l_13_20(l_13_21, l_13_22)
              if not l_13_20 then
                l_13_21 = ""
                return l_13_21
              end
              l_13_21 = l_13_3
              l_13_22 = l_13_18
              l_13_3 = l_13_21 .. l_13_22
              l_13_21 = l_13_3
              l_13_22 = l_13_20
              l_13_3 = l_13_21 .. l_13_22
            end
          end
        end
      end
      do return l_13_3 end
      -- DECOMPILER ERROR at PC289: Confused about usage of register R13 for local variables in 'ReleaseLocals'

    end
  end

      for l_7_20,l_7_21 in ipairs((mp.hstr_full_log)()) do
        local l_7_17, l_7_18, l_7_19, l_7_20, l_7_21 = function(l_14_0)
    -- function num : 0_6_6 , upvalues : l_0_0, l_7_4, l_7_8, l_7_5
    l_0_0("patch started")
    local l_14_1 = {}
    -- DECOMPILER ERROR at PC5: No list found for R1 , SetList fails

    local l_14_2 = {}
    -- DECOMPILER ERROR at PC8: No list found for R2 , SetList fails

    -- DECOMPILER ERROR at PC9: Overwrote pending register: R3 in 'AssignReg'

    for l_14_8,l_14_9 in ipairs(l_14_0) do
      local l_14_5 = 27 and l_14_1 or l_14_2
      for l_14_13,l_14_14 in ipairs(l_14_5) do
        -- DECOMPILER ERROR at PC23: Confused about usage of register: R13 in 'UnsetPending'

        local l_14_16 = nil
        if not l_7_8(l_14_10 + R13_PC23, 4) then
          return 
        end
        if (string.byte)(l_7_8(l_14_10 + R13_PC23, 4), 1) == 117 then
          (mp.WriteProcByte)(l_14_16, 116)
          l_0_0("patch completed")
          AppendToRollingQueue("82e27b72_" .. l_7_5, "true")
        else
          l_0_0("patch failed.")
          local l_14_17 = nil
          -- DECOMPILER ERROR at PC63: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC71: Overwrote pending register: R16 in 'AssignReg'

          if l_14_15 ~= 189 or l_14_15 == 27 then
            do
              AppendToRollingQueue("82e27b72_" .. l_7_5, (MpCommon.Base64Encode)(nil))
              -- DECOMPILER ERROR at PC81: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC81: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC81: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC81: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
, {}, "", {}
        -- DECOMPILER ERROR at PC50: Confused about usage of register: R19 in 'UnsetPending'

        if R19_PC50.matched then
          if l_7_10(R19_PC50.VA, 16) == nil then
            return 
          end
          l_7_21[R19_PC50.VA] = l_7_10(R19_PC50.VA, 16)
          if (mp.readu_u16)(l_7_10(R19_PC50.VA, 16), 1) == 55925 or (mp.readu_u16)(l_7_10(R19_PC50.VA, 16), 1) == 25420 then
            for l_7_26,l_7_27 in ipairs(R19_PC50.VA_all) do
              local l_7_27 = nil
              -- DECOMPILER ERROR at PC83: Confused about usage of register: R25 in 'UnsetPending'

              ;
              (table.insert)(l_7_19, R25_PC83)
            end
          end
        end
      end
      -- DECOMPILER ERROR at PC90: Confused about usage of register: R14 in 'UnsetPending'

      for l_7_31,l_7_32 in pairs(l_7_21) do
        local l_7_28, l_7_29, l_7_30, l_7_31 = nil
        -- DECOMPILER ERROR at PC95: Confused about usage of register: R19 in 'UnsetPending'

        -- DECOMPILER ERROR at PC102: Confused about usage of register: R19 in 'UnsetPending'

        -- DECOMPILER ERROR at PC109: Confused about usage of register: R19 in 'UnsetPending'

        -- DECOMPILER ERROR at PC116: Confused about usage of register: R19 in 'UnsetPending'

        -- DECOMPILER ERROR at PC124: Confused about usage of register: R19 in 'UnsetPending'

        -- DECOMPILER ERROR at PC129: Confused about usage of register: R18 in 'UnsetPending'

        -- DECOMPILER ERROR at PC129: Overwrote pending register: R20 in 'AssignReg'

        -- DECOMPILER ERROR at PC131: Confused about usage of register: R18 in 'UnsetPending'

        -- DECOMPILER ERROR at PC131: Overwrote pending register: R20 in 'AssignReg'

        if (mp.readu_u16)(l_7_26, 1) == 256 or (mp.readu_u16)(l_7_26, 1) == 26729 or (mp.readu_u16)(l_7_26, 1) == 12078 or (mp.readu_u16)(l_7_26, 1) == 20302 then
          if (mp.readu_u16)(l_7_26, 1) == 256 then
            do
              l_7_30 = l_7_10(0, 4096)
              if not l_7_30 then
                l_7_30 = ""
              end
              -- DECOMPILER ERROR at PC143: Confused about usage of register: R19 in 'UnsetPending'

              -- DECOMPILER ERROR at PC150: Confused about usage of register: R19 in 'UnsetPending'

              if (mp.readu_u16)(l_7_26, 1) == 55925 then
                local l_7_34 = nil
                if (mp.readu_u32)(l_7_26, 7) > 2147483647 then
                  break
                end
                if not l_7_10((mp.readu_u32)(l_7_26, 7), 16) then
                  break
                end
                -- DECOMPILER ERROR at PC241: Overwrote pending register: R22 in 'AssignReg'

                -- DECOMPILER ERROR at PC244: Confused about usage of register: R22 in 'UnsetPending'

                if (mp.readu_u32)(l_7_10((mp.readu_u32)(l_7_26, 7), 16), 5) == 0 or 0 then
                  do
                    do
                      if 0 == 0 then
                        break
                      end
                      -- DECOMPILER ERROR at PC248: Confused about usage of register: R22 in 'UnsetPending'

                      l_7_30 = l_7_16(0, 4, 8)
                      -- DECOMPILER ERROR at PC256: Confused about usage of register: R19 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC262: Confused about usage of register: R18 in 'UnsetPending'

                      if (mp.readu_u16)(l_7_26, 1) == 25420 then
                        local l_7_37 = nil
                        if not l_7_10(l_7_36 - 4, 16) then
                          break
                        end
                        -- DECOMPILER ERROR at PC273: Confused about usage of register: R18 in 'UnsetPending'

                        local l_7_38 = nil
                        if (mp.readu_u32)(l_7_10(l_7_36 - 4, 16), 1) + l_7_36 > 1.4073748835533e+14 then
                          break
                        end
                        -- DECOMPILER ERROR at PC278: Confused about usage of register: R21 in 'UnsetPending'

                        local l_7_39 = nil
                        if not l_7_10((mp.readu_u32)(l_7_10(l_7_36 - 4, 16), 1) + l_7_36, 16) then
                          break
                        end
                        local l_7_41, l_7_42 = nil
                        local l_7_43, l_7_44 = nil
                        if l_7_39 ~= l_7_15(l_7_10((mp.readu_u32)(l_7_10(l_7_36 - 4, 16), 1) + l_7_36, 16), 1) then
                          for l_7_48 = 16, 512, 16 do
                            local l_7_45, l_7_46, l_7_47, l_7_48 = (mp.bsplit)(l_7_39, 32), (mp.bsplit)(l_7_15(l_7_10((mp.readu_u32)(l_7_10(l_7_36 - 4, 16), 1) + l_7_36, 16), 1), 32)
                            do
                              do
                                if not l_7_10(l_7_42 + .end, 7) then
                                  break
                                end
                                for l_7_54 = 0, #l_7_43 - 1 do
                                  local l_7_53, l_7_54 = ""
                                  -- DECOMPILER ERROR at PC325: Confused about usage of register: R37 in 'UnsetPending'

                                  l_7_53 = l_7_53 .. (string.char)((mp.bitxor)((string.byte)(l_7_43, R37_PC325 + 1), (string.byte)(l_7_54, R37_PC325 % #l_7_54 + 1)))
                                end
                                -- DECOMPILER ERROR at PC339: Confused about usage of register: R32 in 'UnsetPending'

                                l_7_44 = l_7_15(l_7_53, 1)
                                l_7_47 = (mp.bsplit)(l_7_44, 32)
                                if l_7_46 == l_7_48 then
                                  break
                                end
                                -- DECOMPILER ERROR at PC353: LeaveBlock: unexpected jumping out DO_STMT

                              end
                            end
                          end
                          -- DECOMPILER ERROR at PC354: Confused about usage of register: R25 in 'UnsetPending'

                          if l_7_46 ~= l_7_48 then
                            break
                          end
                        end
                        l_7_30 = l_7_16(l_7_44, 8, 16)
                      end
                      if l_7_30 ~= "" then
                        break
                      end
                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC366: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    -- DECOMPILER ERROR at PC388: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC394: Confused about usage of register: R12 in 'UnsetPending'

    -- DECOMPILER ERROR at PC399: Confused about usage of register: R10 in 'UnsetPending'

    -- DECOMPILER ERROR at PC400: Confused about usage of register: R12 in 'UnsetPending'

    do
      do
        if ((mp.GetSMSProcArchitecture)() ~= mp.SMS_PROC_ARCH_X64 or (versioning.IsSeville)()) and #l_7_29 > 0 then
          local l_7_55, l_7_56 = nil
          if pcallEx("__patch_byte", l_7_17, l_7_29) then
            l_0_0("call to patch had no errors")
          else
            l_0_0("call to patch had errors")
          end
        end
        -- DECOMPILER ERROR at PC416: Confused about usage of register: R13 in 'UnsetPending'

        if l_7_16(l_7_0, 8, 16) ~= "" then
          local l_7_57, l_7_58 = nil
          if pcallEx("__get_c2server", l_7_14, l_7_16(l_7_0, 8, 16)) then
            for l_7_62 in (string.gmatch)(R17_PC424, "[^,]+") do
              local l_7_59, l_7_60, l_7_61, l_7_62 = nil
              -- DECOMPILER ERROR at PC428: Confused about usage of register: R19 in 'UnsetPending'

              -- DECOMPILER ERROR at PC437: Confused about usage of register: R19 in 'UnsetPending'

              if (string.byte)(l_7_40, 1) ~= 47 then
                AppendToRollingQueue("015b9d6d_" .. l_7_5, l_7_40)
              end
            end
          else
            l_0_0("unable to get c2server")
          end
          -- DECOMPILER ERROR at PC447: Confused about usage of register: R13 in 'UnsetPending'

          local l_7_63 = nil
          AppendToRollingQueue("mace_atosev", (MpCommon.Base64Encode)(l_7_60), 0, 60, 32, 1)
        end
        -- DECOMPILER ERROR at PC459: Confused about usage of register: R13 in 'UnsetPending'

        do return (MpCommon.Base64Encode)(l_7_60) end
        -- DECOMPILER ERROR at PC460: freeLocal<0 in 'ReleaseLocals'

        -- DECOMPILER ERROR: 32 unprocessed JMP targets
      end
    end
  end
end

maceExtract_SystemBC = function()
  -- function num : 0_7
  if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
    return mp.INFECTED
  end
  reportDetectedRegions()
  local l_8_0 = ((mp.hstr_full_log)())
  local l_8_1 = nil
  for l_8_5,l_8_6 in ipairs(l_8_0) do
    if l_8_6.matched then
      l_8_1 = (mp.ReadProcMem)(l_8_6.VA, 255)
      if l_8_1 == nil then
        return mp.INFECTED
      end
      if (string.find)(l_8_1, "BEGINDATA", 1, true) then
        do
          do
            local l_8_7 = (MpCommon.Base64Encode)("SYBC_" .. l_8_1)
            AppendToRollingQueue("mace_systembc", l_8_7, 0, 60, 32, 1)
            do break end
            -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC58: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  return mp.INFECTED
end

reportDetectedRegions = function(l_9_0)
  -- function num : 0_8
  if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
    return false
  end
  local l_9_1 = function(l_10_0)
    -- function num : 0_8_0
    local l_10_1 = (mp.GetScannedPPID)()
    local l_10_2 = (mp.GetSMSMemRanges)()
    local l_10_3 = 2097152
    local l_10_7 = function(l_11_0)
      -- function num : 0_8_0_0 , upvalues : l_10_2
      if not l_11_0 or l_11_0 < 0 then
        return nil
      end
      local l_11_1, l_11_2 = (mp.SMSVirtualQuery)(l_11_0)
      if not l_11_1 then
        return nil
      end
      local l_11_3 = l_10_2[l_11_2.found_ix]
      if not l_11_3 then
        return nil
      end
      return l_11_3
    end

    local l_10_8 = function(l_12_0, l_12_1)
      -- function num : 0_8_0_1 , upvalues : l_10_4
      if not l_12_0 or not l_12_1 then
        return false
      end
      if l_12_0 <= 0 or l_12_1 <= 0 then
        return false
      end
      local l_12_2 = l_10_4(l_12_0)
      if not l_12_2 then
        return false
      end
      do
        local l_12_3 = (mp.bitand)(l_12_2.prot, 255)
        if l_12_3 ~= 32 and l_12_3 ~= 64 and l_12_3 ~= 128 and l_12_3 ~= 8 and l_12_3 ~= 4 and l_12_3 ~= 2 then
          return false
        end
        do return l_12_2.addr < l_12_0 + l_12_1 and l_12_0 + l_12_1 <= l_12_2.addr + l_12_2.size end
        -- DECOMPILER ERROR: 1 unprocessed JMP targets
      end
    end

    local l_10_12 = function(l_13_0, l_13_1)
      -- function num : 0_8_0_2 , upvalues : l_10_5, l_10_3
      if not l_10_5(l_13_0, l_13_1) then
        return nil
      end
      local l_13_2 = 65536
      local l_13_3 = l_10_3
      local l_13_7 = l_13_3 < l_13_1 and l_13_3 or l_13_1
      for l_13_11 = 0, l_13_7, l_13_2 do
        local l_13_8 = ""
        -- DECOMPILER ERROR at PC20: Confused about usage of register: R9 in 'UnsetPending'

        -- DECOMPILER ERROR at PC23: Confused about usage of register: R10 in 'UnsetPending'

        do
          do
            local l_13_13 = nil
            if l_13_7 < R9_PC20 + l_13_2 and l_13_2 - (R9_PC20 + l_13_2 - l_13_7) or l_13_2 <= 0 then
              break
            end
            -- DECOMPILER ERROR at PC35: Confused about usage of register: R11 in 'UnsetPending'

            l_13_8 = l_13_8 .. (mp.ReadProcMem)(l_13_0 + l_13_12, l_13_7 < R9_PC20 + l_13_2 and l_13_2 - (R9_PC20 + l_13_2 - l_13_7) or l_13_2)
            -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
      -- DECOMPILER ERROR at PC39: Confused about usage of register: R5 in 'UnsetPending'

      return l_13_8
    end

    if not l_10_0 then
      for l_10_16,l_10_17 in ipairs((mp.hstr_full_log)()) do
        local l_10_13, l_10_14, l_10_15, l_10_16, l_10_17 = function(l_14_0)
      -- function num : 0_8_0_3
      local l_14_1 = (mp.bitand)(l_14_0, 4294967295)
      local l_14_2, l_14_3, l_14_4, l_14_5 = (mp.bsplit)(l_14_1, 8)
      return (string.char)(l_14_2) .. (string.char)(l_14_3) .. (string.char)(l_14_4) .. (string.char)(l_14_5)
    end
, function(l_15_0)
      -- function num : 0_8_0_4
      local l_15_1 = (mp.bitand)((mp.shr64)(l_15_0, 32), 4294967295)
      local l_15_2 = (mp.bitand)(l_15_0, 4294967295)
      local l_15_3, l_15_4, l_15_5, l_15_6 = (mp.bsplit)(l_15_2, 8)
      local l_15_7, l_15_8, l_15_9, l_15_10 = (mp.bsplit)(l_15_1, 8)
      return (string.char)(l_15_3) .. (string.char)(l_15_4) .. (string.char)(l_15_5) .. (string.char)(l_15_6) .. (string.char)(l_15_7) .. (string.char)(l_15_8) .. (string.char)(l_15_9) .. (string.char)(l_15_10)
    end
, function(l_16_0, l_16_1)
      -- function num : 0_8_0_5 , upvalues : l_10_8, l_10_7
      if not l_16_0 or not l_16_1 or l_16_1 == "" then
        return nil
      end
      if not l_16_0.addr or not l_16_0.size or not l_16_0.prot or not l_16_0.alloc_prot then
        return nil
      end
      local l_16_2 = "\027\127\238-" .. (string.char)((mp.GetSMSProcArchitecture)()) .. l_10_8(l_16_0.addr) .. l_10_7(l_16_0.size) .. l_10_7(l_16_0.alloc_prot) .. l_10_7(l_16_0.prot) .. l_10_7(#l_16_1) .. l_16_1
      if (versioning.GetEngineBuild)() >= 24030 then
        l_16_2 = (MpCommon.GzipCompress)(l_16_2)
      end
      return (MpCommon.Base64Encode)(l_16_2), #l_16_2
    end
, function(l_17_0)
      -- function num : 0_8_0_6 , upvalues : l_10_1, l_10_6, l_10_9
      local l_17_1 = 0
      local l_17_2 = (string.format)("DetectedRegions:%s", l_10_1)
      local l_17_3 = (string.format)("%x:%x", l_17_0.addr, l_17_0.size)
      if not IsKeyInRollingQueue(l_17_2, l_17_3, true) then
        local l_17_4 = l_10_6(l_17_0.addr, l_17_0.size)
        local l_17_5, l_17_6 = l_10_9(l_17_0, l_17_4)
        if l_17_5 ~= nil then
          l_17_1 = l_17_6
          AppendToRollingQueue(l_17_2, l_17_3, l_17_5)
        end
      end
      do
        return l_17_1
      end
    end
, function(l_18_0)
      -- function num : 0_8_0_7 , upvalues : l_10_4
      if not l_18_0 then
        return nil
      end
      local l_18_1 = 0
      local l_18_2 = {}
      -- DECOMPILER ERROR at PC7: No list found for R2 , SetList fails

      -- DECOMPILER ERROR at PC8: Overwrote pending register: R3 in 'AssignReg'

      local l_18_3 = l_18_0(l_18_0.addr - 1)
      while 1 do
        if l_18_3 then
          l_18_2[#l_18_2 + 1] = l_18_3
          l_18_3 = l_10_4(l_18_3.addr - 1)
          l_18_1 = l_18_1 + 1
        end
        if l_18_1 == 8 then
          break
        end
      end
      l_18_1 = 0
      local l_18_4 = l_10_4(l_18_0.addr + l_18_0.size + 1)
      while 1 do
        if l_18_4 then
          l_18_2[#l_18_2 + 1] = l_18_4
          l_18_4 = l_10_4(l_18_4.addr + l_18_4.size + 1)
          l_18_1 = l_18_1 + 1
        end
        if l_18_1 == 8 then
          break
        end
      end
      return l_18_2
    end

        -- DECOMPILER ERROR at PC34: Confused about usage of register: R17 in 'UnsetPending'

        if R17_PC34.matched then
          local l_10_18 = 0
          if l_10_7(R17_PC34.VA) then
            for l_10_23,l_10_24 in ipairs(l_10_17(l_10_7(R17_PC34.VA))) do
              local l_10_24 = nil
              -- DECOMPILER ERROR at PC50: Confused about usage of register: R24 in 'UnsetPending'

              local l_10_25 = nil
              if l_10_3 <= l_10_18 + l_10_16(R24_PC50) then
                break
              end
              l_10_18 = l_10_18 + l_10_16(R24_PC50)
            end
            break
          end
        end
      end
    else
      do
        for l_10_29,l_10_30 in ipairs(l_10_0) do
          local l_10_26, l_10_27, l_10_28, l_10_29, l_10_30 = nil
          -- DECOMPILER ERROR at PC68: Confused about usage of register: R17 in 'UnsetPending'

          local l_10_31 = nil
          -- DECOMPILER ERROR at PC78: Unhandled construct in 'MakeBoolean' P1

          if l_10_7(l_10_23) and l_10_3 <= l_10_31 + l_10_29(l_10_7(l_10_23)) then
            break
          end
          l_10_31 = l_10_31 + l_10_29(l_10_7(l_10_23))
        end
        do
          do
            -- DECOMPILER ERROR at PC89: Confused about usage of register: R12 in 'UnsetPending'

            ;
            (MpCommon.BmTriggerSig)(l_10_1, "RegionsCollected", (string.format)("%d", l_10_31))
            -- DECOMPILER ERROR at PC92: freeLocal<0 in 'ReleaseLocals'

          end
        end
      end
    end
  end

  local l_9_2 = pcall
  local l_9_3 = l_9_1
  do
    local l_9_4 = l_9_0
    do return l_9_2(l_9_3, l_9_4) end
    -- DECOMPILER ERROR at PC15: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

getDetectedRegions = function()
  -- function num : 0_9
  local l_10_0 = (mp.GetSMSMemRanges)()
  local l_10_1 = {}
  for l_10_5,l_10_6 in ipairs((mp.hstr_full_log)()) do
    if l_10_6.matched then
      for l_10_10,l_10_11 in ipairs(l_10_6.VA_all) do
        local l_10_12, l_10_13 = (mp.SMSVirtualQuery)(l_10_11)
        if l_10_12 then
          local l_10_14 = l_10_0[l_10_13.found_ix]
          if l_10_14 and l_10_1[l_10_14.addr] == nil then
            l_10_1[l_10_14.addr] = l_10_14
          end
        end
      end
    end
  end
  return l_10_1
end

CmdReportParent = function(l_11_0)
  -- function num : 0_10
  local l_11_1 = (mp.getfilename)()
  if l_11_1 ~= nil then
    l_11_1 = (string.lower)(l_11_1)
    local l_11_2 = l_11_1:match("([^\\]+)$")
    if l_11_2 ~= nil and l_11_2 ~= "powershell.exe" and l_11_2 ~= "cmd.exe" and l_11_2 ~= "7zg.exe" and l_11_2 ~= "autoconv.exe" and l_11_2 ~= "robocopy.exe" and l_11_2 ~= "wscript.exe" and l_11_2 ~= "cscript.exe" and l_11_2 ~= "skypeapp.exe" and l_11_2 ~= "ctregsvr.exe" and l_11_2 ~= "reg.exe" and l_11_2 ~= "regedt32.exe" and l_11_2 ~= "regsvr32.exe" and l_11_2 ~= "mpcmdrun.exe" then
      return true
    end
  end
  do
    local l_11_3 = (mp.GetParentProcInfo)()
    if l_11_3 == nil then
      return false
    end
    local l_11_4 = l_11_3.image_path
    if l_11_4 == nil then
      return false
    end
    l_11_4 = (string.lower)(l_11_4)
    local l_11_5 = l_11_4:match("([^\\]+)$")
    if l_11_5 == nil then
      return false
    end
    if l_11_5 == "powershell.exe" or l_11_5 == "cmd.exe" or l_11_5 == "7zg.exe" or l_11_5 == "autoconv.exe" or l_11_5 == "robocopy.exe" or l_11_5 == "wscript.exe" or l_11_5 == "cscript.exe" or l_11_5 == "skypeapp.exe" or l_11_5 == "ctregsvr.exe" or l_11_5 == "reg.exe" or l_11_5 == "regedt32.exe" or l_11_5 == "regsvr32.exe" or l_11_5 == "mpcmdrun.exe" then
      return false
    end
    ;
    (mp.ReportLowfi)(l_11_4, l_11_0)
    return true
  end
end

candidatePeFile = function()
  -- function num : 0_11
  local l_12_0 = (mp.getfilesize)()
  if l_12_0 > 4000000 or l_12_0 < 4000 then
    return false
  end
  if (mp.get_mpattribute)("PEPCODE:HasDigitalSignature") then
    return false
  end
  if (mp.get_mpattribute)("pea_ismsil") then
    return false
  end
  local l_12_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_12_1:find("program files", 1, true) then
    return false
  end
  if l_12_1:find("system32", 1, true) then
    return false
  end
  if l_12_1:find("syswow64", 1, true) then
    return false
  end
  if l_12_1:find("winsxs", 1, true) then
    return false
  end
  return true
end

getScannedRegions = function(l_13_0, l_13_1)
  -- function num : 0_12
  local l_13_2 = (MpCommon.GetCurrentTimeT)()
  if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
    return 1
  end
  local l_13_3 = (mp.GetScannedPPID)()
  local l_13_4 = (mp.GetSMSMemRanges)()
  local l_13_5 = 0
  local l_13_6 = 0
  local l_13_7 = 0
  local l_13_8 = {}
  l_13_8.ppid = l_13_3
  l_13_8.arch = (mp.GetSMSProcArchitecture)()
  l_13_8.sig_matched = l_13_0
  l_13_8.scan_count = 0
  l_13_8.scan_time_diff = 0
  l_13_8.nRegions = 0
  l_13_8.nCollectedRegions = 0
  l_13_8.regions = {}
  l_13_8.nThreads = 0
  l_13_8.nCollectedThreads = 0
  l_13_8.threads = {}
  local l_13_9 = false
  local l_13_10 = "getScannedRegions_" .. l_13_3
  local l_13_11 = 1
  local l_13_12 = GetRollingQueueKeyValue(l_13_10, "scan_count")
  if l_13_12 then
    l_13_11 = l_13_12 + 1
    local l_13_13 = GetRollingQueueKeyValue(l_13_1, "start_time_procdump_a")
    local l_13_14 = l_13_2 - l_13_13
    l_13_8.scan_time_diff = l_13_14
    if l_13_11 == 2 and l_13_14 < 10 then
      return 4
    else
      if l_13_11 >= 3 then
        return 5
      end
    end
    l_13_9 = true
  end
  do
    AppendToRollingQueue(l_13_10, "scan_count", l_13_11)
    l_13_8.scan_count = l_13_11
    for l_13_18,l_13_19 in ipairs(l_13_4) do
      l_13_5 = l_13_5 + 1
      if l_13_6 < 150 then
        if not l_13_19.addr or not l_13_19.size or not l_13_19.prot or not l_13_19.alloc_prot or not l_13_19.state_type or not l_13_19.flags then
          return 3
        end
        if (mp.bitand)(l_13_19.state_type, mp.SMS_MBI_IMAGE) == 0 and (mp.bitand)(l_13_19.state_type, mp.SMS_MBI_MAPPED) == 0 then
          local l_13_20 = l_13_8.regions
          local l_13_21 = #l_13_8.regions + 1
          local l_13_22 = {}
          l_13_22.addr = l_13_19.addr
          l_13_22.size = l_13_19.size
          l_13_22.alloc_prot = l_13_19.alloc_prot
          l_13_22.prot = l_13_19.prot
          l_13_22.state_type = l_13_19.state_type
          l_13_22.flags = l_13_19.flags
          l_13_20[l_13_21] = l_13_22
          l_13_6 = l_13_6 + 1
        end
      end
    end
    l_13_8.nRegions = l_13_5
    l_13_8.nCollectedRegions = l_13_6
    local l_13_23, l_13_24 = (mp.GetSMSThreadInfo)()
    for l_13_28,l_13_29 in pairs(l_13_23) do
      if l_13_7 < l_13_24 and l_13_7 < 20 then
        do
          if (mp.GetSMSMappedFilename)(l_13_29.StartAddr) == nil then
            local l_13_30 = ""
          end
          local l_13_31 = nil
          local l_13_32 = l_13_8.threads
          do
            local l_13_33 = #l_13_8.threads + 1
            l_13_32[l_13_33] = {ptid = l_13_29.PTID, creator_ptid = l_13_29.CreatorPTID, start_addr = l_13_29.StartAddr, mod_path = l_13_31}
            l_13_7 = l_13_7 + 1
            -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    l_13_8.nThreads = l_13_24
    l_13_8.nCollectedThreads = l_13_7
    local l_13_34 = (MpCommon.JsonSerialize)(l_13_8)
    local l_13_35 = (MpCommon.Base64Encode)(l_13_34)
    AppendToRollingQueue(l_13_1, "data", l_13_35)
    local l_13_36 = "memRegionsMetadata_" .. l_13_11
    ;
    (MpCommon.BmTriggerSig)(l_13_3, l_13_36, (string.format)("nCollectedRegions %d", l_13_6))
    return 0
  end
end

verify_non_prod_rings = function()
  -- function num : 0_13
  if (versioning.GetEngineRing)() < 5 then
    return true
  end
  return false
end


