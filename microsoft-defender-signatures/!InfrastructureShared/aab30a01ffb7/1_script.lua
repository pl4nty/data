-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\aab30a01ffb7\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_2 = {}
  for l_0_6 = 1, l_0_0 do
    if (sigattr_tail[l_0_6]).attribute == 16387 and (sigattr_tail[l_0_6]).utf8p1 then
      l_0_2[((sigattr_tail[l_0_6]).utf8p1):lower()] = l_0_6
      l_0_1 = l_0_1 + 1
    end
  end
  local l_0_7 = {}
  if l_0_1 >= 5 and (this_sigattrlog[1]).utf8p2 then
    local l_0_8 = {}
    local l_0_9 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
    for l_0_13,l_0_14 in pairs(l_0_9.file_list) do
      for l_0_18,l_0_19 in pairs(l_0_2) do
        if #l_0_18 < #l_0_14 and l_0_14:find(l_0_18, 1, true) == 1 and l_0_14:byte(#l_0_18 + 1) ~= 58 then
          local l_0_20 = (string.sub)(l_0_14, #l_0_18 + 1)
          if l_0_20:find("\\", 1, true) == nil then
            if l_0_7[l_0_20] ~= nil then
              (table.insert)(l_0_7[l_0_20], l_0_19)
            else
              local l_0_21 = {}
              -- DECOMPILER ERROR at PC99: No list found for R17 , SetList fails

            end
            do
              do
                -- DECOMPILER ERROR at PC106: Overwrote pending register: R18 in 'AssignReg'

                if #l_0_7[l_0_20] >= 3 then
                  for l_0_25,l_0_26 in pairs(l_0_19) do
                    (table.insert)(l_0_8, (sigattr_tail[l_0_26]).utf8p1)
                  end
                  local l_0_27 = {}
                  l_0_27.appended_ext = l_0_20
                  l_0_27.encrypted_file_meta = l_0_8
                  ;
                  (bm.trigger_sig)("GenericRansomware:Type4.2", safeJsonSerialize(l_0_27))
                  return mp.INFECTED
                end
                do break end
                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
end
l_0_2 = mp
l_0_2 = l_0_2.CLEAN
return l_0_2

