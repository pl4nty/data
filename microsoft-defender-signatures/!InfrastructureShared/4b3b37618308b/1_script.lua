-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4b3b37618308b\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = 0
local l_0_2 = 0
local l_0_3 = {}
local l_0_4 = {}
for l_0_8 = 1, l_0_0 do
  if (sigattr_tail[l_0_8]).utf8p1 and ((sigattr_tail[l_0_8]).utf8p1):byte(1) ~= 37 then
    if (sigattr_tail[l_0_8]).attribute == 16387 then
      local l_0_9 = ((sigattr_tail[l_0_8]).utf8p1):lower()
      if l_0_3[l_0_9] == nil then
        l_0_3[l_0_9] = l_0_8
        l_0_1 = l_0_1 + 1
      end
    else
      do
        do
          if (sigattr_tail[l_0_8]).attribute == 16385 then
            local l_0_10 = ((sigattr_tail[l_0_8]).utf8p1):lower()
            if l_0_4[l_0_10] == nil then
              l_0_4[l_0_10] = l_0_8
              l_0_2 = l_0_2 + 1
            end
          end
          -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
if l_0_1 < 5 or l_0_2 < 5 then
  return mp.CLEAN
end
local l_0_11 = 0
local l_0_12 = {}
local l_0_13 = {}
for l_0_17 = 1, l_0_0 do
  if (sigattr_tail[l_0_17]).attribute == 16384 and (sigattr_tail[l_0_17]).utf8p1 and ((sigattr_tail[l_0_17]).utf8p1):byte(1) ~= 37 then
    local l_0_18 = ((sigattr_tail[l_0_17]).utf8p1):lower()
    if l_0_13[l_0_18] == nil then
      l_0_13[l_0_18] = l_0_17
      local l_0_19 = l_0_18:match("[^\\]+$")
      local l_0_20, l_0_21 = l_0_19:gsub("%.", ".")
      if l_0_21 >= 2 then
        local l_0_22 = l_0_19:match("%.[^%.]+$")
        if l_0_12[l_0_22] ~= nil then
          (table.insert)(l_0_12[l_0_22], l_0_17)
        else
          local l_0_23 = {}
          -- DECOMPILER ERROR at PC119: No list found for R17 , SetList fails

        end
      end
    end
  end
end
if l_0_11 < 5 then
  return mp.CLEAN
end
local l_0_24 = {}
for l_0_28,l_0_29 in pairs(l_0_12) do
  if #l_0_12[l_0_28] >= 5 then
    local l_0_30 = (string.len)(l_0_28)
    for l_0_34,l_0_35 in pairs(l_0_29) do
      local l_0_36 = ((sigattr_tail[l_0_35]).utf8p1):lower()
      if l_0_3[l_0_36] ~= nil then
        local l_0_37 = (string.len)(l_0_36)
        if l_0_30 < l_0_37 then
          local l_0_38 = (string.sub)(l_0_36, 1, l_0_37 - l_0_30)
          if l_0_4[l_0_38] then
            (table.insert)(l_0_24, l_0_38)
            if #l_0_24 >= 5 then
              local l_0_39 = {}
              for l_0_43,l_0_44 in pairs(l_0_24) do
                local l_0_45 = table.insert
                local l_0_46 = l_0_39
                local l_0_47 = {}
                l_0_45(l_0_46, l_0_47)
              end
              local l_0_48 = {}
              local l_0_49 = safeJsonSerialize(l_0_48)
              ;
              (bm.trigger_sig)("GenericRansomware:BackupEncRestore", l_0_49)
              ;
              (bm.add_related_string)("genh_ransom_meta", l_0_49, bm.RelatedStringBMReport)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC217: Confused about usage of register R9 for local variables in 'ReleaseLocals'

-- WARNING: undefined locals caused missing assignments!

