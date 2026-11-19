-- Threat: !InfrastructureShared
-- Name: 69d7848c0e143
-- Type: 21

function ParseInstrInfo(l_1_0)
  local l_1_1 = false
  
  local l_1_2 = false
  local l_1_3 = false
  local l_1_4 = false
  local l_1_5 = false
  local l_1_6 = false
  local l_1_7 = 0
  for l_1_8, l_1_9 in pairs(l_1_0) do
    if l_1_1 == false then
      if l_1_9.opcode == 49 and mp.bitand(l_1_9.flags, mp.DASM_FLAG_MODRM) ~= 0 and l_1_1 == false and l_1_9.ilen == 3 and l_1_9.disp == 0 and l_1_9.immed == 0 then
        if l_1_8 ~= 1 then
          return false
        end
        l_1_3 = true
        l_1_1 = true
        l_1_7 = l_1_9.modrm
      end
    elseif l_1_9.opcode == 247 and l_1_3 == true and l_1_9.ilen == 3 and l_1_8 == 2 then
      if mp.bitand(l_1_9.modrm, 7) == mp.shr8(mp.bitand(l_1_7, 56), 3) then
        l_1_2 = true
      end
    elseif l_1_9.opcode == 139 and l_1_3 == true then
      if l_1_5 == true and mp.bitand(l_1_9.flags, mp.DASM_FLAG_DISP) ~= 0 and (l_1_9.disp == 16 or l_1_9.disp == 32 or l_1_9.disp == 48) and mp.bitand(l_1_9.modrm, 7) == mp.shr8(mp.bitand(l_1_7, 56), 3) and l_1_8 <= 30 then
        l_1_6 = true
      end
      if l_1_4 == true and mp.bitand(l_1_9.flags, mp.DASM_FLAG_DISP) ~= 0 and mp.bitand(l_1_9.flags, mp.DASM_FLAG_MODRM) ~= 0 and l_1_9.disp == 24 and mp.bitand(l_1_9.modrm, 7) == mp.shr8(mp.bitand(l_1_7, 56), 3) and l_1_8 <= 25 then
        l_1_7 = l_1_9.modrm
        l_1_5 = true
      end
      if l_1_9.prefx_cnt == 2 and l_1_9.disp == 96 and l_1_9.ilen == 5 and mp.bitand(l_1_9.flags, mp.DASM_FLAG_MODRM) ~= 0 and l_1_8 <= 20 then
        if l_1_2 == true then
          l_1_7 = l_1_9.modrm
          l_1_4 = true
        elseif mp.bitand(l_1_9.modrm, 7) == mp.shr8(mp.bitand(l_1_7, 56), 3) then
          l_1_7 = l_1_9.modrm
          l_1_4 = true
        end
      end
    elseif l_1_6 == true and l_1_9.opcode == 255 and (l_1_9.jtype == 4 or l_1_9.jtype == 5) then
      return true
    end
  end
  return false
end

local l_0_0 = mp.GetHSTRCallerId()
if mp.HSTR_CALLER_SMS == l_0_0 then
  local l_0_1 = mp.GetSMSLevel()
  if l_0_1 ~= mp.SMS_SCAN_ONCE_ADV and l_0_1 ~= mp.SMS_SCAN_LOW_ADV and l_0_1 ~= mp.SMS_SCAN_MED_ADV and l_0_1 ~= mp.SMS_SCAN_HIGH_ADV then
    return mp.CLEAN
  end
  local l_0_2 = mp.GetSMSProcArchitecture()
  local l_0_3 = mp.GetSMSMemRanges()
  local l_0_4 = mp.hstr_full_log()
  for l_0_5, l_0_6 in pairs(l_0_4) do
    if l_0_6.matched and l_0_6.VA then
      local l_0_7, l_0_8 = mp.SMSVirtualQuery(l_0_6.VA)
      if l_0_7 ~= true then
        return mp.CLEAN
      end
      if l_0_8.prot ~= 64 or l_0_8.state_type ~= mp.bitor(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE) then
        return mp.CLEAN
      end
      local l_0_9 = l_0_6.VA
      local l_0_10 = l_0_8.size
      local l_0_11 = l_0_3[l_0_8.found_ix]
      local l_0_12 = l_0_11.addr + l_0_11.size
      local l_0_13 = l_0_10
      if 4096 < l_0_13 then
        l_0_13 = 4096
      end
      if l_0_12 < l_0_9 + l_0_13 then
        l_0_13 = l_0_12 - l_0_9
      end
      local l_0_14 = mp.ReadProcMem(l_0_9, l_0_13)
      if l_0_14 ~= nil then
        local l_0_15 = mp.x86dasm(l_0_2, l_0_9, l_0_14, l_0_13, 150, l_0_9, 0)
        if l_0_15 ~= nil and ParseInstrInfo(l_0_15) == true then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
