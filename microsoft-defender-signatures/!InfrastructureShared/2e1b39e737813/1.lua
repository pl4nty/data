-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2e1b39e737813\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil and l_0_0 ~= "" then
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC16: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC17: Overwrote pending register: R2 in 'AssignReg'

  local l_0_2 = ".pdf"
  -- DECOMPILER ERROR at PC18: Overwrote pending register: R3 in 'AssignReg'

  if ((".rtf")[13]).matched and (this_sigattrlog[13]).utf8p1 ~= nil and (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p1 ~= nil then
    local l_0_3 = false
    -- DECOMPILER ERROR at PC39: Overwrote pending register: R4 in 'AssignReg'

    local l_0_4 = ((".docx")[13]).utf8p1
    -- DECOMPILER ERROR at PC42: Overwrote pending register: R5 in 'AssignReg'

    local l_0_5 = ((".doc")[14]).utf8p1
    -- DECOMPILER ERROR at PC45: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC46: Overwrote pending register: R7 in 'AssignReg'

    for l_0_9,l_0_10 in (".xls")(".xlsx") do
      if l_0_4:sub(-1 * #l_0_10) == l_0_10 then
        local l_0_11 = l_0_10 .. "."
      end
    end
    if not (string.find)(l_0_5, l_0_11, 1, true) or l_0_3 == false then
      return mp.CLEAN
    end
  end
  do
    -- DECOMPILER ERROR at PC76: Overwrote pending register: R3 in 'AssignReg'

    if (l_0_3[15]).matched and (this_sigattrlog[15]).utf8p1 ~= nil and (this_sigattrlog[16]).matched and (this_sigattrlog[16]).utf8p1 ~= nil then
      local l_0_12 = false
      local l_0_13 = (this_sigattrlog[15]).utf8p1
      local l_0_14 = (this_sigattrlog[16]).utf8p1
      for l_0_18,l_0_19 in ipairs(l_0_1) do
        if l_0_13:sub(-1 * #l_0_19) == l_0_19 then
          local l_0_20 = l_0_19 .. "."
          -- DECOMPILER ERROR at PC126: Overwrote pending register: R2 in 'AssignReg'

        end
      end
      if not (string.find)(l_0_14, l_0_20, 1, true) or l_0_12 == false then
        return mp.CLEAN
      end
    end
    do
      -- DECOMPILER ERROR at PC134: Overwrote pending register: R3 in 'AssignReg'

      if (l_0_12[17]).matched and (this_sigattrlog[17]).utf8p1 ~= nil and (this_sigattrlog[18]).matched and (this_sigattrlog[18]).utf8p1 ~= nil then
        local l_0_21 = false
        local l_0_22 = (this_sigattrlog[17]).utf8p1
        local l_0_23 = (this_sigattrlog[18]).utf8p1
        for l_0_27,l_0_28 in ipairs(l_0_1) do
          if l_0_22:sub(-1 * #l_0_28) == l_0_28 then
            local l_0_29 = l_0_28 .. "."
            -- DECOMPILER ERROR at PC184: Overwrote pending register: R2 in 'AssignReg'

          end
        end
        if not (string.find)(l_0_23, l_0_29, 1, true) or l_0_21 == false then
          return mp.CLEAN
        end
      end
      do
        -- DECOMPILER ERROR at PC192: Overwrote pending register: R3 in 'AssignReg'

        if (l_0_21[19]).matched and (this_sigattrlog[19]).utf8p1 ~= nil and (this_sigattrlog[20]).matched and (this_sigattrlog[20]).utf8p1 ~= nil then
          local l_0_30 = false
          local l_0_31 = (this_sigattrlog[19]).utf8p1
          local l_0_32 = (this_sigattrlog[20]).utf8p1
          for l_0_36,l_0_37 in ipairs(l_0_1) do
            if l_0_31:sub(-1 * #l_0_37) == l_0_37 then
              local l_0_38 = l_0_37 .. "."
              -- DECOMPILER ERROR at PC242: Overwrote pending register: R2 in 'AssignReg'

            end
          end
          if not (string.find)(l_0_32, l_0_38, 1, true) or l_0_30 == false then
            return mp.CLEAN
          end
        end
        do
          -- DECOMPILER ERROR at PC250: Overwrote pending register: R3 in 'AssignReg'

          if (l_0_30[21]).matched and (this_sigattrlog[21]).utf8p1 ~= nil and (this_sigattrlog[22]).matched and (this_sigattrlog[22]).utf8p1 ~= nil then
            local l_0_39 = false
            local l_0_40 = (this_sigattrlog[21]).utf8p1
            local l_0_41 = (this_sigattrlog[22]).utf8p1
            for l_0_45,l_0_46 in ipairs(l_0_1) do
              if l_0_40:sub(-1 * #l_0_46) == l_0_46 then
                local l_0_47 = l_0_46 .. "."
                -- DECOMPILER ERROR at PC300: Overwrote pending register: R2 in 'AssignReg'

              end
            end
            if not (string.find)(l_0_41, l_0_47, 1, true) or l_0_39 == false then
              return mp.CLEAN
            end
          end
          do
            do
              do
                -- DECOMPILER ERROR at PC310: Overwrote pending register: R3 in 'AssignReg'

                if l_0_2 == 5 then
                  l_0_39()
                  reportRelatedBmHits()
                  ;
                  (bm.add_related_string)("ImagePath", l_0_0, bm.RelatedStringBMReport)
                  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
                  return mp.INFECTED
                end
                do return mp.CLEAN end
                -- WARNING: undefined locals caused missing assignments!
              end
            end
          end
        end
      end
    end
  end
end

