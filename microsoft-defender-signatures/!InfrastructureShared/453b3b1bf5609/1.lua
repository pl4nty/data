-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\453b3b1bf5609\1.luac 

-- params : ...
-- function num : 0
reportGenEncryption = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = {}
  local l_1_3 = 0
  local l_1_4 = mp.SIGATTR_LOG_SZ
  local l_1_5 = ""
  if l_1_1 == 1 then
    l_1_5 = "FileAppendBucket1-16"
  else
    if l_1_1 == 2 then
      l_1_5 = "FullFileOverwrite"
    else
      return mp.CLEAN
    end
  end
  for l_1_9 = 1, l_1_4 do
    for l_1_13,l_1_14 in pairs(l_1_0) do
      -- DECOMPILER ERROR at PC49: Confused about usage of register: R15 in 'UnsetPending'

      if (sigattr_tail[l_1_9]).attribute == 16386 and ((sigattr_tail[l_1_9]).utf8p1):byte(1) ~= 37 and (sigattr_tail[l_1_9]).utf8p2 == (sigattr_tail[l_1_13]).utf8p1 then
        (l_1_0[l_1_13]).RenamedPath = (sigattr_tail[l_1_9]).utf8p1
      end
    end
  end
  local l_1_15 = 0
  for l_1_19,l_1_20 in pairs(l_1_0) do
    local l_1_21 = l_1_20.path
    if (sysio.GetFileSize)(l_1_21) == nil then
      l_1_21 = l_1_20.RenamedPath
      local l_1_22, l_1_23, l_1_33, l_1_34 = (sysio.GetFileSize)(l_1_21)
    end
    do
      -- DECOMPILER ERROR at PC71: Confused about usage of register: R13 in 'UnsetPending'

      -- DECOMPILER ERROR at PC73: Confused about usage of register: R13 in 'UnsetPending'

      if l_1_22 ~= nil and l_1_22 > 256 then
        local l_1_24 = nil
        if (sysio.ReadFile)(l_1_21, 0, 256) ~= nil then
          local l_1_25 = nil
          local l_1_26 = (string.format)("0x%02X%02X%02X%02X", (string.byte)((sysio.ReadFile)(l_1_21, 0, 256), 1, 4))
          if l_1_15 == 0 or (crypto.ComputeEntropy)(l_1_25) < l_1_15 then
            l_1_15 = (crypto.ComputeEntropy)(l_1_25)
          end
          if l_1_20.RenamedPath == l_1_21 then
            local l_1_27 = nil
            local l_1_28 = table.insert
            local l_1_29 = l_1_2
            l_1_28(l_1_29, {org_path = l_1_20.path, path = l_1_21, fileSize = l_1_24, magic = l_1_26, entropy = l_1_27, appended_size = tonumber(l_1_20.TotalSizeAppend), write_size = tonumber(l_1_20.TotalSizeWrite)})
          else
            do
              local l_1_30 = nil
              local l_1_31 = table.insert
              do
                do
                  local l_1_32 = l_1_2
                  l_1_31(l_1_32, {path = l_1_21, fileSize = l_1_24, magic = l_1_26, entropy = l_1_30, appended_size = tonumber(l_1_20.TotalSizeAppend), write_size = tonumber(l_1_20.TotalSizeWrite)})
                  l_1_3 = l_1_3 + 1
                  if l_1_3 >= 5 and l_1_15 >= 7 then
                    local l_1_35 = nil
                    local l_1_36 = nil
                    ;
                    (bm.add_related_string)("geng_ransom_meta", safeJsonSerialize({file_paths = l_1_2, bucket = l_1_5}), bm.RelatedStringBMReport)
                    if l_1_1 == 1 then
                      (bm.trigger_sig)("GenericRansomware:FileAppendBucket1:16", safeJsonSerialize({file_paths = l_1_2, bucket = l_1_5}))
                    else
                      if l_1_1 == 2 then
                        (bm.trigger_sig)("GenericRansomware:FullFileFileOverwrite", safeJsonSerialize({file_paths = l_1_2, bucket = l_1_5}))
                      end
                    end
                    return mp.INFECTED
                  end
                  do
                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out DO_STMT

                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return mp.CLEAN
end

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = {}
local l_0_6 = 0
local l_0_7 = 0
for l_0_11 = 1, l_0_0 do
  local l_0_12 = (sigattr_tail[l_0_11]).utf8p2
  if (sigattr_tail[l_0_11]).attribute == 16385 and ((sigattr_tail[l_0_11]).utf8p1):byte(1) ~= 37 and l_0_12:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_13 = ((sigattr_tail[l_0_11]).utf8p1):lower()
    local l_0_14 = l_0_13:match("%.[^%.]+$")
    if l_0_14 and (mp.bitand)((mp.GetExtensionClass)(l_0_14), 3) ~= 0 then
      local l_0_15 = {}
      if l_0_1[l_0_13] == nil then
        l_0_1[l_0_13] = l_0_11
        for l_0_19,l_0_20 in (string.gmatch)(l_0_12, "(%w+):(%w+)") do
          l_0_15[l_0_19] = l_0_20
        end
        do
          do
            local l_0_21, l_0_26, l_0_28, l_0_32, l_0_33, l_0_34, l_0_38, l_0_41, l_0_47, l_0_49, l_0_54, l_0_59, l_0_66 = l_0_15.TotalSizeAppend and tonumber(l_0_15.TotalSizeAppend) or 0
            do
              local l_0_22, l_0_27, l_0_29, l_0_35, l_0_39, l_0_42, l_0_48, l_0_50, l_0_55, l_0_60, l_0_67 = , l_0_15.LastOff and tonumber(l_0_15.LastOff) or 0
              do
                local l_0_23, l_0_30, l_0_36, l_0_40, l_0_43, l_0_51, l_0_56, l_0_61, l_0_68 = , l_0_15.FirstOff and tonumber(l_0_15.FirstOff) or 0
                do
                  local l_0_24, l_0_31, l_0_37, l_0_44, l_0_52, l_0_57, l_0_62, l_0_69 = , l_0_15.NumWrites and tonumber(l_0_15.NumWrites) or 0
                  do
                    local l_0_25, l_0_45, l_0_53, l_0_58, l_0_63, l_0_70 = , l_0_15.BiggestOff and tonumber(l_0_15.BiggestOff) or 0
                    do
                      local l_0_46, l_0_64, l_0_71 = nil
                      do
                        do
                          local l_0_65, l_0_72 = nil
                          -- DECOMPILER ERROR at PC135: Confused about usage of register: R16 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC137: Confused about usage of register: R20 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC139: Confused about usage of register: R18 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC143: Confused about usage of register: R17 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC143: Confused about usage of register: R20 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC145: Confused about usage of register: R17 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC148: Confused about usage of register: R19 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC150: Confused about usage of register: R16 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC152: Confused about usage of register: R16 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC154: Unhandled construct in 'MakeBoolean' P1

                          if l_0_65 <= 16 and l_0_63 ~= 0 and l_0_71 == 0 and l_0_15.SmallestOff and tonumber(l_0_15.SmallestOff) or 0 == 0 and l_0_63 == l_0_72 and l_0_72 + 1 == l_0_15.TotalSizeWrite and tonumber(l_0_15.TotalSizeWrite) or 0 and l_0_58 > 0 and l_0_65 > 0 and l_0_65 <= 16 then
                            l_0_15.path = l_0_13
                            l_0_2[l_0_11] = l_0_15
                            l_0_3 = l_0_3 + 1
                          end
                          l_0_4 = l_0_4 + 1
                          -- DECOMPILER ERROR at PC159: Confused about usage of register: R19 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC161: Confused about usage of register: R18 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC163: Confused about usage of register: R21 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC165: Confused about usage of register: R17 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC167: Confused about usage of register: R20 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC167: Confused about usage of register: R17 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC169: Confused about usage of register: R20 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC170: Confused about usage of register: R22 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC172: Confused about usage of register: R16 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC172: Confused about usage of register: R22 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC174: Unhandled construct in 'MakeBoolean' P1

                          if l_0_58 == 1 and l_0_71 == 0 and l_0_15.SmallestOff and tonumber(l_0_15.SmallestOff) or 0 == 0 and l_0_72 ~= 0 and l_0_72 == l_0_63 and l_0_63 + 1 == l_0_15.TotalSizeWrite and tonumber(l_0_15.TotalSizeWrite) or 0 and l_0_15.TotalSizeWrite and tonumber(l_0_15.TotalSizeWrite) or 0 == l_0_65 then
                            l_0_15.path = l_0_13
                            l_0_5[l_0_11] = l_0_15
                            l_0_6 = l_0_6 + 1
                          end
                          l_0_7 = l_0_7 + 1
                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC179: LeaveBlock: unexpected jumping out IF_STMT

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
end
local l_0_73 = mp.CLEAN
if l_0_4 == 0 and l_0_3 >= 10 then
  l_0_73 = reportGenEncryption(l_0_2, 1)
else
  if l_0_7 == 0 and l_0_6 >= 10 then
    l_0_73 = reportGenEncryption(l_0_5, 2)
  end
end
if l_0_73 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN

