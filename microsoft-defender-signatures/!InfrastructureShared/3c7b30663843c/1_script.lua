-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3c7b30663843c\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = 20
local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = 0
local l_0_7 = {}
l_0_7[".jslog"] = true
l_0_7[".rba"] = true
l_0_7[".kpf"] = true
l_0_7[".rsnd"] = true
l_0_7[".mcache"] = true
l_0_7[".plg"] = true
l_0_7[".bix"] = true
for l_0_11 = 1, l_0_1 do
  if (sigattr_tail[l_0_11]).attribute == 16384 and ((sigattr_tail[l_0_11]).utf8p1):byte(1) ~= 37 and (sigattr_tail[l_0_11]).utf8p1 then
    local l_0_12 = ((sigattr_tail[l_0_11]).utf8p1):lower()
    if l_0_3[l_0_12] == nil then
      l_0_3[l_0_12] = l_0_11
      l_0_6 = l_0_6 + 1
    end
  end
end
if l_0_6 > 10 then
  for l_0_16 = 1, l_0_1 do
    if (sigattr_tail[l_0_16]).attribute == 16389 and (sigattr_tail[l_0_16]).utf8p2 == "ATTR_d463ed8a" and not isnull((sigattr_tail[l_0_16]).utf8p1) then
      local l_0_17 = ((sigattr_tail[l_0_16]).utf8p1):lower()
      if l_0_4[l_0_17] == nil and l_0_3[l_0_17] ~= nil then
        l_0_4[l_0_17] = l_0_16
        local l_0_18 = l_0_17:match("%.[^%.]+$")
        if l_0_18 and (mp.GetExtensionClass)(l_0_18) == 0 and not l_0_7[l_0_18] then
          if l_0_5[l_0_18] ~= nil then
            (table.insert)(l_0_5[l_0_18], l_0_16)
          else
            local l_0_19 = {}
            -- DECOMPILER ERROR at PC109: No list found for R14 , SetList fails

          end
          do
            if #l_0_5[l_0_18] >= 10 then
              local l_0_20 = {}
              -- DECOMPILER ERROR at PC116: Overwrote pending register: R15 in 'AssignReg'

              local l_0_21 = l_0_16
              for l_0_25,l_0_26 in pairs(l_0_5[l_0_18]) do
                l_0_17 = ((sigattr_tail[l_0_26]).utf8p1):lower()
                local l_0_27 = l_0_3[l_0_17]
                local l_0_28 = {}
                for l_0_32,l_0_33 in (string.gmatch)((sigattr_tail[l_0_27]).utf8p2, "(%w+):(%w+)") do
                  l_0_28[l_0_32] = l_0_33
                end
                local l_0_34 = -1
                if l_0_28.FSize and tonumber(l_0_28.FSize) then
                  l_0_34 = tonumber(l_0_28.FSize)
                else
                  l_0_34 = (sysio.GetFileSize)(l_0_17)
                end
                if l_0_34 ~= nil and l_0_34 > 256 then
                  local l_0_35 = ""
                  local l_0_36 = 0
                  local l_0_37 = (sysio.ReadFile)(l_0_17, 0, 256)
                  if l_0_37 and not isnull(l_0_37) then
                    l_0_35 = (string.format)("\\x%02X\\x%02X", (string.byte)(l_0_37, 1, 2))
                    l_0_36 = (crypto.ComputeEntropy)(l_0_37)
                  end
                  if l_0_36 >= 7 then
                    l_0_20[l_0_35] = 1
                    local l_0_38 = {}
                    l_0_38.path = l_0_17
                    l_0_38.magic = l_0_35
                    l_0_38.enc_filesize = l_0_34
                    l_0_38.entropy = l_0_36
                    ;
                    (table.insert)(l_0_2, l_0_38)
                    l_0_21 = l_0_21 + 1
                    if l_0_21 > 5 then
                      local l_0_39 = 0
                      for l_0_43 in pairs(l_0_20) do
                        l_0_39 = l_0_39 + 1
                      end
                      if l_0_39 > 1 then
                        local l_0_44 = {}
                        l_0_44.appended_ext = l_0_18
                        l_0_44.isMagicMismatch = true
                        l_0_44.file_list = l_0_2
                        ;
                        (bm.trigger_sig)("GenericRansomware:UnknownFileMeta", safeJsonSerialize(l_0_44))
                        ;
                        (bm.add_related_string)("genda_create_ransom_meta", safeJsonSerialize(l_0_44), bm.RelatedStringBMReport)
                        return mp.INFECTED
                      end
                    end
                  end
                end
              end
            end
            do
              -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC245: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  if l_0_0 < l_0_6 then
    (bm.trigger_sig)("Exclude", "NoRansomCreateFile")
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC256: Confused about usage of register R11 for local variables in 'ReleaseLocals'


