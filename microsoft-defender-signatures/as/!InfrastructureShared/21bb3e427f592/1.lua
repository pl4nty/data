-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21bb3e427f592\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 4
local l_0_1 = 1
local l_0_2 = nil
local l_0_3 = {}
local l_0_4 = nil
local l_0_5 = mp.SIGATTR_LOG_SZ
for l_0_9 = 1, l_0_5 do
  if (sigattr_tail[l_0_9]).attribute == 16491 and (sigattr_tail[l_0_9]).utf8p1 == "GenericRansomware:Type4" and (sigattr_tail[l_0_9]).utf8p2 ~= nil then
    l_0_2 = safeJsonDeserialize((sigattr_tail[l_0_9]).utf8p2)
    if l_0_2 then
      l_0_4 = l_0_2.appended_ext
      break
    end
  end
end
do
  local l_0_10 = 0
  local l_0_11 = 0
  local l_0_12 = {}
  local l_0_13 = {}
  if l_0_4 ~= nil then
    for l_0_17 = 1, l_0_5 do
      if (sigattr_tail[l_0_17]).attribute == 16384 and (sigattr_tail[l_0_17]).utf8p1 and ((sigattr_tail[l_0_17]).utf8p1):byte(1) ~= 37 then
        local l_0_18 = ((sigattr_tail[l_0_17]).utf8p1):lower()
        local l_0_19 = l_0_18:match("[^\\]+$")
        local l_0_20 = l_0_19:match("%.[^%.]+$")
        if l_0_20 and l_0_20 == l_0_4 and l_0_3[l_0_18] == nil then
          local l_0_21 = (string.sub)(l_0_19, 1, (string.len)(l_0_19) - (string.len)(l_0_20))
          local l_0_22 = l_0_21:match("%.[^%.]+$")
          if l_0_22 and l_0_13[l_0_22] == nil and (mp.GetExtensionClass)(l_0_20) == 0 and ((mp.GetExtensionClass)(l_0_22) == 255 or (mp.GetExtensionClass)(l_0_22) == 2 or (mp.GetExtensionClass)(l_0_22) == 3) then
            l_0_13[l_0_22] = l_0_17
            l_0_11 = l_0_11 + 1
          end
          local l_0_23 = l_0_18:match("^(.+)\\")
          if l_0_23 and l_0_12[l_0_23] == nil then
            l_0_12[l_0_23] = l_0_17
            l_0_10 = l_0_10 + 1
          end
          if l_0_0 <= l_0_11 and l_0_1 <= l_0_10 then
            local l_0_24 = {}
            local l_0_25 = {}
            for l_0_29,l_0_30 in pairs(l_0_13) do
              (table.insert)(l_0_24, l_0_29)
            end
            for l_0_34,l_0_35 in pairs(l_0_12) do
              (table.insert)(l_0_25, l_0_34)
            end
            local l_0_36 = {}
            l_0_36.ext_list = l_0_24
            l_0_36.dir_list = l_0_25
            l_0_36.enc_meta = l_0_2
            local l_0_37 = safeJsonSerialize(l_0_36)
            ;
            (bm.add_related_string)("gendfc_ransom_meta", l_0_37, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
          do
            do
              l_0_3[l_0_18] = l_0_17
              -- DECOMPILER ERROR at PC187: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC187: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC187: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC187: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC187: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  return mp.CLEAN
end

