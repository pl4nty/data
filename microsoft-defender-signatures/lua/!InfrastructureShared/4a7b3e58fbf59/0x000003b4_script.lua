-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4a7b3e58fbf59\0x000003b4_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil and (this_sigattrlog[10]).utf8p2 ~= nil then
  local l_0_0, l_0_1 = nil, nil
  l_0_1 = (this_sigattrlog[10]).utf8p2
  local l_0_2 = nil
else
end
do
  -- DECOMPILER ERROR at PC61: Overwrote pending register: R0 in 'AssignReg'

  if (not (this_sigattrlog[11]).matched or not (this_sigattrlog[11]).utf8p1 or (this_sigattrlog[11]).utf8p2 == nil or (this_sigattrlog[12]).matched) and (this_sigattrlog[12]).utf8p1 and (this_sigattrlog[12]).utf8p2 ~= nil then
    local l_0_3, l_0_4 = (this_sigattrlog[11]).utf8p1, (this_sigattrlog[11]).utf8p2
    l_0_4 = (this_sigattrlog[12]).utf8p2
    local l_0_5 = nil
  else
  end
  do
    -- DECOMPILER ERROR at PC105: Overwrote pending register: R0 in 'AssignReg'

    if (not (this_sigattrlog[13]).matched or not (this_sigattrlog[13]).utf8p1 or (this_sigattrlog[13]).utf8p2 == nil or (this_sigattrlog[14]).matched) and (this_sigattrlog[14]).utf8p1 and (this_sigattrlog[14]).utf8p2 ~= nil then
      local l_0_6, l_0_7 = (this_sigattrlog[13]).utf8p1, (this_sigattrlog[13]).utf8p2
      l_0_7 = (this_sigattrlog[14]).utf8p2
      local l_0_8 = nil
    else
    end
    do
      -- DECOMPILER ERROR at PC149: Overwrote pending register: R0 in 'AssignReg'

      if (not (this_sigattrlog[15]).matched or not (this_sigattrlog[15]).utf8p1 or (this_sigattrlog[15]).utf8p2 == nil or (this_sigattrlog[16]).matched) and (this_sigattrlog[16]).utf8p1 and (this_sigattrlog[16]).utf8p2 ~= nil then
        local l_0_9, l_0_10 = (this_sigattrlog[15]).utf8p1, (this_sigattrlog[15]).utf8p2
        l_0_10 = (this_sigattrlog[16]).utf8p2
        local l_0_11 = nil
      else
      end
      do
        -- DECOMPILER ERROR at PC193: Overwrote pending register: R0 in 'AssignReg'

        if (not (this_sigattrlog[17]).matched or not (this_sigattrlog[17]).utf8p1 or (this_sigattrlog[17]).utf8p2 == nil or (this_sigattrlog[18]).matched) and (this_sigattrlog[18]).utf8p1 and (this_sigattrlog[18]).utf8p2 ~= nil then
          local l_0_12, l_0_13, l_0_15, l_0_16, l_0_17, l_0_19, l_0_21, l_0_22, l_0_24 = (this_sigattrlog[17]).utf8p1, (this_sigattrlog[17]).utf8p2
          l_0_15 = this_sigattrlog
          l_0_15 = l_0_15[18]
          l_0_13 = l_0_15.utf8p2
          local l_0_14, l_0_18, l_0_20, l_0_23, l_0_25 = nil
        else
        end
        do
          -- DECOMPILER ERROR at PC221: Confused about usage of register: R0 in 'UnsetPending'

          -- DECOMPILER ERROR at PC225: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC229: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC229: Unhandled construct in 'MakeBoolean' P3

          if ((this_sigattrlog[19]).matched and (this_sigattrlog[19]).utf8p1 and (this_sigattrlog[19]).utf8p2 ~= nil and (this_sigattrlog[19]).utf8p1 == "") or (this_sigattrlog[19]).utf8p2 == nil then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC230: Confused about usage of register: R0 in 'UnsetPending'

          -- DECOMPILER ERROR at PC232: Confused about usage of register: R1 in 'UnsetPending'

          local l_0_26 = nil
          ;
          (bm.add_related_string)("file_metadata", (this_sigattrlog[19]).utf8p1 .. "|" .. (this_sigattrlog[19]).utf8p2, bm.RelatedStringBMReport)
          TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_MountedScriptExecution")
          addRelatedProcess()
          reportRelatedBmHits()
          return mp.INFECTED
        end
      end
    end
  end
end

