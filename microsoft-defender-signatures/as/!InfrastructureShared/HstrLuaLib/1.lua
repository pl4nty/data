-- Threat: !InfrastructureShared
-- Name: HstrLuaLib
-- Type: 1
-- Includes: LuaFuncHelper

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

-- [unluac error] diagnostic pseudocode: recovery errors; output may not recompile or preserve behavior

local function r0_0(p1_0)
  local r1_0 = "RdTrace"
  local r1_1 = string.format("%x", crypto.CRC32Buffer(-1, p1_0, 0, #p1_0))
  AppendToRollingQueue(r1_0, r1_1, 0, 120, 32, 1)
end

function getTamperProtectionState()
  local r2_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features")
  if r2_0 then
    local r2_1 = sysio.GetRegValueAsDword(r2_0, "TamperProtection")
    if r2_1 then
      return r2_1
    end
  end
  return nil
end

function isTamperProtectionOn()
  local r3_0 = getTamperProtectionState()
  if r3_0 then
    if mp.bitand(r3_0, 1) == 1 then
      return true, r3_0
    end
    return false, r3_0
  end
  return nil
end

function checkIfCertificateHit()
  local r4_0 = mp.get_mpattributevalue("RPF:MpCertVA")
  if r4_0 == nil then
    return false
  end
  local r4_1 = mp.get_mpattributevalue("RPF:MpCertSz")
  local r4_2 = mp.hstr_full_log()
  for r4_3, r4_4 in pairs(r4_2) do
    if r4_4.matched and r4_4.VA and r4_4.VA > r4_0 and r4_4.VA < r4_0 + r4_1 then
      return true
    end
  end
  return false
end

function isSafeToRead(p5_0, p5_1, p5_2)
  if p5_1 and p5_2 then
    if not (p5_1 <= 0) and not (p5_2 <= 0) then
      local r5_0, r5_1 = mp.SMSVirtualQuery(p5_1)
      if r5_0 then
        local r5_2 = p5_0[r5_1.found_ix]
        if r5_2 then
          local r5_3 = mp.bitand(r5_2.prot, 255)
          if r5_3 == 32 or r5_3 == 64 or r5_3 == 128 or r5_3 == 8 or r5_3 == 4 or r5_3 == 2 then
            return p5_1 + p5_2 > r5_2.addr and p5_1 + p5_2 <= r5_2.addr + r5_2.size
          end
          return false
        end
        return false
      end
      return false
    end
    return false
  end
  return false
end

function maceExtract_ZLoader()
  if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
    local function r6_0(p7_0)
      p7_0 = mp.bitand(p7_0, 4294967295)
      local r7_0, r7_1, r7_2, r7_3 = mp.bsplit(p7_0, 8)
      return string.char(r7_0) .. string.char(r7_1) .. string.char(r7_2) .. string.char(r7_3)
    end

    local function r6_1(p8_0, p8_1)
      local r8_0 = ""
      for r8_1 = p8_1, #p8_0 do
        if string.byte(p8_0, r8_1) < 32 or string.byte(p8_0, r8_1) > 126 then
          break
        end
        r8_0 = r8_0 .. string.char(string.byte(p8_0, r8_1))
      end
      return r8_0
    end

    local r6_2 = mp.hstr_full_log()
    local r6_3 = ""
    for r6_4, r6_5 in ipairs(r6_2) do
      if r6_5.matched then
        local r6_6 = mp.ReadProcMem(r6_5.VA, 80)
        if not r6_6 then
          return mp.INFECTED
        end
        local r6_7 = mp.readu_u16(r6_6, 1)
        if r6_7 == 50307 then
          local r6_8, r6_9, r6_10
          r6_8, r6_9, r6_10 = MpCommon.BinaryRegExpSearch("\\x83\\xC4\\x04\\x84\\xC0\\x74.\\xE8....\\xE8....\\xE8....\\xE8....[\\x00-\\x67\\x69-\\xFF]+\\x68(....)\\x68(....)",
            r6_6)
          if not r6_8 then
            break
          end
          r6_9 = mp.readu_u32(r6_9, 1)
          r6_10 = mp.readu_u32(r6_10, 1)
          local r6_11, r6_12 = mp.bsplit(r6_9, 16)
          local r6_13, r6_14 = mp.bsplit(r6_10, 16)
          if r6_12 == r6_14 then
            local r6_15 = mp.ReadProcMem(r6_9, 48)
            if r6_15 then
              local r6_16 = r6_1
              r6_16 = r6_16(r6_15, 1)
              if #r6_16 == 0 or #r6_16 == 48 then
                return mp.INFECTED
              end
              local r6_17 = mp.ReadProcMem(r6_10, 880)
              if r6_17 then
                r6_3 = "ZLOA" .. r6_0(#r6_16) .. r6_16 .. r6_0(#r6_17) .. r6_17
                r6_3 = MpCommon.Base64Encode(r6_3)
                break
              end
              return mp.INFECTED
            end
            return mp.INFECTED
          end
          return mp.INFECTED
        end
      end
    end
    if r6_3 ~= "" then
      local r6_18 = "mace_zloader"
      AppendToRollingQueue(r6_18, r6_3, 0, 60, 32, 1)
    end
    return mp.INFECTED
  end
  return mp.INFECTED
end

function maceExtract_CobaltStrike(p9_0)
  if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
    return
  end
  local r9_0 = mp.GetSMSProcArchitecture() == mp.SMS_PROC_ARCH_X64
  local r9_1 = mp.GetScannedPPID()
  local r9_2 = mp.GetSMSMemRanges()

  local function r9_3(p10_0, p10_1)
    if p10_0 and p10_1 then
      if not (p10_0 <= 0) and not (p10_1 <= 0) then
        local r10_0, r10_1 = mp.SMSVirtualQuery(p10_0)
        if r10_0 then
          local r10_2 = r9_2[r10_1.found_ix]
          if r10_2 then
            local r10_3 = mp.bitand(r10_2.prot, 255)
            if r10_3 == 32 or r10_3 == 64 or r10_3 == 128 or r10_3 == 8 or r10_3 == 4 then
              return p10_0 + p10_1 > r10_2.addr and p10_0 + p10_1 <= r10_2.addr + r10_2.size
            end
            return false
          end
          return false
        end
        return false
      end
      return false
    end
    return false
  end

  local function r9_4(p11_0, p11_1)
    if r9_3(p11_0, p11_1) then
      return mp.ReadProcMem(p11_0, p11_1)
    end
    return nil
  end

  local function r9_5(p12_0)
    local r12_0, r12_1 = "", 0
    if p12_0 and #p12_0 ~= 0 then
      local r12_2
      if string.byte(p12_0, 1) == 0 then
        r12_2 = "([\\x00-\\xFF]+)\\x00\\x25\\x00\\x02\\x00\\x04"
      elseif string.byte(p12_0, 1) == 46 then
        r12_2, r12_1 = "([\\x00-\\xFF]+)\\x2e\\x0b\\x2e\\x2c\\x2e\\x2a", 46
      elseif string.byte(p12_0, 1) == 105 then
        r12_2, r12_1 = "([\\x00-\\xFF]+)\\x69\\x4c\\x69\\x6b\\x69\\x6d", 105
      else
        if string.byte(p12_0, 1) ~= 78 then
          return -1
        end
        r12_2, r12_1 = "([\\x00-\\xFF]+)\\x4e\\x6b\\x4e\\x4c\\x4e\\x4a", 78
      end
      if r12_2 == "" then
        return -1
      end
      local r12_3, r12_4 = MpCommon.BinaryRegExpSearch(r12_2, p12_0)
      if r12_3 then
        local r12_5 = #r12_4 + 6 + 1
        local r12_6 = r12_5 + 4
        if #p12_0 < r12_6 then
          return -1
        end
        local r12_7 = string.char(mp.bitxor(string.byte(p12_0, r12_5 + 3), r12_1))
        local r12_8 = string.char(mp.bitxor(string.byte(p12_0, r12_5 + 2), r12_1))
        local r12_9 = string.char(mp.bitxor(string.byte(p12_0, r12_5 + 1), r12_1))
        local r12_10 = string.char(mp.bitxor(string.byte(p12_0, r12_5 + 0), r12_1))
        r12_7 = r12_7 .. r12_8 .. r12_9 .. r12_10
        r12_8 = mp
        r12_8 = r12_8.readu_u32
        r12_9 = r12_7
        r12_10 = 1
        return r12_8(r12_9, r12_10)
      end
      return -1
    end
    return -1
  end

  local function r9_6(p13_0)
    local r13_0, r13_1 = "", 0
    if p13_0 and #p13_0 ~= 0 then
      local r13_2
      if string.byte(p13_0, 1) == 0 then
        r13_2 = "([\\x00-\\xFF]+)\\x00\\x08\\x00\\x03\\x01\\x00"
      elseif string.byte(p13_0, 1) == 46 then
        r13_2, r13_1 = "([\\x00-\\xFF]+)\\x2e\\x26\\x2e\\x2d\\x2f\\x2e", 46
      elseif string.byte(p13_0, 1) == 105 then
        r13_2, r13_1 = "([\\x00-\\xFF]+)\\x69\\x61\\x69\\x6a\\x68\\x69", 105
      else
        if string.byte(p13_0, 1) ~= 78 then
          return nil
        end
        r13_2, r13_1 = "([\\x00-\\xFF]+)\\x4e\\x46\\x4e\\x4d\\x4f\\x4e", 78
      end
      if r13_2 == "" then
        return nil
      end
      local r13_3, r13_4 = MpCommon.BinaryRegExpSearch(r13_2, p13_0)
      if r13_3 then
        local r13_5 = #r13_4 + 6 + 1
        local r13_6 = r13_5 + 4
        if #p13_0 < r13_6 then
          return nil
        end
        local r13_7 = ""
        local r13_8 = #p13_0
        for r13_9 = r13_5, r13_8 do
          local r13_10 = mp.bitxor(string.byte(p13_0, r13_9), r13_1)
          if r13_10 == 0 then
            break
          end
          local r13_11 = r13_7
          r13_7 = r13_11 .. string.char(r13_10)
        end
        return r13_7
      end
      return nil
    end
    return nil
  end

  local function r9_7(p14_0, p14_1)
    local r14_0 = string.byte(p14_0, p14_1)
    local r14_1 = string.byte(p14_0, p14_1 + 1)
    local r14_2 = string.byte(p14_0, p14_1 + 2)
    local r14_3 = string.byte(p14_0, p14_1 + 3)
    local r14_4 = string.byte(p14_0, p14_1 + 4)
    local r14_5 = string.byte(p14_0, p14_1 + 5)
    local r14_6 = string.byte(p14_0, p14_1 + 6)
    local r14_7 = string.byte(p14_0, p14_1 + 7)
    return r14_0 + r14_1 * 256 + r14_2 * 65536 + r14_3 * 16777216 + r14_4 * 4294967296 + r14_5
      * 1099511627776 + r14_6 * 281474976710656 + r14_7 * 72057594037927936
  end

  local function r9_8(p15_0, p15_1, p15_2)
    local r15_0 = ""
    local r15_1 = r9_4(p15_0, p15_1 * 128)
    if r15_1 then
      local r15_2, r15_3, r15_4 = 1, 2, 3
      local r15_5 = {
        { pos = 1, fieldType = r15_2, size = 2 }, { pos = 2, fieldType = r15_2, size = 2 },
        { pos = 3, fieldType = r15_3, size = 4 }, { pos = 4, fieldType = r15_3, size = 4 },
        { pos = 5, fieldType = r15_2, size = 2 }, { pos = 6, fieldType = r15_2, size = 2 },
        { pos = 7, fieldType = r15_4, size = 256 }, { pos = 8, fieldType = r15_4, size = 256 },
        { pos = 9, fieldType = r15_4, size = 128 }, { pos = 10, fieldType = r15_4, size = 64 },
        { pos = 11, fieldType = r15_4, size = 256 }, { pos = 12, fieldType = r15_4, size = 256 },
        { pos = 13, fieldType = r15_4, size = 256 }, { pos = 14, fieldType = r15_4, size = 16 },
        { pos = 15, fieldType = r15_4, size = 128 }, { pos = 19, fieldType = r15_3, size = 4 },
        { pos = 20, fieldType = r15_3, size = 4 }, { pos = 21, fieldType = r15_4, size = 256 },
        { pos = 22, fieldType = r15_2, size = 2 }, { pos = 23, fieldType = r15_4, size = 128 },
        { pos = 24, fieldType = r15_4, size = 128 }, { pos = 25, fieldType = r15_4, size = 6144 },
        { pos = 26, fieldType = r15_4, size = 16 }, { pos = 27, fieldType = r15_4, size = 16 },
        { pos = 28, fieldType = r15_3, size = 4 }, { pos = 29, fieldType = r15_4, size = 64 },
        { pos = 30, fieldType = r15_4, size = 64 }, { pos = 31, fieldType = r15_3, size = 4 },
        { pos = 32, fieldType = r15_4, size = 128 }, { pos = 33, fieldType = r15_4, size = 64 },
        { pos = 34, fieldType = r15_4, size = 64 }, { pos = 35, fieldType = r15_2, size = 2 },
        { pos = 37, fieldType = r15_3, size = 4 }, { pos = 38, fieldType = r15_2, size = 2 },
        { pos = 39, fieldType = r15_2, size = 2 }, { pos = 40, fieldType = r15_3, size = 4 },
        { pos = 43, fieldType = r15_2, size = 2 }, { pos = 44, fieldType = r15_2, size = 2 },
        { pos = 45, fieldType = r15_3, size = 4 }, { pos = 46, fieldType = r15_4, size = 256 },
        { pos = 47, fieldType = r15_4, size = 256 }, { pos = 51, fieldType = r15_4, size = 128 },
        { pos = 52, fieldType = r15_2, size = 2 }, { pos = 50, fieldType = r15_2, size = 2 },
        { pos = 54, fieldType = r15_4, size = 128 }
      }
      for r15_6, r15_7 in ipairs(r15_5) do
        local r15_8, r15_9 = mp.bsplit(r15_7.size, 8)
        local r15_10 = r15_7.pos * p15_2 + 1
        local r15_11 = r15_10 + p15_1
        local r15_12 = "\000" .. string.char(r15_7.pos) .. "\000" .. string.char(r15_7.fieldType)
          .. string.char(r15_9) .. string.char(r15_8)
        local r15_13 = string
        r15_13 = r15_13.byte
        local r15_14 = r15_1
        local r15_15 = r15_10
        r15_13 = r15_13(r15_14, r15_15)
        if r15_13 == r15_7.fieldType then
          if r15_7.fieldType == r15_4 then
            local r15_16 = 0
            if p15_1 == 4 then
              local r15_17 = mp.readu_u32(r15_1, r15_11)
              r15_13 = r15_17
            else
              local r15_18 = r9_7(r15_1, r15_11)
              r15_13 = r15_18
            end
            if r15_13 ~= 0 then
              local r15_19 = r9_4(r15_13, r15_7.size)
              if not r15_19 then
                return ""
              end
              local r15_20, r15_21 = r15_0, r15_12
              local r15_22 = r15_20 .. r15_21
              r15_20 = r15_22
              r15_21 = r15_19
              r15_0 = r15_20 .. r15_21
            end
          else
            local r15_23, r15_24 = string.sub, r15_1
            r15_15 = r15_11
            local r15_25 = r15_7.size
            r15_23 = r15_23(r15_24, r15_15, r15_11 + (r15_25 - 1))
            r15_24 = r15_0
            local r15_26 = r15_12
            local r15_27 = r15_24 .. r15_26
            r15_24 = r15_27
            r15_26 = string
            r15_0 = r15_24 .. r15_26.reverse(r15_23)
          end
        end
      end
      return r15_0
    end
    return ""
  end

  local function r9_9(p16_0)
    r0_0("patch started")
    local r16_0 = { 189 }
    local r16_1 = { 27 }
    local r16_2 = r9_0 and r16_0 or r16_1
    for r16_3, r16_4 in ipairs(p16_0) do
      for r16_5, r16_6 in ipairs(r16_2) do
        local r16_7 = r16_4 + r16_6
        local r16_8 = r9_4(r16_7, 4)
        if not r16_8 then
          return
        end
        if string.byte(r16_8, 1) == 117 then
          mp.WriteProcByte(r16_7, 116)
          r0_0("patch completed")
          AppendToRollingQueue("82e27b72_" .. r9_1, "true")
        else
          r0_0("patch failed.")
          local r16_9
          if r16_6 == 189 then
            r16_9 = r9_4(r16_7 - 32, 48)
          elseif r16_6 == 27 then
            r16_9 = r9_4(r16_7 - 9, 15)
          else
            r16_9 = nil
          end
          AppendToRollingQueue("82e27b72_" .. r9_1, MpCommon.Base64Encode(r16_9))
        end
      end
    end
  end

  local r9_10 = mp.hstr_full_log()
  local r9_11 = {}
  local r9_12 = ""
  if p9_0 then
    if mp.GetSMSProcArchitecture() == mp.SMS_PROC_ARCH_X64 then
      r9_12 = r9_8(p9_0, 8, 16)
    else
      r9_12 = r9_8(p9_0, 4, 8)
    end
  else
    local r9_13 = {}
    for r9_14, r9_15 in ipairs(r9_10) do
      if r9_15.matched then
        local r9_16 = r9_4(r9_15.VA, 16)
        if r9_16 == nil then
          return
        end
        r9_13[r9_15.VA] = r9_16
        if mp.readu_u16(r9_16, 1) == 55925 or mp.readu_u16(r9_16, 1) == 25420 then
          for r9_17, r9_18 in ipairs(r9_15.VA_all) do
            table.insert(r9_11, r9_18)
          end
        end
      end
    end
    for r9_19, r9_20 in pairs(r9_13) do
      if mp.readu_u16(r9_20, 1) == 256
        or mp.readu_u16(r9_20, 1) == 26729
        or mp.readu_u16(r9_20, 1) == 12078
        or mp.readu_u16(r9_20, 1) == 20302 then
        local r9_21 = 0
        local r9_22 = mp.readu_u16(r9_20, 1)
        local r9_23
        if r9_22 == 256 then
          r9_23 = r9_19 - 1
        else
          r9_23 = r9_19
        end
        r9_22 = r9_4
        r9_12 = r9_22(r9_23, 4096)
        r9_12 = r9_12 or ""
      elseif mp.readu_u16(r9_20, 1) == 55925 then
        local r9_24 = mp.readu_u32(r9_20, 7)
        if r9_24 > 2147483647 then
          break
        end
        local r9_25 = r9_4(r9_24, 16)
        if not r9_25 then
          break
        end
        local r9_26 = 0
        if mp.readu_u32(r9_25, 5) ~= 0 then
          r9_25 = string.char(mp.bitxor(string.byte(r9_25, 1), string.byte(r9_25, 5)))
            .. string.char(mp.bitxor(string.byte(r9_25, 2), string.byte(r9_25, 6)))
            .. string.char(mp.bitxor(string.byte(r9_25, 3), string.byte(r9_25, 7)))
            .. string.char(mp.bitxor(string.byte(r9_25, 4), string.byte(r9_25, 8)))
        end
        local r9_27 = mp.readu_u32(r9_25, 1)
        r9_26 = r9_27
        if not r9_26 or r9_26 == 0 then
          break
        end
        r9_12 = r9_8(r9_26, 4, 8)
      elseif mp.readu_u16(r9_20, 1) == 25420 then
        local r9_28 = r9_4(r9_19 - 4, 16)
        if not r9_28 then
          break
        end
        local r9_29 = mp.readu_u32(r9_28, 1) + r9_19
        if r9_29 > 140737488355327 then
          break
        end
        local r9_30 = r9_4(r9_29, 16)
        if not r9_30 then
          break
        end
        local r9_31 = r9_7(r9_30, 1)
        local r9_32, r9_33 = mp.bsplit(r9_19, 32)
        local r9_34, r9_35 = mp.bsplit(r9_31, 32)
        if r9_33 ~= r9_35 then
          for r9_36 = 16, 512, 16 do
            local r9_37 = ""
            local r9_38 = r9_4
            r9_38 = r9_38(r9_29 + r9_36, 7)
            if not r9_38 then
              break
            end
            for r9_39 = 0, #r9_30 - 1 do
              r9_37 = r9_37
                .. string.char(mp.bitxor(string.byte(r9_30, r9_39 + 1),
                    string.byte(r9_38, r9_39 % #r9_38 + 1)))
            end
            r9_31 = r9_7(r9_37, 1)
            local r9_40, r9_41 = mp.bsplit(r9_31, 32)
            r9_35 = r9_41
            if r9_33 == r9_35 then
              break
            end
          end
          if r9_33 ~= r9_35 then
            break
          end
        end
        r9_12 = r9_8(r9_31, 8, 16)
      end
      if r9_12 ~= "" then
        break
      end
    end
  end
  if versioning.IsSeville() and #r9_11 > 0 then
    local r9_42, r9_43 = pcallEx("__patch_byte", r9_9, r9_11)
    if r9_42 then
      r0_0("call to patch had no errors")
    else
      r0_0("call to patch had errors")
    end
  end
  if r9_12 ~= "" then
    local r9_44, r9_45 = pcallEx("__get_c2server", r9_6, r9_12)
    if r9_44 then
      for r9_46 in string.gmatch(r9_45, "[^,]+") do
        if string.byte(r9_46, 1) ~= 47 then
          AppendToRollingQueue("015b9d6d_" .. r9_1, r9_46)
        end
      end
    else
      r0_0("unable to get c2server")
    end
    r9_12 = MpCommon.Base64Encode(r9_12)
    local r9_47 = "mace_atosev"
    AppendToRollingQueue(r9_47, r9_12, 0, 60, 32, 1)
  end
  return r9_12
end

function maceExtract_SystemBC()
  if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
    reportDetectedRegions()
    local r17_0 = mp.hstr_full_log()
    local r17_1 = nil
    for r17_2, r17_3 in ipairs(r17_0) do
      if r17_3.matched then
        r17_1 = mp.ReadProcMem(r17_3.VA, 255)
        if r17_1 == nil then
          return mp.INFECTED
        end
        if string.find(r17_1, "BEGINDATA", 1, true) then
          local r17_4 = MpCommon.Base64Encode("SYBC_" .. r17_1)
          AppendToRollingQueue("mace_systembc", r17_4, 0, 60, 32, 1)
          break
        end
      end
    end
    return mp.INFECTED
  end
  return mp.INFECTED
end

function reportDetectedRegions(p18_0)
  if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
    local function r18_0(p19_0)
      -- [unluac error] proto#19 failed during structure: invalid structure plan: phi5 has conflicting canonical loop targets
      -- last completed stage: dataflow
      -- dataflow proto#19 blocks=19 defs=69 open-defs=2 phis=6
      --   @000 block=#0 get-table r1 <- env[k0] reads=[-] writes=[r1]
      --   @001 block=#0 get-table r1 <- r1[k1] reads=[r1] writes=[r1]
      --   @002 block=#0 call(normal) r1 args=fixed(r2..(empty)) results=fixed(r1) reads=[r1] writes=[r1]
      --   @003 block=#0 get-table r2 <- env[k0] reads=[-] writes=[r2]
      --   @004 block=#0 get-table r2 <- r2[k2] reads=[r2] writes=[r2]
      --   @005 block=#0 call(normal) r2 args=fixed(r3..(empty)) results=fixed(r2) reads=[r2] writes=[r2]
      --   @006 block=#0 load-const r3 <- k3 reads=[-] writes=[r3]
      --   @007 block=#0 closure r4 <- proto#0 captures=[ref(r2)] reads=[r2] writes=[r4]
      --   @008 block=#0 closure r5 <- proto#1 captures=[ref(r4)] reads=[r4] writes=[r5]
      --   @009 block=#0 closure r6 <- proto#2 captures=[ref(r5), ref(r3)] reads=[r3, r5] writes=[r6]
      --   @010 block=#0 closure r7 <- proto#3 captures=[] reads=[-] writes=[r7]
      --   @011 block=#0 closure r8 <- proto#4 captures=[] reads=[-] writes=[r8]
      --   @012 block=#0 closure r9 <- proto#5 captures=[ref(r8), ref(r7)] reads=[r7, r8] writes=[r9]
      --   @013 block=#0 closure r10 <- proto#6 captures=[ref(r1), ref(r6), ref(r9)] reads=[r1, r6, r9] writes=[r10]
      --   @014 block=#0 closure r11 <- proto#7 captures=[ref(r4)] reads=[r4] writes=[r11]
      --   @015 block=#0 load-const r12 <- k4 reads=[-] writes=[r12]
      --   @016 block=#0 branch if truthy r0 then @49 else @17 reads=[r0] writes=[-]
      --   @017 block=#1 get-table r13 <- env[k5] reads=[-] writes=[r13]
      --   @018 block=#1 get-table r14 <- env[k0] reads=[-] writes=[r14]
      --   @019 block=#1 get-table r14 <- r14[k6] reads=[r14] writes=[r14]
      --   @020 block=#1 call(normal) r14 args=fixed(r15..(empty)) results=open(r14) reads=[r14] writes=[-]
      --   @021 block=#1 call(normal) r13 args=open(r14) results=fixed(r13..r15) reads=[r13] writes=[r13, r14, r15]
      --   @022 block=#1 jump @46 reads=[-] writes=[-]
      --   @023 block=#2 get-table r18 <- r17[k7] reads=[r17] writes=[r18]
      --   @024 block=#2 branch if not (truthy r18) then @46 else @25 reads=[r18] writes=[-]
      --   @025 block=#3 move r18 <- r4 reads=[r4] writes=[r18]
      --   @026 block=#3 get-table r19 <- r17[k8] reads=[r17] writes=[r19]
      --   @027 block=#3 call(normal) r18 args=fixed(r19) results=fixed(r18) reads=[r18, r19] writes=[r18]
      --   @028 block=#3 branch if not (truthy r18) then @46 else @29 reads=[r18] writes=[-]
      --   @029 block=#4 move r19 <- r11 reads=[r11] writes=[r19]
      --   @030 block=#4 move r20 <- r18 reads=[r18] writes=[r20]
      --   @031 block=#4 call(normal) r19 args=fixed(r20) results=fixed(r19) reads=[r19, r20] writes=[r19]
      --   @032 block=#4 get-table r20 <- env[k5] reads=[-] writes=[r20]
      --   @033 block=#4 move r21 <- r19 reads=[r19] writes=[r21]
      --   @034 block=#4 call(normal) r20 args=fixed(r21) results=fixed(r20..r22) reads=[r20, r21] writes=[r20, r21, r22]
      --   @035 block=#4 jump @43 reads=[-] writes=[-]
      --   @036 block=#5 move r25 <- r10 reads=[r10] writes=[r25]
      --   @037 block=#5 move r26 <- r24 reads=[r24] writes=[r26]
      --   @038 block=#5 call(normal) r25 args=fixed(r26) results=fixed(r25) reads=[r25, r26] writes=[r25]
      --   @039 block=#5 add r26 <- r12, r25 reads=[r12, r25] writes=[r26]
      --   @040 block=#5 branch if not (le r3, r26) then @42 else @41 reads=[r3, r26] writes=[-]
      --   @041 block=#6 jump @66 reads=[-] writes=[-]
      --   @042 block=#7 add r12 <- r12, r25 reads=[r12, r25] writes=[r12]
      --   @043 block=#8 generic-for-call iterator=r20 state=r21 control=r22 results=fixed(r23..r24) reads=[r20, r21, r22] writes=[r23, r24]
      --   @044 block=#8 generic-for-loop control=r22 bindings=r23..r24 body=@36 exit=@45 reads=[r23] writes=[r22]
      --   @045 block=#9 jump @66 reads=[-] writes=[-]
      --   @046 block=#10 generic-for-call iterator=r13 state=r14 control=r15 results=fixed(r16..r17) reads=[r13, r14, r15] writes=[r16, r17]
      --   @047 block=#10 generic-for-loop control=r15 bindings=r16..r17 body=@23 exit=@48 reads=[r16] writes=[r15]
      --   @048 block=#11 jump @66 reads=[-] writes=[-]
      --   @049 block=#12 get-table r13 <- env[k5] reads=[-] writes=[r13]
      --   @050 block=#12 move r14 <- r0 reads=[r0] writes=[r14]
      --   @051 block=#12 call(normal) r13 args=fixed(r14) results=fixed(r13..r15) reads=[r13, r14] writes=[r13, r14, r15]
      --   @052 block=#12 jump @64 reads=[-] writes=[-]
      --   @053 block=#13 move r18 <- r4 reads=[r4] writes=[r18]
      --   @054 block=#13 move r19 <- r17 reads=[r17] writes=[r19]
      --   @055 block=#13 call(normal) r18 args=fixed(r19) results=fixed(r18) reads=[r18, r19] writes=[r18]
      --   @056 block=#13 branch if not (truthy r18) then @64 else @57 reads=[r18] writes=[-]
      --   @057 block=#14 move r19 <- r10 reads=[r10] writes=[r19]
      --   @058 block=#14 move r20 <- r18 reads=[r18] writes=[r20]
      --   @059 block=#14 call(normal) r19 args=fixed(r20) results=fixed(r19) reads=[r19, r20] writes=[r19]
      --   @060 block=#14 add r20 <- r12, r19 reads=[r12, r19] writes=[r20]
      --   @061 block=#14 branch if not (le r3, r20) then @63 else @62 reads=[r3, r20] writes=[-]
      --   @062 block=#15 jump @66 reads=[-] writes=[-]
      --   @063 block=#16 add r12 <- r12, r19 reads=[r12, r19] writes=[r12]
      --   @064 block=#17 generic-for-call iterator=r13 state=r14 control=r15 results=fixed(r16..r17) reads=[r13, r14, r15] writes=[r16, r17]
      --   @065 block=#17 generic-for-loop control=r15 bindings=r16..r17 body=@53 exit=@66 reads=[r16] writes=[r15]
      --   @066 block=#18 get-table r13 <- env[k9] reads=[-] writes=[r13]
      --   @067 block=#18 get-table r13 <- r13[k10] reads=[r13] writes=[r13]
      --   @068 block=#18 move r14 <- r1 reads=[r1] writes=[r14]
      --   @069 block=#18 load-const r15 <- k11 reads=[-] writes=[r15]
      --   @070 block=#18 get-table r16 <- env[k12] reads=[-] writes=[r16]
      --   @071 block=#18 get-table r16 <- r16[k13] reads=[r16] writes=[r16]
      --   @072 block=#18 load-const r17 <- k14 reads=[-] writes=[r17]
      --   @073 block=#18 move r18 <- r12 reads=[r12] writes=[r18]
      --   @074 block=#18 call(normal) r16 args=fixed(r17..r18) results=open(r16) reads=[r16, r17, r18] writes=[-]
      --   @075 block=#18 call(normal) r13 args=open(r14) results=ignore reads=[r13] writes=[-]
      --   @076 block=#18 return fixed(r0..(empty)) reads=[-] writes=[-]
      --   phi block=#8 reg=r12 incoming=[PhiIncoming { edge: Some(EdgeRef(7)), pred: Some(BlockRef(4)), value: Def(DefId(15)) }, PhiIncoming { edge: Some(EdgeRef(11)), pred: Some(BlockRef(7)), value: Def(DefId(38)) }]
      --   phi block=#8 reg=r22 incoming=[PhiIncoming { edge: Some(EdgeRef(7)), pred: Some(BlockRef(4)), value: Def(DefId(33)) }, PhiIncoming { edge: Some(EdgeRef(11)), pred: Some(BlockRef(7)), value: Def(DefId(41)) }]
      --   phi block=#10 reg=r15 incoming=[PhiIncoming { edge: Some(EdgeRef(2)), pred: Some(BlockRef(1)), value: Def(DefId(21)) }, PhiIncoming { edge: Some(EdgeRef(3)), pred: Some(BlockRef(2)), value: Def(DefId(44)) }, PhiIncoming { edge: Some(EdgeRef(5)), pred: Some(BlockRef(3)), value: Def(DefId(44)) }]
      --   phi block=#17 reg=r12 incoming=[PhiIncoming { edge: Some(EdgeRef(18)), pred: Some(BlockRef(12)), value: Def(DefId(15)) }, PhiIncoming { edge: Some(EdgeRef(19)), pred: Some(BlockRef(13)), value: Phi(PhiId(3)) }, PhiIncoming { edge: Some(EdgeRef(24)), pred: Some(BlockRef(16)), value: Def(DefId(57)) }]
      --   phi block=#17 reg=r15 incoming=[PhiIncoming { edge: Some(EdgeRef(18)), pred: Some(BlockRef(12)), value: Def(DefId(49)) }, PhiIncoming { edge: Some(EdgeRef(19)), pred: Some(BlockRef(13)), value: Def(DefId(60)) }, PhiIncoming { edge: Some(EdgeRef(24)), pred: Some(BlockRef(16)), value: Def(DefId(60)) }]
      --   phi block=#18 reg=r12 incoming=[PhiIncoming { edge: Some(EdgeRef(10)), pred: Some(BlockRef(6)), value: Phi(PhiId(0)) }, PhiIncoming { edge: Some(EdgeRef(14)), pred: Some(BlockRef(9)), value: Phi(PhiId(0)) }, PhiIncoming { edge: Some(EdgeRef(17)), pred: Some(BlockRef(11)), value: Def(DefId(15)) }, PhiIncoming { edge: Some(EdgeRef(23)), pred: Some(BlockRef(15)), value: Phi(PhiId(3)) }, PhiIncoming { edge: Some(EdgeRef(26)), pred: Some(BlockRef(17)), value: Phi(PhiId(3)) }]
      -- [unluac error] proto#19 failed before child closure placement and captures were recovered; direct child protos follow as detached diagnostic functions

      local function unluac_proto_20(p20_0)
        if p20_0 and not (p20_0 < 0) then
          local r20_0, r20_1 = mp.SMSVirtualQuery(p20_0)
          if r20_0 then
            local r20_2 = u20_0[r20_1.found_ix]
            if r20_2 then
              return r20_2
            end
            return nil
          end
          return nil
        end
        return nil
      end

      local function unluac_proto_21(p21_0, p21_1)
        if p21_0 and p21_1 then
          if not (p21_0 <= 0) and not (p21_1 <= 0) then
            local r21_0 = u21_0(p21_0)
            if r21_0 then
              local r21_1 = mp.bitand(r21_0.prot, 255)
              if r21_1 == 32
                or r21_1 == 64
                or r21_1 == 128
                or r21_1 == 8
                or r21_1 == 4
                or r21_1 == 2 then
                return p21_0 + p21_1 > r21_0.addr and p21_0 + p21_1 <= r21_0.addr + r21_0.size
              end
              return false
            end
            return false
          end
          return false
        end
        return false
      end

      local function unluac_proto_22(p22_0, p22_1)
        if u22_0(p22_0, p22_1) then
          local r22_0 = 65536
          local r22_1 = u22_1
          local r22_2 = r22_1 < p22_1 and r22_1 or p22_1
          local r22_3 = ""
          for r22_4 = 0, r22_2, r22_0 do
            local r22_5 = r22_4 + r22_0
            local r22_6 = r22_2 < r22_5 and r22_0 - (r22_5 - r22_2) or r22_0
            if r22_6 <= 0 then
              break
            end
            r22_3 = r22_3 .. mp.ReadProcMem(p22_0 + r22_4, r22_6)
          end
          return r22_3
        end
        return nil
      end

      local function unluac_proto_23(p23_0)
        local r23_0 = mp.bitand(p23_0, 4294967295)
        local r23_1, r23_2, r23_3, r23_4 = mp.bsplit(r23_0, 8)
        return string.char(r23_1) .. string.char(r23_2) .. string.char(r23_3) .. string.char(r23_4)
      end

      local function unluac_proto_24(p24_0)
        local r24_0 = mp.bitand(mp.shr64(p24_0, 32), 4294967295)
        local r24_1 = mp.bitand(p24_0, 4294967295)
        local r24_2, r24_3, r24_4, r24_5 = mp.bsplit(r24_1, 8)
        local r24_6, r24_7, r24_8, r24_9 = mp.bsplit(r24_0, 8)
        return string.char(r24_2) .. string.char(r24_3) .. string.char(r24_4) .. string.char(r24_5)
          .. string.char(r24_6) .. string.char(r24_7) .. string.char(r24_8) .. string.char(r24_9)
      end

      local function unluac_proto_25(p25_0, p25_1)
        if p25_0 and p25_1 and p25_1 ~= "" then
          if p25_0.addr and p25_0.size and p25_0.prot and p25_0.alloc_prot then
            local r25_0 = "\027\127\238-" .. string.char(mp.GetSMSProcArchitecture())
              .. u25_0(p25_0.addr) .. u25_1(p25_0.size) .. u25_1(p25_0.alloc_prot)
              .. u25_1(p25_0.prot) .. u25_1(#p25_1) .. p25_1
            if versioning.GetEngineBuild() >= 24030 then
              r25_0 = MpCommon.GzipCompress(r25_0)
            end
            return MpCommon.Base64Encode(r25_0), #r25_0
          end
          return nil
        end
        return nil
      end

      local function unluac_proto_26(p26_0)
        local r26_0 = 0
        local r26_1 = string.format("DetectedRegions:%s", u26_0)
        local r26_2 = string.format("%x:%x", p26_0.addr, p26_0.size)
        if not IsKeyInRollingQueue(r26_1, r26_2, true) then
          local r26_3 = u26_1(p26_0.addr, p26_0.size)
          local r26_4, r26_5 = u26_2(p26_0, r26_3)
          if r26_4 ~= nil then
            r26_0 = r26_5
            AppendToRollingQueue(r26_1, r26_2, r26_4)
          end
        end
        return r26_0
      end

      local function unluac_proto_27(p27_0)
        if p27_0 then
          local r27_0 = 0
          local r27_1 = { p27_0 }
          local r27_2 = u27_0(p27_0.addr - 1)
          while r27_2 do
            r27_1[#r27_1 + 1] = r27_2
            local r27_3 = u27_0
            local r27_4 = r27_2.addr
            r27_2 = r27_3(r27_4 - 1)
            r27_0 = r27_0 + 1
            if r27_0 == 8 then
              break
            end
          end
          local r27_5 = 0
          local r27_6 = u27_0(p27_0.addr + p27_0.size + 1)
          while r27_6 do
            r27_1[#r27_1 + 1] = r27_6
            local r27_7 = u27_0
            local r27_8 = r27_6.addr
            local r27_9 = r27_6.size
            r27_8 = r27_8 + r27_9 + 1
            r27_9 = nil
            r27_6 = r27_7(r27_8)
            r27_5 = r27_5 + 1
            if r27_5 == 8 then
              break
            end
          end
          return r27_1
        end
        return nil
      end
    end

    return pcall(r18_0, p18_0)
  end
  return false
end

function getDetectedRegions()
  local r28_0 = mp.GetSMSMemRanges()
  local r28_1 = {}
  for r28_2, r28_3 in ipairs(mp.hstr_full_log()) do
    if r28_3.matched then
      for r28_4, r28_5 in ipairs(r28_3.VA_all) do
        local r28_6, r28_7 = mp.SMSVirtualQuery(r28_5)
        if r28_6 then
          local r28_8 = r28_0[r28_7.found_ix]
          if r28_8 and r28_1[r28_8.addr] == nil then
            r28_1[r28_8.addr] = r28_8
          end
        end
      end
    end
  end
  return r28_1
end

function CmdReportParent(p29_0)
  local r29_0 = mp.getfilename()
  if r29_0 ~= nil then
    local r29_1 = string.lower(r29_0):match("([^\\]+)$")
    if r29_1 ~= nil
      and r29_1 ~= "powershell.exe"
      and r29_1 ~= "cmd.exe"
      and r29_1 ~= "7zg.exe"
      and r29_1 ~= "autoconv.exe"
      and r29_1 ~= "robocopy.exe"
      and r29_1 ~= "wscript.exe"
      and r29_1 ~= "cscript.exe"
      and r29_1 ~= "skypeapp.exe"
      and r29_1 ~= "ctregsvr.exe"
      and r29_1 ~= "reg.exe"
      and r29_1 ~= "regedt32.exe"
      and r29_1 ~= "regsvr32.exe"
      and r29_1 ~= "mpcmdrun.exe" then
      return true
    end
  end
  local r29_2 = mp.GetParentProcInfo()
  if r29_2 == nil then
    return false
  end
  local r29_3 = r29_2.image_path
  if r29_3 == nil then
    return false
  end
  local r29_4 = string.lower(r29_3)
  r29_3 = r29_4
  r29_4 = r29_3:match("([^\\]+)$")
  if r29_4 == nil then
    return false
  end
  if r29_4 ~= "powershell.exe"
    and r29_4 ~= "cmd.exe"
    and r29_4 ~= "7zg.exe"
    and r29_4 ~= "autoconv.exe"
    and r29_4 ~= "robocopy.exe"
    and r29_4 ~= "wscript.exe"
    and r29_4 ~= "cscript.exe"
    and r29_4 ~= "skypeapp.exe"
    and r29_4 ~= "ctregsvr.exe"
    and r29_4 ~= "reg.exe"
    and r29_4 ~= "regedt32.exe"
    and r29_4 ~= "regsvr32.exe"
    and r29_4 ~= "mpcmdrun.exe" then
    mp.ReportLowfi(r29_3, p29_0)
    return true
  end
  return false
end

function candidatePeFile()
  local r30_0 = mp.getfilesize()
  if not (r30_0 > 4000000) and not (r30_0 < 4000) then
    if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
      return false
    end
    if mp.get_mpattribute("pea_ismsil") then
      return false
    end
    local r30_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
    if r30_1:find("program files", 1, true) then
      return false
    end
    if r30_1:find("system32", 1, true) then
      return false
    end
    if r30_1:find("syswow64", 1, true) then
      return false
    end
    if r30_1:find("winsxs", 1, true) then
      return false
    end
    return true
  end
  return false
end

function getScannedRegions(p31_0, p31_1, p31_2, p31_3, p31_4)
  local r31_0 = MpCommon.GetCurrentTimeT()
  if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
    local r31_1 = 4096
    local r31_2 = {
      e_magic = 0, e_lfanew = 60, MZ_SIGNATURE = "MZ", MZ_SIGNATURE_HEX = 23117, PE_SIGNATURE = "PE",
      PE_SIGNATURE_HEX = 17744, PE32 = 267, PE32_PLUS = 523, Machine = 4, NumberOfSections = 6,
      TimeDateStamp = 8, PointerToSymbolTable = 12, NumberOfSymbols = 16, SizeOfOptionalHeader = 20,
      Characteristics = 22, Magic = 0, AddressOfEntryPoint = 16, BaseOfCode = 20,
      SectionAlignment = 32, FileAlignment = 36, SizeOfImage = 56, SizeOfHeaders = 60, Checksum = 64,
      Subsystem = 68, DllCharacteristics = 70, PE32_ImageBase = 28, PE32_BaseOfData = 24,
      PE32Plus_ImageBase = 24
    }
    local r31_3 = {
      PAGE_NOACCESS = 1, PAGE_READONLY = 2, PAGE_READWRITE = 4, PAGE_WRITECOPY = 8,
      PAGE_EXECUTE = 16, PAGE_EXECUTE_READ = 32, PAGE_EXECUTE_READWRITE = 64,
      PAGE_EXECUTE_WRITECOPY = 128, PAGE_GUARD = 256, PAGE_NOCACHE = 512, PAGE_WRITECOMBINE = 1024
    }
    local r31_4 = {
      MZ_PRESENT = 1, PE_PRESENT = 2, DOS_STRING_PRESENT = 4, RO_RX_ADJACENT = 8,
      RW_RX_ADJACENT = 16
    }

    local function r31_5(p32_0, p32_1, p32_2, p32_3)
      local r32_0, r32_1 = pcall(mp.ReadProcMem, p32_1, p32_2)
      if r32_0 then
        if r32_1 == nil then
          return nil
        end
        if #r32_1 < p32_2 then
          local r32_2 = string.format("%s at 0x%x: expected %d bytes, received %d", p32_3, p32_1,
            p32_2, #r32_1)
          p32_0.error_log[#p32_0.error_log + 1] = r32_2
          return nil
        end
        return r32_1
      end
      local r32_3 = string.format("%s at 0x%x: %s", p32_3, p32_1, tostring(r32_1))
      p32_0.error_log[#p32_0.error_log + 1] = r32_3
      return nil
    end

    local function r31_6(p33_0)
      local r33_0 = mp.GetPEBAddress()
      if r33_0 ~= nil and r33_0 ~= 0 then
        local r33_1 = mp.GetSMSProcArchitecture()
        if r33_1 == nil then
          return nil
        end
        local r33_2, r33_3, r33_4, r33_5, r33_6
        if r33_1 == mp.SMS_PROC_ARCH_X64 then
          local r33_7 = "x64"
          r33_2, r33_3, r33_4, r33_5, r33_6 = 8, 32, 112, 16, 9
        else
          if r33_1 ~= mp.SMS_PROC_ARCH_X32 then
            return nil
          end
          local r33_8 = "x86"
          r33_2, r33_3, r33_4, r33_5, r33_6 = 4, 16, 64, 8, 5
        end
        local r33_9 = r33_0 + r33_3
        local r33_10 = r31_5(p33_0, r33_9, r33_2, "Failed to read ProcessParameters pointer")
        if r33_10 == nil then
          return nil
        end
        local r33_11 = nil
        if r33_2 == 8 then
          r33_11 = mp.readu_u64(r33_10, 1)
        else
          r33_11 = mp.readu_u32(r33_10, 1)
        end
        if r33_11 ~= nil and r33_11 ~= 0 then
          local r33_12 = r33_11 + r33_4
          local r33_13 = r31_5(p33_0, r33_12, r33_5, "Failed to read CommandLine UNICODE_STRING")
          if r33_13 == nil then
            return nil
          end
          local r33_14 = mp.readu_u16(r33_13, 1)
          local r33_15 = mp.readu_u16(r33_13, 3)
          if r33_14 ~= nil and r33_15 ~= nil then
            if r33_14 == 0 then
              return ""
            end
            if r33_14 % 2 == 0 then
              if r33_15 ~= 0 and not (r33_15 < r33_14) then
                if r33_14 > 65534 then
                  return nil
                end
                local r33_16 = nil
                if r33_2 == 8 then
                  r33_16 = mp.readu_u64(r33_13, r33_6)
                else
                  r33_16 = mp.readu_u32(r33_13, r33_6)
                end
                if r33_16 ~= nil and r33_16 ~= 0 then
                  local r33_17 = r31_5(p33_0, r33_16, r33_14, "Failed to read command-line buffer")
                  if r33_17 == nil then
                    return nil
                  end
                  local r33_18 = r33_17
                  r33_17 = r33_18 .. "\000\000"
                  r33_18 = pcall
                  local r33_19, r33_20 = r33_18(mp.utf16to8, r33_17)
                  if r33_19 then
                    if r33_20 == nil then
                      return nil
                    end
                    return r33_20
                  end
                  return nil
                end
                return nil
              end
              return nil
            end
            return nil
          end
          return nil
        end
        return nil
      end
      return nil
    end

    local function r31_7(p34_0)
      return string.format("0x%x", p34_0)
    end

    local function r31_8(p35_0, p35_1, p35_2)
      if p35_2 == nil or type(p35_2) ~= "table" then
        return
      end
      local r35_0 = r31_7(p35_1)
      local r35_1 = p35_0[r35_0]
      if r35_1 == nil then
        r35_1 = {}
        p35_0[r35_0] = r35_1
      end
      if p35_2.heuristics ~= nil then
        r35_1.heuristics = mp.bitor(r35_1.heuristics or 0, p35_2.heuristics)
      end
      for r35_2, r35_3 in pairs(p35_2) do
        if r35_2 ~= "heuristics" then
          r35_1[r35_2] = r35_3
        end
      end
    end

    local function r31_9(p36_0, p36_1)
      if p36_1 == nil then
        return
      end
      if p36_1.heuristics ~= nil then
        p36_0.heuristics = mp.bitor(p36_0.heuristics or 0, p36_1.heuristics)
      end
      for r36_0, r36_1 in pairs(p36_1) do
        if r36_0 ~= "heuristics" and p36_0[r36_0] == nil then
          p36_0[r36_0] = r36_1
        end
      end
    end

    local r31_10 = mp.GetScannedPPID()
    local r31_11, r31_12, r31_13 = 0, 0, 0
    local r31_14 = {}
    local r31_15 = p31_4 or {}
    local r31_16 = {
      version = "1.7", ppid = r31_10, arch = mp.GetSMSProcArchitecture(), sig_matched = p31_0,
      scan_count = p31_2, scan_time_diff = p31_3, command_line = "", command_line_method = "GPCL",
      nRegions = 0, nCollectedRegions = 0, nCollectedRegionSamples = 0, regions = {}, nThreads = 0,
      nCollectedThreads = 0, threads = {}, error_log = {}, sig_context = r31_15
    }
    local r31_17 = mp.GetProcessCommandLine(r31_10)
    if r31_17 and r31_17 ~= "" then
      r31_16.command_line = r31_17
    else
      r31_16.command_line_method = "PEB"
      r31_17 = r31_6(r31_16)
      if r31_17 ~= nil then
        r31_16.command_line = r31_17
      end
    end
    local r31_18, r31_19, r31_20 = 4000, 20, 1048576
    local r31_21, r31_22 = pcall(mp.GetSMSMemRanges)
    if not r31_21 then
      r31_16.error_log[#r31_16.error_log + 1] = tostring(r31_22)
      r31_22 = {}
    end
    local r31_23 = #r31_22
    r31_16.nRegions = r31_23
    local r31_24, r31_25, r31_26 = 1, r31_23, 1
    for r31_27 = r31_24, r31_25, r31_26 do
      local r31_28 = r31_22[r31_27]
      if r31_18 < r31_27 then
        break
      end
      if r31_11 >= 150 then
        break
      end
      if not r31_28.addr
        or not r31_28.size
        or not r31_28.prot
        or not r31_28.alloc_prot
        or not r31_28.state_type
        or not r31_28.flags then
        return 3
      end
      if mp.bitand(r31_28.state_type, mp.SMS_MBI_IMAGE) == 0
        and mp.bitand(r31_28.state_type, mp.SMS_MBI_MAPPED) == 0
        and mp.bitand(r31_28.state_type, mp.SMS_MBI_COMMIT) == mp.SMS_MBI_COMMIT
        and mp.bitand(r31_28.alloc_prot, r31_3.PAGE_NOACCESS) == 0 then
        local r31_29, r31_30 = 0, false
        local r31_31 = mp.bitand(r31_28.prot, 255)
        local r31_32 = mp.bitand(r31_28.alloc_prot, 255)
        local r31_33 = false
        local r31_34 = r31_28.addr + r31_1
        local r31_35 = r31_22[r31_27 + 1]
        if r31_31 == r31_3.PAGE_EXECUTE_READWRITE and r31_28.size > 8192 then
          r31_33 = true
        elseif r31_31 == r31_3.PAGE_READONLY and r31_28.size == r31_1 then
          if r31_35 ~= nil
            and r31_35.addr == r31_34
            and mp.bitand(r31_35.prot, 255) == r31_3.PAGE_EXECUTE_READ
            and r31_35.size > r31_1 then
            r31_33 = true
            r31_29 = mp.bitor(r31_29, r31_4.RO_RX_ADJACENT)
            local r31_36 = r31_35.addr
            local r31_37 = {}
            local r31_38 = r31_4.RO_RX_ADJACENT
            r31_37.heuristics = r31_38
            r31_38 = nil
            r31_8(r31_14, r31_36, r31_37)
          end
        elseif r31_31 == r31_3.PAGE_READWRITE
          and r31_32 == r31_3.PAGE_READWRITE
          and r31_28.size == r31_1
          and r31_35 ~= nil then
          local r31_39 = mp.bitand(r31_35.prot, 255)
          if r31_35.addr == r31_34
            and (r31_39 == r31_3.PAGE_EXECUTE_READ or r31_39 == r31_3.PAGE_EXECUTE_READWRITE)
            and mp.bitand(r31_35.alloc_prot, 255) == r31_3.PAGE_READWRITE
            and r31_35.size > r31_1 then
            r31_33 = true
            r31_29 = mp.bitor(r31_29, r31_4.RW_RX_ADJACENT)
            local r31_40 = r31_35.addr
            local r31_41 = {}
            local r31_42 = r31_4.RW_RX_ADJACENT
            r31_41.heuristics = r31_42
            r31_42 = nil
            r31_8(r31_14, r31_40, r31_41)
          end
        end
        if r31_33 then
          local r31_43 = r31_5
          r31_43 = r31_43(r31_16, r31_28.addr, r31_1, "Failed to read region header")
          if r31_43 ~= nil and #r31_43 == r31_1 then
            local r31_44 = mp.readu_u16(r31_43, 1)
            if r31_44 == r31_2.MZ_SIGNATURE_HEX then
              r31_29 = mp.bitor(r31_29, r31_4.MZ_PRESENT)
            end
            r31_44 = mp
            r31_44 = r31_44.readu_u32
            local r31_45 = r31_2.e_lfanew
            r31_44 = r31_44(r31_43, 1 + r31_45)
            if r31_44 ~= nil
              and r31_44 < 1024
              and mp.readu_u16(r31_43, 1 + r31_44) == r31_2.PE_SIGNATURE_HEX then
              r31_29 = mp.bitor(r31_29, r31_4.PE_PRESENT)
              local r31_46 = 1 + r31_44
              local r31_47 = mp.readu_u32
              local r31_48 = r31_2.TimeDateStamp
              r31_47 = r31_47(r31_43, r31_46 + r31_48)
              local r31_49 = mp.readu_u16
              r31_48 = r31_43
              local r31_50 = r31_2.NumberOfSections
              r31_49 = r31_49(r31_48, r31_46 + r31_50)
              r31_50 = 1 + (r31_44 + 24)
              local r31_51 = mp.readu_u32
              local r31_52 = r31_2.Checksum
              r31_51 = r31_51(r31_43, r31_50 + r31_52)
              local r31_53 = mp.readu_u32
              r31_52 = r31_43
              local r31_54 = r31_2.AddressOfEntryPoint
              r31_53 = r31_53(r31_52, r31_50 + r31_54)
              local r31_55 = mp.readu_u32
              r31_54 = r31_43
              local r31_56 = r31_2.SizeOfImage
              r31_55 = r31_55(r31_54, r31_50 + r31_56)
              local r31_57 = {}
              if r31_47 ~= nil then
                r31_57.pe_timestamp = r31_47
              end
              if r31_49 ~= nil then
                r31_57.pe_number_of_sections = r31_49
              end
              if r31_51 ~= nil then
                r31_57.pe_checksum = r31_51
              end
              if r31_53 ~= nil then
                r31_57.pe_address_of_entry_point = r31_53
              end
              if r31_55 ~= nil then
                r31_57.pe_size_of_image = r31_55
              end
              r31_56 = r31_8
              r31_56(r31_14, r31_28.addr, r31_57)
            end
            local r31_58 = string.find(r31_43, "This program cannot be run in DOS mode", 1, true)
            if r31_58 ~= nil then
              r31_29 = mp.bitor(r31_29, r31_4.DOS_STRING_PRESENT)
            end
          end
        end
        if r31_30 == false and r31_12 < r31_19 then
          local r31_59 = r31_7
          r31_59 = r31_59(r31_28.addr)
          r31_59 = r31_14[r31_59]
          if not (r31_59 == nil or r31_59.should_sample_mem ~= true) then
            r31_30 = true
          end
          if mp.bitand(r31_29, r31_4.MZ_PRESENT) ~= 0
            or mp.bitand(r31_29, r31_4.PE_PRESENT) ~= 0
            or mp.bitand(r31_29, r31_4.DOS_STRING_PRESENT) ~= 0 then
            r31_30 = true
            if r31_35 ~= nil
              and r31_35.addr ~= nil
              and (mp.bitand(r31_29, r31_4.RO_RX_ADJACENT) ~= 0
                or mp.bitand(r31_29, r31_4.RW_RX_ADJACENT) ~= 0)
              and r31_35.addr == r31_28.addr + r31_28.size then
              r31_8(r31_14, r31_35.addr, { should_sample_mem = true })
            end
          end
        end
        if r31_30 and r31_12 < r31_19 then
          local r31_60 = r31_28.size
          if r31_20 < r31_60 then
            r31_60 = r31_20
          end
          mp.CollectRegion(r31_28.addr, r31_60)
          r31_12 = r31_12 + 1
        end
        local r31_61 = {}
        r31_61.addr = r31_28.addr
        r31_61.size = r31_28.size
        local r31_62 = r31_28.alloc_prot
        r31_61.alloc_prot = r31_62
        r31_62 = r31_28.prot
        r31_61.prot = r31_62
        r31_62 = r31_28.state_type
        r31_61.state_type = r31_62
        r31_62 = r31_28.flags
        r31_61.flags = r31_62
        r31_61.heuristics = r31_29
        if r31_30 then
          r31_61.should_sample_mem = true
        end
        r31_62 = r31_9
        local r31_63 = r31_7
        r31_63 = r31_63(r31_28.addr)
        r31_63 = r31_14[r31_63]
        r31_62(r31_61, r31_63)
        r31_16.regions[#r31_16.regions + 1] = r31_61
        r31_11 = r31_11 + 1
      end
    end
    r31_16.nCollectedRegions = r31_11
    r31_16.nCollectedRegionSamples = r31_12
    local r31_64, r31_65 = mp.GetSMSThreadInfo()
    if type(r31_64) == "table" then
      r31_25, r31_26 = r31_64, r31_65
    else
      local r31_66 = tonumber(r31_64)
      r31_26 = r31_66 or 0
      r31_66 = {}
      r31_25 = r31_66
    end
    local r31_67, r31_68, r31_69 = ipairs(r31_25)
    for r31_70, r31_71 in r31_67, r31_68, r31_69 do
      if 50 < r31_70 or r31_13 >= 20 then
        break
      end
      local r31_72, r31_73 = mp.SMSVirtualQuery(r31_71.StartAddr)
      if r31_72 and mp.bitand(r31_73.state_type, mp.SMS_MBI_IMAGE) == 0 or not r31_72 then
        local r31_74 = {}
        r31_74.ptid = r31_71.PTID
        r31_74.creator_ptid = r31_71.CreatorPTID
        local r31_75 = r31_71.StartAddr
        r31_74.start_addr = r31_75
        if r31_72 then
          r31_74.region_prot = r31_73.prot
          r31_74.region_alloc_prot = r31_73.alloc_prot
          local r31_76 = r31_73.state_type
          r31_74.region_state_type = r31_76
          r31_76 = r31_73.size
          r31_74.region_size = r31_76
          r31_76 = r31_71.StartAddr
          local r31_77 = r31_71.StartAddr
          r31_76 = r31_76 - r31_77 % r31_1
          mp.CollectRegion(r31_76, r31_1)
        end
        r31_16.threads[#r31_16.threads + 1] = r31_74
        r31_13 = r31_13 + 1
      end
    end
    r31_16.nThreads = r31_26
    r31_16.nCollectedThreads = r31_13
    r31_67 = MpCommon.JsonSerialize(r31_16)
    r31_68 = MpCommon.Base64Encode(r31_67)
    AppendToRollingQueue(p31_1, "data", r31_68)
    return 0
  end
  return 1
end

function verify_non_prod_rings()
  if versioning.GetEngineRing() < 5 then
    return true
  end
  return false
end
