-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1b8b3733c4de1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = 4
local l_0_3 = 0
if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p2 then
  local l_0_4 = safeJsonDeserialize((this_sigattrlog[13]).utf8p2)
  local l_0_5 = {}
  if tonumber(l_0_4.append_size) == 92 then
    for l_0_9 = 1, l_0_0 do
      local l_0_10 = (sigattr_tail[l_0_9]).utf8p2
      if (sigattr_tail[l_0_9]).attribute == 16385 and (string.len)((sigattr_tail[l_0_9]).utf8p1) > 5 and ((sigattr_tail[l_0_9]).utf8p1):byte(1) ~= 37 then
        local l_0_11 = ((sigattr_tail[l_0_9]).utf8p1):lower()
        local l_0_12 = {}
        if l_0_1[l_0_11] == nil then
          l_0_1[l_0_11] = l_0_9
          for l_0_16,l_0_17 in (string.gmatch)(l_0_10, "(%w+):(%w+)") do
            l_0_12[l_0_16] = l_0_17
          end
          do
            do
              local l_0_18, l_0_19, l_0_21, l_0_22, l_0_23, l_0_27, l_0_30, l_0_34 = l_0_12.LastOff and tonumber(l_0_12.LastOff) or 0
              do
                local l_0_20, l_0_24, l_0_28, l_0_31, l_0_35 = , l_0_12.FirstOff and tonumber(l_0_12.FirstOff) or 0
                do
                  local l_0_25, l_0_29, l_0_32, l_0_36 = , l_0_12.NumWrites and tonumber(l_0_12.NumWrites) or 0
                  do
                    local l_0_26, l_0_33, l_0_37 = nil
                    do
                      local l_0_38 = nil
                      -- DECOMPILER ERROR at PC118: Confused about usage of register: R13 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC119: Confused about usage of register: R14 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC121: Confused about usage of register: R13 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC122: Confused about usage of register: R14 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC126: Confused about usage of register: R13 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC129: Confused about usage of register: R13 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC130: Confused about usage of register: R16 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC132: Confused about usage of register: R15 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC134: Confused about usage of register: R16 in 'UnsetPending'

                      if ((l_0_33 ~= l_0_38 + 1 and l_0_33 ~= l_0_38 + 2) or l_0_12.SmallestOff and tonumber(l_0_12.SmallestOff) or 0 ~= 0 or (l_0_12.BiggestOff and tonumber(l_0_12.BiggestOff) or 0 ~= l_0_38 + 92 and l_0_12.BiggestOff and tonumber(l_0_12.BiggestOff) or 0 ~= l_0_38 + 93) or l_0_37 >= 10 or l_0_12.BiggestOff and tonumber(l_0_12.BiggestOff) or 0 > 256) then
                        local l_0_39 = nil
                        if (sysio.ReadFile)((sigattr_tail[l_0_9]).utf8p1, 0, 256) ~= nil then
                          local l_0_40 = nil
                          local l_0_41 = nil
                          if (crypto.ComputeEntropy)((sysio.ReadFile)((sigattr_tail[l_0_9]).utf8p1, 0, 256)) >= 7 then
                            local l_0_42 = nil
                            local l_0_43 = nil
                            local l_0_44 = nil
                            ;
                            (table.insert)(l_0_5, {path = (sigattr_tail[l_0_9]).utf8p1, magic = (string.format)("0x%02X%02X%02X%02X", (string.byte)((sysio.ReadFile)((sigattr_tail[l_0_9]).utf8p1, 0, 256), 1, 4)), entropy = (crypto.ComputeEntropy)((sysio.ReadFile)((sigattr_tail[l_0_9]).utf8p1, 0, 256))})
                            l_0_3 = l_0_3 + 1
                            if l_0_2 <= l_0_3 then
                              (bm.add_related_string)("genfa_lockbit4_meta", safeJsonSerialize({append_size = l_0_4.append_size, file_paths = l_0_5}), bm.RelatedStringBMReport)
                              sms_untrusted_process()
                              return mp.INFECTED
                            end
                          end
                        end
                      end
                      do
                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC194: LeaveBlock: unexpected jumping out IF_STMT

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
do
  return mp.CLEAN
end

