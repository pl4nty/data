-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\16ab32c8884e8\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC37: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
      local l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p1)
    else
    end
    -- DECOMPILER ERROR at PC63: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[4]).matched or (this_sigattrlog[5]).matched then
        local l_0_2, l_0_3, l_0_4 = (string.lower)((this_sigattrlog[4]).utf8p1)
      else
      end
      if (this_sigattrlog[6]).matched then
        local l_0_5 = nil
        if not ((string.lower)((this_sigattrlog[6]).utf8p1)):match("([^\\]+)$") then
          return mp.CLEAN
        end
        local l_0_6 = nil
        if GetRollingQueueKeyValue("app_version_" .. ((string.lower)((this_sigattrlog[6]).utf8p1)):match("([^\\]+)$"), l_0_5) == nil then
          local l_0_7 = nil
          if not (sysio.GetPEFixedVersionInfo)(l_0_5) then
            return mp.CLEAN
          end
          local l_0_8 = nil
          local l_0_9 = ((sysio.GetPEFixedVersionInfo)(l_0_5)).FileVersion
          local l_0_10 = "app_version_" .. l_0_6
          local l_0_11 = 31536000
          if l_0_9 ~= nil then
            local l_0_12 = 50
            AppendToRollingQueue(l_0_10, l_0_5, Version_to_str(l_0_9), l_0_11, l_0_12)
            ;
            (bm.add_related_string)("AppVersion", Version_to_str(l_0_9), bm.RelatedStringBMReport)
            if l_0_8.OriginalFilename then
              (bm.add_related_string)("OFN", l_0_8.OriginalFilename, bm.RelatedStringBMReport)
            end
          end
        else
          do
            -- DECOMPILER ERROR at PC141: Confused about usage of register: R2 in 'UnsetPending'

            ;
            (bm.add_related_string)("AppVersion", l_0_7, bm.RelatedStringBMReport)
            do
              if GetRollingQueueKeyValue("app_version_timer" .. l_0_6, l_0_5) == nil then
                local l_0_13, l_0_17, l_0_18 = , (MpCommon.GetCurrentTimeT)()
                l_0_18 = "app_version_timer"
                l_0_18 = l_0_18 .. l_0_6
                local l_0_14 = nil
                l_0_14 = 31536000
                local l_0_15 = nil
                l_0_15 = 50
                local l_0_16 = nil
                l_0_16 = AppendToRollingQueue
                l_0_16(l_0_18, l_0_5, l_0_17, l_0_14, l_0_15)
                l_0_16 = bm
                l_0_16 = l_0_16.add_related_string
                l_0_16("VerLastSent", l_0_17, bm.RelatedStringBMReport)
                l_0_16 = mp
                l_0_16 = l_0_16.INFECTED
                return l_0_16
              end
              local l_0_19 = nil
              -- DECOMPILER ERROR at PC182: Confused about usage of register: R3 in 'UnsetPending'

              local l_0_20 = nil
              if ((MpCommon.GetCurrentTimeT)() - l_0_17) / 60 <= 21600 then
                return mp.CLEAN
              end
              local l_0_24 = nil
              do
                local l_0_25 = nil
                AppendToRollingQueue("app_version_timer" .. l_0_6, l_0_5, l_0_24, 31536000, 50)
                do return mp.INFECTED end
                -- DECOMPILER ERROR: 2 unprocessed JMP targets
              end
            end
          end
        end
      end
    end
  end
end

