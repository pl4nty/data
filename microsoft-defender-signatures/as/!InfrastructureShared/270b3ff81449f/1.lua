-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\270b3ff81449f\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[9]).matched or (this_sigattrlog[9]).utf8p2 == nil or (this_sigattrlog[10]).matched) and (this_sigattrlog[10]).utf8p2 ~= nil then
      local l_0_1 = (this_sigattrlog[9]).utf8p2
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[11]).matched or (this_sigattrlog[11]).utf8p2 == nil or (this_sigattrlog[12]).matched) and (this_sigattrlog[12]).utf8p2 ~= nil then
        local l_0_2 = (this_sigattrlog[11]).utf8p2
      else
      end
      -- DECOMPILER ERROR at PC96: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not (this_sigattrlog[13]).matched or (this_sigattrlog[13]).utf8p2 == nil or (this_sigattrlog[14]).matched) and (this_sigattrlog[14]).utf8p2 ~= nil then
          local l_0_3, l_0_4, l_0_5 = (this_sigattrlog[13]).utf8p2
        else
        end
        if not (this_sigattrlog[15]).matched or (this_sigattrlog[15]).utf8p2 == nil or (this_sigattrlog[15]).utf8p2 == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

        local l_0_6 = (string.lower)((this_sigattrlog[15]).utf8p2)
        local l_0_7 = {}
        -- DECOMPILER ERROR at PC130: No list found for R1 , SetList fails

        local l_0_8 = false
        -- DECOMPILER ERROR at PC132: Overwrote pending register: R3 in 'AssignReg'

        -- DECOMPILER ERROR at PC133: Overwrote pending register: R4 in 'AssignReg'

        for l_0_12,l_0_13 in ("\\start menu\\programs\\startup\\")("\\local\\temp\\") do
          -- DECOMPILER ERROR at PC136: Overwrote pending register: R8 in 'AssignReg'

          -- DECOMPILER ERROR at PC138: Overwrote pending register: R9 in 'AssignReg'

          if (("\\word\\startup\\").find)("\\excel\\xlstart\\", l_0_13, 1, true) then
            break
          end
        end
        do
          if not l_0_8 then
            return mp.CLEAN
          end
          local l_0_14 = (bm.get_imagepath)()
          do
            if not isnull(l_0_14) then
              local l_0_15 = (string.lower)(l_0_14)
              if (string.find)(l_0_15, "\\windows defender\\msmpeng.exe", 1, true) then
                return mp.CLEAN
              end
            end
            ;
            (bm.add_related_string)("ChildCmdline", l_0_6, bm.RelatedStringBMReport)
            add_parents()
            TrackPidAndTechniqueBM("BM", "T1203", "cve_2025_8088_archive_exec_chain")
            TrackPidAndTechniqueBM("BM", "T1059", "archive_post_extract_exec")
            return mp.INFECTED
          end
        end
      end
    end
  end
end

