-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\50db3ba5e2360\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = 0
for l_0_8 = 1, l_0_0 do
  local l_0_9 = (sigattr_tail[l_0_8]).utf8p2
  if (sigattr_tail[l_0_8]).attribute == 16385 and ((sigattr_tail[l_0_8]).utf8p1):byte(1) ~= 37 and l_0_9:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_10 = ((sigattr_tail[l_0_8]).utf8p1):lower()
    local l_0_11 = l_0_10:match("%.[^%.]+$")
    if l_0_11 and (mp.bitand)((mp.GetExtensionClass)(l_0_11), 3) ~= 0 then
      local l_0_12 = {}
      if l_0_1[l_0_10] == nil then
        l_0_1[l_0_10] = l_0_8
        for l_0_16,l_0_17 in (string.gmatch)(l_0_9, "(%w+):(%w+)") do
          l_0_12[l_0_16] = l_0_17
        end
        do
          do
            local l_0_18, l_0_19, l_0_24, l_0_26, l_0_30, l_0_31 = l_0_12.TotalSizeAppend and tonumber(l_0_12.TotalSizeAppend) or 0
            -- DECOMPILER ERROR at PC76: Confused about usage of register: R13 in 'UnsetPending'

            -- DECOMPILER ERROR at PC78: Confused about usage of register: R13 in 'UnsetPending'

            if l_0_18 > 0 then
              if l_0_18 > 16 then
                l_0_4 = l_0_4 + 1
                break
              end
              do
                local l_0_20, l_0_25, l_0_27 = , l_0_12.LastOff and tonumber(l_0_12.LastOff) or 0
                do
                  local l_0_21, l_0_28 = nil
                  do
                    local l_0_22, l_0_29 = nil
                    do
                      do
                        local l_0_23 = nil
                        -- DECOMPILER ERROR at PC142: Confused about usage of register: R14 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC142: Confused about usage of register: R17 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC144: Confused about usage of register: R14 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC149: Confused about usage of register: R13 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC151: Confused about usage of register: R13 in 'UnsetPending'

                        if l_0_12.BiggestOff and tonumber(l_0_12.BiggestOff) or 0 ~= 0 and l_0_12.FirstOff and tonumber(l_0_12.FirstOff) or 0 == 0 and l_0_12.SmallestOff and tonumber(l_0_12.SmallestOff) or 0 == 0 and l_0_12.BiggestOff and tonumber(l_0_12.BiggestOff) or 0 == l_0_29 and l_0_29 + 1 == l_0_12.TotalSizeWrite and tonumber(l_0_12.TotalSizeWrite) or 0 and l_0_12.NumWrites and tonumber(l_0_12.NumWrites) or 0 > 0 and l_0_23 > 0 and l_0_23 <= 16 then
                          if l_0_3 >= 10 then
                            break
                          else
                            if l_0_3 < 10 then
                              l_0_12.path = l_0_10
                              l_0_2[l_0_8] = l_0_12
                            end
                          end
                          l_0_3 = l_0_3 + 1
                        end
                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC162: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
local l_0_32 = {}
local l_0_33 = 0
if l_0_4 == 0 and l_0_3 >= 10 then
  for l_0_37,l_0_38 in pairs(l_0_2) do
    local l_0_39 = (sigattr_tail[l_0_37]).utf8p1
    local l_0_40 = (sysio.GetFileSize)(l_0_39)
    if l_0_40 ~= nil and l_0_40 > 256 and l_0_40 == tonumber(l_0_38.TotalSizeWrite) then
      local l_0_41 = (sysio.ReadFile)(l_0_39, 0, 256)
      if l_0_41 ~= nil then
        local l_0_42 = (string.format)("\\x%02X\\x%02X\\x%02X\\x%02X", (string.byte)(l_0_41, 1, 4))
        local l_0_43 = (crypto.ComputeEntropy)(l_0_41)
        local l_0_44 = table.insert
        local l_0_45 = l_0_32
        local l_0_46 = {}
        l_0_46.FilePath = l_0_39
        l_0_46.Filesize = l_0_40
        l_0_46.MagicByte = l_0_42
        l_0_46.Entropy = l_0_43
        l_0_46.AppendedSize = tonumber(l_0_38.TotalSizeAppend)
        l_0_46.WriteSize = tonumber(l_0_38.TotalSizeWrite)
        l_0_44(l_0_45, l_0_46)
        l_0_33 = l_0_33 + 1
      end
    end
    do
      if l_0_33 >= 5 then
        local l_0_47 = {}
        l_0_47.gen_ransom_data = l_0_32
        local l_0_48 = safeJsonSerialize(l_0_47)
        ;
        (bm.add_related_string)("genfb_ransom_meta", l_0_48, bm.RelatedStringBMReport)
        ;
        (bm.trigger_sig)("GenericRansomware:FileAppendBucket1:16", l_0_48)
        return mp.INFECTED
      end
      do
        -- DECOMPILER ERROR at PC251: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
end
return mp.CLEAN

