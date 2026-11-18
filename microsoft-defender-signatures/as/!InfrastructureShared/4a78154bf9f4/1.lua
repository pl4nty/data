-- Threat: !InfrastructureShared
-- Name: 4a78154bf9f4
-- Type: 21
-- Includes: HstrLuaLib, LuaFuncHelper

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end

local function l_0_0()
  local l_1_0 = mp.GetSMSMemRanges()
  for l_1_1, l_1_2 in ipairs(mp.hstr_full_log()) do
    if l_1_2.matched and isSafeToRead(l_1_0, l_1_2.VA, 16) then
      local l_1_3 = mp.ReadProcMem(l_1_2.VA, 16)
      if mp.readu_u16(l_1_3, 1) == 53643 then
        local l_1_4 = mp.readu_u32(l_1_3, 6) + l_1_2.VA + 9
        if isSafeToRead(l_1_0, l_1_4, 512) then
          l_1_3 = mp.ReadProcMem(l_1_4, 512)
          local l_1_5 = mp.readu_u64(l_1_3, 1)
          if not isSafeToRead(l_1_0, l_1_5, 4) then
            local l_1_6, l_1_7, l_1_8, l_1_9 = mp.bsplit(mp.bitand(mp.shr64(l_1_4, 32), 4294967295), 8)
            local l_1_10 = string.char(mp.bitxor(l_1_3:byte(5), l_1_6)) .. string.char(mp.bitxor(l_1_3:byte(6), l_1_7)) .. string.char(mp.bitxor(l_1_3:byte(7), l_1_8)) .. string.char(mp.bitxor(l_1_3:byte(8), l_1_9))
            local l_1_11 = "([\\x00-\\xFF]+)" .. l_1_10
            local l_1_12, l_1_13 = MpCommon.BinaryRegExpSearch(l_1_11, l_1_3)
            if not l_1_12 then
              break
            end
            l_1_5 = mp.bitxor(mp.readu_u64(l_1_3, #l_1_13 - 3), mp.readu_u64(l_1_3, 1))
            if not isSafeToRead(l_1_0, l_1_5, 4) then
              break
            end
          end
          reportDetectedRegions({
            l_1_5,
            l_1_4,
            l_1_2.VA
          })
        end
      end
    end
  end
end

pcallEx("get_regions", l_0_0)
return mp.INFECTED
