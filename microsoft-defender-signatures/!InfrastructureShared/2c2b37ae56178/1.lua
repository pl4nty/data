-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c2b37ae56178\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = (bm.get_sig_count)()
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = l_0_6:match("[^\\]+$")
if not l_0_7 or l_0_7 ~= "python.exe" then
  return mp.CLEAN
end
if not IsProcNameInParentProcessTree("BM", "ai_exec_server.exe") and not IsProcNameInParentProcessTree("BM", "airuncommandasuser.exe") then
  return mp.CLEAN
end
for l_0_11 = 1, l_0_0 do
  if (sigattr_tail[l_0_11]).utf8p1 and ((sigattr_tail[l_0_11]).utf8p1):byte(1) ~= 37 then
    if (sigattr_tail[l_0_11]).attribute == 16387 then
      local l_0_12 = ((sigattr_tail[l_0_11]).utf8p1):lower()
      if l_0_4[l_0_12] == nil then
        l_0_4[l_0_12] = l_0_11
        l_0_2 = l_0_2 + 1
      end
    else
      do
        do
          if (sigattr_tail[l_0_11]).attribute == 16385 then
            local l_0_13 = ((sigattr_tail[l_0_11]).utf8p1):lower()
            if l_0_5[l_0_13] == nil then
              l_0_5[l_0_13] = l_0_11
              l_0_3 = l_0_3 + 1
            end
          end
          -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
if l_0_2 < 5 or l_0_3 < 5 then
  return mp.CLEAN
end
local l_0_14 = 0
local l_0_15 = {}
local l_0_16 = {}
for l_0_20 = 1, l_0_0 do
  if (sigattr_tail[l_0_20]).attribute == 16384 and (sigattr_tail[l_0_20]).utf8p1 and ((sigattr_tail[l_0_20]).utf8p1):byte(1) ~= 37 then
    local l_0_21 = ((sigattr_tail[l_0_20]).utf8p1):lower()
    if l_0_16[l_0_21] == nil then
      l_0_16[l_0_21] = l_0_20
      local l_0_22 = l_0_21:match("[^\\]+$")
      local l_0_23, l_0_24 = l_0_22:gsub("%.", ".")
      if l_0_24 >= 2 then
        local l_0_25 = l_0_22:match("%.[^%.]+$")
        if l_0_15[l_0_25] ~= nil then
          (table.insert)(l_0_15[l_0_25], l_0_20)
        else
          local l_0_26 = {}
          -- DECOMPILER ERROR at PC161: No list found for R20 , SetList fails

        end
      end
    end
  end
end
if l_0_14 < 5 then
  return mp.CLEAN
end
local l_0_27 = {}
for l_0_31,l_0_32 in pairs(l_0_15) do
  if #l_0_15[l_0_31] >= 4 then
    local l_0_33 = (string.len)(l_0_31)
    for l_0_37,l_0_38 in pairs(l_0_32) do
      local l_0_39 = ((sigattr_tail[l_0_38]).utf8p1):lower()
      if l_0_4[l_0_39] ~= nil then
        local l_0_40 = (string.len)(l_0_39)
        if l_0_33 < l_0_40 then
          local l_0_41 = (string.sub)(l_0_39, 1, l_0_40 - l_0_33)
          if l_0_5[l_0_41] then
            (table.insert)(l_0_27, l_0_41)
            if #l_0_27 >= 4 then
              local l_0_42 = {}
              for l_0_46,l_0_47 in pairs(l_0_27) do
                (table.insert)(l_0_42, l_0_47)
              end
              local l_0_48 = (bm.get_imagepath)()
              -- DECOMPILER ERROR at PC242: Overwrote pending register: R27 in 'AssignReg'

              if isnull(l_0_48) then
                local l_0_49 = (bm.get_current_process_startup_info)()
                -- DECOMPILER ERROR at PC253: Overwrote pending register: R28 in 'AssignReg'

                if isnull(l_0_49) then
                  local l_0_50 = {}
                  do
                    local l_0_51 = safeJsonSerialize(l_0_50)
                    ;
                    (bm.add_related_string)("genq_ransom_meta", l_0_51, bm.RelatedStringBMReport)
                    reportGenericRansomware(l_0_51, true)
                    do return mp.INFECTED end
                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

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
do return mp.CLEAN end
-- DECOMPILER ERROR at PC283: Confused about usage of register R12 for local variables in 'ReleaseLocals'

-- WARNING: undefined locals caused missing assignments!

