-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4a78154bf9f4\0x0000c444_luac 

-- params : ...
-- function num : 0
if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
local l_0_0 = function()
  -- function num : 0_0
  do
    local l_1_0 = (mp.GetSMSMemRanges)()
    for l_1_4,l_1_5 in ipairs((mp.hstr_full_log)()) do
      if l_1_5.matched and isSafeToRead(l_1_0, l_1_5.VA, 16) then
        local l_1_6 = (mp.ReadProcMem)(l_1_5.VA, 16)
        if (mp.readu_u16)(l_1_6, 1) == 53643 then
          local l_1_7 = (mp.readu_u32)(l_1_6, 6) + l_1_5.VA + 9
          if isSafeToRead(l_1_0, l_1_7, 512) then
            l_1_6 = (mp.ReadProcMem)(l_1_7, 512)
            local l_1_8 = (mp.readu_u64)(l_1_6, 1)
            if not isSafeToRead(l_1_0, l_1_8, 4) then
              local l_1_9, l_1_10, l_1_11, l_1_12 = (mp.bsplit)((mp.bitand)((mp.shr64)(l_1_7, 32), 4294967295), 8)
              local l_1_13 = (string.char)((mp.bitxor)(l_1_6:byte(5), l_1_9)) .. (string.char)((mp.bitxor)(l_1_6:byte(6), l_1_10)) .. (string.char)((mp.bitxor)(l_1_6:byte(7), l_1_11)) .. (string.char)((mp.bitxor)(l_1_6:byte(8), l_1_12))
              do
                local l_1_14 = "([\\x00-\\xFF]+)" .. l_1_13
                if not (MpCommon.BinaryRegExpSearch)(l_1_14, l_1_6) then
                  break
                end
                l_1_8 = (mp.bitxor)((mp.readu_u64)(l_1_6, #l_1_14 - 3), (mp.readu_u64)(l_1_6, 1))
                if not isSafeToRead(l_1_0, l_1_8, 4) then
                  break
                end
                local l_1_15 = reportDetectedRegions
                do
                  local l_1_16 = {}
                  -- DECOMPILER ERROR at PC157: No list found for R10 , SetList fails

                  l_1_15(l_1_16)
                  -- DECOMPILER ERROR at PC159: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC159: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC159: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC159: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC159: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC159: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC159: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC159: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC159: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
    -- WARNING: undefined locals caused missing assignments!
  end
end

pcallEx("get_regions", l_0_0)
return mp.INFECTED

