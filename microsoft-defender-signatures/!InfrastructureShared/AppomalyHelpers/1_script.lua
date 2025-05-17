-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\AppomalyHelpers\1_luac 

-- params : ...
-- function num : 0
getWebApplicationType = function(l_1_0)
  -- function num : 0_0
  if not (mp.GetProcessCommandLine)(l_1_0) then
    local l_1_1 = ""
  else
    do
      -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

      do
        local l_1_2 = (string.lower)(l_1_1)
        local l_1_3 = nil
        -- DECOMPILER ERROR at PC18: Overwrote pending register: R2 in 'AssignReg'

        if not l_1_3 then
          local l_1_4 = (string.lower)((bm.get_imagepath)())
          -- DECOMPILER ERROR at PC35: Overwrote pending register: R3 in 'AssignReg'

          -- DECOMPILER ERROR at PC38: Confused about usage of register: R3 in 'UnsetPending'

          if contains(l_1_4, "w3wp.exe") and nil then
            return nil
          end
          local l_1_5 = nil
          local l_1_6 = checkParentCmdlineCaseInsensitive
          local l_1_7 = l_1_0
          do
            local l_1_8 = {}
            -- DECOMPILER ERROR at PC47: No list found for R6 , SetList fails

            -- DECOMPILER ERROR at PC48: Overwrote pending register: R7 in 'AssignReg'

            l_1_6 = l_1_6(l_1_7, l_1_8, {"w3wp.exe", "-ap"})
            if l_1_8 then
              l_1_5 = ((string.lower)(R8_PC55)):match("-ap \"(%w+)\"")
              if l_1_5 then
                return l_1_5
              end
            end
            -- DECOMPILER ERROR at PC75: Confused about usage of register: R3 in 'UnsetPending'

            if contains(l_1_4, "sqlservr.exe") and l_1_3:match("-s([%w-._]+)") then
              return l_1_3:match("-s([%w-._]+)")
            end
            local l_1_9 = nil
            local l_1_10 = checkParentCmdlineCaseInsensitive
            local l_1_11 = l_1_0
            do
              local l_1_12 = {}
              -- DECOMPILER ERROR at PC81: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC84: No list found for R6 , SetList fails

              -- DECOMPILER ERROR at PC85: Overwrote pending register: R7 in 'AssignReg'

              l_1_10 = l_1_10(l_1_11, l_1_12, {R8_PC55, "-s"})
              -- DECOMPILER ERROR at PC91: Overwrote pending register: R8 in 'AssignReg'

              -- DECOMPILER ERROR at PC93: Overwrote pending register: R8 in 'AssignReg'

              if l_1_12 then
                l_1_9 = ((string.lower)(R8_PC55)):match("-s([%w-._]+)")
                if l_1_9 then
                  return l_1_9
                end
              end
              -- DECOMPILER ERROR at PC112: Confused about usage of register: R3 in 'UnsetPending'

              if contains(l_1_4, "java.exe") and l_1_3:match("-d([%w]+).home=") then
                return l_1_3:match("-d([%w]+).home=")
              end
              local l_1_13 = nil
              local l_1_14 = checkParentCmdlineCaseInsensitive
              local l_1_15 = l_1_0
              do
                local l_1_16 = {}
                -- DECOMPILER ERROR at PC118: Overwrote pending register: R8 in 'AssignReg'

                -- DECOMPILER ERROR at PC121: No list found for R6 , SetList fails

                -- DECOMPILER ERROR at PC122: Overwrote pending register: R7 in 'AssignReg'

                l_1_14 = l_1_14(l_1_15, l_1_16, {R8_PC55, ".home"})
                -- DECOMPILER ERROR at PC128: Overwrote pending register: R8 in 'AssignReg'

                -- DECOMPILER ERROR at PC130: Overwrote pending register: R8 in 'AssignReg'

                if l_1_16 then
                  l_1_13 = ((string.lower)(R8_PC55)):match("-d([%w]+).home=")
                  if l_1_13 then
                    return l_1_13
                  end
                end
                if contains(l_1_4, "ruby.exe") and R3_PC150 then
                  return R3_PC150
                end
                local l_1_17 = nil
                local l_1_18 = {}
                local l_1_19 = {"ruby.exe", "mongrel"}
                -- DECOMPILER ERROR at PC161: Overwrote pending register: R8 in 'AssignReg'

                local l_1_20 = {"ruby.exe", R8_PC55}
                -- DECOMPILER ERROR at PC164: Overwrote pending register: R8 in 'AssignReg'

                local l_1_21 = {R8_PC55, "thin"}
                do
                  local l_1_22 = R8_PC55
                  -- DECOMPILER ERROR at PC175: No list found for R4 , SetList fails

                  l_1_19 = checkParentCmdlineCaseInsensitive
                  l_1_20 = l_1_0
                  l_1_21 = l_1_18
                  -- DECOMPILER ERROR at PC179: Overwrote pending register: R8 in 'AssignReg'

                  l_1_19 = l_1_19(l_1_20, l_1_21, l_1_22)
                  -- DECOMPILER ERROR at PC183: Overwrote pending register: R9 in 'AssignReg'

                  -- DECOMPILER ERROR at PC189: Overwrote pending register: R8 in 'AssignReg'

                  if l_1_21 and l_1_17 then
                    return l_1_17
                  end
                  return "unknown"
                end
              end
            end
          end
        end
      end
    end
  end
end

IsAppomalyTrackedProcess = function(l_2_0, l_2_1)
  -- function num : 0_1
  if not l_2_0 then
    return 
  end
  if not l_2_1 then
    l_2_1 = 4
  end
  local l_2_2 = {}
  local l_2_3 = {}
  -- DECOMPILER ERROR at PC10: No list found for R3 , SetList fails

  local l_2_4 = {}
  -- DECOMPILER ERROR at PC12: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC14: No list found for R4 , SetList fails

  local l_2_5 = {}
  -- DECOMPILER ERROR at PC16: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC18: No list found for R5 , SetList fails

  local l_2_6 = {}
  -- DECOMPILER ERROR at PC20: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC22: No list found for R6 , SetList fails

  local l_2_7 = {}
  -- DECOMPILER ERROR at PC24: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC26: No list found for R7 , SetList fails

  local l_2_8 = {}
  -- DECOMPILER ERROR at PC28: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC30: No list found for R8 , SetList fails

  local l_2_9 = {}
  -- DECOMPILER ERROR at PC32: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC34: No list found for R9 , SetList fails

  local l_2_10 = {}
  -- DECOMPILER ERROR at PC36: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC38: No list found for R10 , SetList fails

  local l_2_11 = {}
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC42: No list found for R11 , SetList fails

  local l_2_12 = {}
  -- DECOMPILER ERROR at PC44: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: No list found for R12 , SetList fails

  local l_2_13 = {}
  -- DECOMPILER ERROR at PC48: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: No list found for R13 , SetList fails

  local l_2_14 = {}
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC54: No list found for R14 , SetList fails

  -- DECOMPILER ERROR at PC55: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC57: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC63: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC85: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC86: Overwrote pending register: R7 in 'AssignReg'

  if (not l_2_3 and l_2_4) or not l_2_5 then
    do
      for l_2_9,l_2_10 in l_2_6 do
        -- DECOMPILER ERROR at PC95: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC95: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC96: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC100: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC101: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC102: Overwrote pending register: R13 in 'AssignReg'

        if l_2_11 and l_2_11 then
          return l_2_11, l_2_12, l_2_13
        end
      end
      -- DECOMPILER ERROR at PC106: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC107: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC114: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC115: Overwrote pending register: R12 in 'AssignReg'

      if l_2_6(l_2_7, l_2_2, l_2_1) then
        return true, l_2_11, l_2_12
      end
      do return false end
      -- DECOMPILER ERROR at PC119: Confused about usage of register R10 for local variables in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

CommandLineTokenizer = function(l_3_0)
  -- function num : 0_2
  if #l_3_0 > 1000 then
    l_3_0 = l_3_0:sub(1, 1000)
  end
  local l_3_1 = {}
  l_3_0 = (string.lower)(l_3_0)
  l_3_0 = (MpCommon.NormalizeString)(l_3_0, "CmdLineNormalizationStandard")
  l_3_0 = l_3_0:gsub("(%w:\\[^\"\']*)\\([^\'\"%s\\]+)%.(exe)([\"\'])", "FILEPATH\\%2.exe%4")
  l_3_0 = l_3_0:gsub("(%w:\\[^\"\']*)\\([^\'\"%s\\]+)%.(%w+)([\"\'])", "FILEPATH\\FILENAME.%3%4")
  l_3_0 = l_3_0:gsub("(%w:\\[^\"\'%s]*)\\([^\'\"\\%s]+)%.(%w+)", "FILEPATH\\FILENAME.%3")
  l_3_0 = l_3_0:gsub("(%w:\\[^\"\'%s]*)", "FILEPATH")
  l_3_0 = l_3_0:gsub("(%w:/[^/][^\"\']*)/([^\'\"%s/]+)%.(exe)([\"\'])", "FILEPATH\\%2.exe%4")
  l_3_0 = l_3_0:gsub("(%w:/[^/][^\"\']*)/([^\'\"%s]+)%.(%w+)([\"\'])", "FILEPATH\\FILENAME.%3%4")
  l_3_0 = l_3_0:gsub("(%w:/[^/][^\"\'%s]*)/([^\'\"/%s]+)%.(%w+)", "FILEPATH\\FILENAME.%3")
  l_3_0 = l_3_0:gsub("(%w:/[^/][^\"\'%s]*)", "FILEPATH")
  local l_3_2 = {}
  -- DECOMPILER ERROR at PC73: No list found for R2 , SetList fails

  local l_3_3 = {}
  -- DECOMPILER ERROR at PC75: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC82: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC83: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC85: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC87: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC88: Overwrote pending register: R4 in 'AssignReg'

  local l_3_4 = "%("
  -- DECOMPILER ERROR at PC89: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC92: Overwrote pending register: R7 in 'AssignReg'

  local l_3_5, l_3_6 = (("%)").StringRegExpSearch)("%[", "%]")
  -- DECOMPILER ERROR at PC97: Overwrote pending register: R8 in 'AssignReg'

  if l_3_5 then
    for l_3_10,l_3_11 in ipairs("%+") do
      -- DECOMPILER ERROR at PC100: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC100: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC101: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC102: Overwrote pending register: R15 in 'AssignReg'

    end
  end
  do
    local l_3_12 = "%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?"
    -- DECOMPILER ERROR at PC119: Overwrote pending register: R0 in 'AssignReg'

    local l_3_13 = "%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x"
    -- DECOMPILER ERROR at PC125: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC130: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC137: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC144: Overwrote pending register: R0 in 'AssignReg'

    local l_3_14 = {}
    for l_3_18 in l_3_0:gmatch("%S+") do
      if #l_3_14 > 30 then
        break
      end
      if not l_3_18:match("^%d+$") and #l_3_18 > 3 then
        (table.insert)(l_3_14, l_3_18)
      end
    end
    do
      return l_3_14
    end
  end
end

UrlGrader = function(l_4_0, l_4_1, l_4_2)
  -- function num : 0_3
  if l_4_2 == nil then
    l_4_2 = true
  end
  local l_4_3 = 0
  local l_4_4 = {}
  if not l_4_0 then
    return 0, l_4_4
  end
  local l_4_5 = l_4_0:match("^%a+://([^:/]+)")
  if l_4_5 and not l_4_5:find("%.") then
    return 0, l_4_4
  end
  if l_4_0:find("https?://+", 1, true) then
    l_4_4.URL_CLEAN = "LOCALHOST"
    l_4_4.Url_Score = 0
    return 0, l_4_4
  end
  if l_4_0:find("localhost", 1, true) or l_4_0:find("127.0.0.1", 1, true) or l_4_0:find("0.0.0.0", 1, true) or l_4_0:find("https?://%[fd00[%x:]*%]", 1, false) then
    l_4_4.URL_CLEAN = "LOCALHOST"
    l_4_4.Url_Score = 0
    return 0, l_4_4
  end
  if StringStartsWith(l_4_0, "%2fLM%2fW3SVC%2f") then
    l_4_4.URL_CLEAN = "InternalIIS"
    l_4_4.Url_Score = 0
    return 0, l_4_4
  end
  local l_4_6 = function(l_5_0, l_5_1, l_5_2, l_5_3)
    -- function num : 0_3_0
    do
      local l_5_4 = {}
      -- DECOMPILER ERROR at PC5: No list found for R4 , SetList fails

      -- DECOMPILER ERROR at PC6: Overwrote pending register: R5 in 'AssignReg'

      if l_5_0 ~= 4 then
        return false
      end
      -- DECOMPILER ERROR at PC12: Overwrote pending register: R6 in 'AssignReg'

      for l_5_8,l_5_9 in ipairs(l_5_1) do
        local l_5_10 = tonumber(l_5_9)
        if not l_5_10 or l_5_10 < 0 or l_5_10 > 255 then
          return false
        end
      end
      do return true end
      -- WARNING: undefined locals caused missing assignments!
    end
  end

  local l_4_7 = "(^|:\\/\\/)(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})"
  local l_4_8, l_4_9, l_4_10, l_4_11, l_4_12, l_4_13 = (MpCommon.StringRegExpSearch)(l_4_7, l_4_0)
  if l_4_8 and l_4_10 and l_4_13 then
    if l_4_6(l_4_10, l_4_11, l_4_12, l_4_13) then
      local l_4_14 = l_4_10 .. "." .. l_4_11 .. "." .. l_4_12 .. "." .. l_4_13
      if isPublicIP(l_4_14) then
        l_4_4.IP = true
        l_4_3 = l_4_3 + 10
      else
        l_4_4.URL_CLEAN = "Private/InvalidIP"
        l_4_4.Url_Score = 0
        return 0, l_4_4
      end
    else
      do
        do return 0, nil end
        local l_4_15 = "ftp:\\/\\/.*@(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})"
        l_4_8 = (MpCommon.StringRegExpSearch)(l_4_15, l_4_0)
        if l_4_8 and l_4_10 and l_4_13 then
          if l_4_6(l_4_10, l_4_11, l_4_12, l_4_13) then
            local l_4_16 = l_4_10 .. "." .. l_4_11 .. "." .. l_4_12 .. "." .. l_4_13
            if isPublicIP(l_4_16) then
              l_4_4.IP = true
              l_4_3 = l_4_3 + 10
            else
              l_4_4.URL_CLEAN = "Private/InvalidIP"
              l_4_4.Url_Score = 0
              return 0, l_4_4
            end
          else
            do
              do
                do return 0, nil end
                local l_4_17, l_4_18 = (mp.CheckUrl)(l_4_0)
                if l_4_17 == 1 and l_4_18 == 1 then
                  l_4_4.URL_CLEAN = "CheckURL"
                  l_4_4.Url_Score = 0
                  return 0, l_4_4
                end
                local l_4_19 = nil
                if l_4_4.IP then
                  l_4_19 = l_4_0
                else
                  if not l_4_0:match("ftp://.*@([^:/]+)") then
                    l_4_19 = l_4_0:match("^%a+://([^:/]+)")
                  end
                end
                if not l_4_19 then
                  l_4_4.Url_Score = 100
                  l_4_4.ERROR = "Error grading url"
                  return 100, l_4_4
                end
                local l_4_20, l_4_21, l_4_22 = AnomalyTableCheck("Appomaly_Network_HOST_Global", l_4_19, 30)
                if l_4_20 == true and l_4_21 == false then
                  l_4_3 = l_4_3 + 20
                  l_4_4.AnomalousHost = l_4_22
                else
                  if l_4_20 == false and l_4_21 == false then
                    l_4_4.URL_CLEAN = "Global_Url_Cache_SeenBefore"
                    l_4_4.Url_Score = 0
                    return 0, l_4_4
                  end
                end
                local l_4_23 = GetRollingQueueKeyValue("Global_CLEAN_Url_Cache", l_4_19)
                if l_4_23 then
                  l_4_4.URL_CLEAN = "Global_Url_Cache"
                  l_4_4.Url_Score = 0
                  return 0, l_4_4
                end
                local l_4_24 = {}
                l_4_24.SIG_CONTEXT = "Appomaly" .. l_4_1 or ""
                l_4_24.FILELESS = "true"
                l_4_24.CMDLINE_URL = "true"
                local l_4_25 = GetCurrentPPID()
                do
                  if l_4_25 then
                    local l_4_26, l_4_27 = GetAppomalyProcessAttribute(l_4_25)
                    if l_4_27 then
                      l_4_24.PROCESS_CONTEXT = l_4_27
                    end
                  end
                  local l_4_28 = GetRollingQueueKeyValue("Global_Url_Cache_Appomaly", l_4_19)
                  if l_4_28 then
                    l_4_28 = tonumber(l_4_28)
                    l_4_4.UrlRep_Determination = l_4_28
                    if l_4_28 == 7 then
                      l_4_3 = l_4_3 + 10
                      l_4_4.SusUrlRep = true
                    else
                      if l_4_28 == 2 or l_4_28 == 3 or l_4_28 == 5 or l_4_28 == 6 then
                        l_4_3 = l_4_3 + 100
                        l_4_4.BadUrlRep = true
                        local l_4_29 = (MpCommon.Base64Encode)(l_4_19 .. "_" .. l_4_28)
                        ;
                        (mp.set_mpattribute)("Appomaly_BadUrlRep_Found_" .. l_4_29)
                      end
                    end
                  else
                    do
                      if l_4_2 then
                        local l_4_30 = SafeGetUrlReputation
                        local l_4_31 = {}
                        -- DECOMPILER ERROR at PC308: No list found for R25 , SetList fails

                        -- DECOMPILER ERROR at PC309: Overwrote pending register: R26 in 'AssignReg'

                        l_4_30 = l_4_30(l_4_31, l_4_0, false, 2000)
                        if l_4_30 then
                          l_4_31 = l_4_30.urls
                          if l_4_31 then
                            l_4_31 = l_4_30.urls
                            l_4_31 = l_4_31[l_4_0]
                            if l_4_31 then
                              l_4_31 = l_4_30.urls
                              l_4_31 = l_4_31[l_4_0]
                              l_4_31 = l_4_31.determination
                              if l_4_31 == 1 then
                                l_4_31 = l_4_30.urls
                                l_4_31 = l_4_31[l_4_0]
                                l_4_31 = l_4_31.confidence
                                if l_4_31 >= 90 then
                                  l_4_31 = AppendToRollingQueue
                                  l_4_31("Global_CLEAN_Url_Cache", l_4_19, 1, 1209600, 1000)
                                  l_4_4.URL_CLEAN = "UrlRepLookup"
                                  l_4_4.Url_Score = 0
                                  l_4_31 = 0
                                  return l_4_31, l_4_4
                                end
                              end
                            end
                          end
                        end
                        if l_4_30 then
                          l_4_31 = l_4_30.urls
                          if l_4_31 then
                            l_4_31 = l_4_30.urls
                            l_4_31 = l_4_31[l_4_0]
                            if l_4_31 then
                              l_4_31 = l_4_30.urls
                              l_4_31 = l_4_31[l_4_0]
                              l_4_31 = l_4_31.confidence
                              if l_4_31 then
                                l_4_31 = AppendToRollingQueue
                                l_4_31("Global_Url_Cache_Appomaly", l_4_19, ((l_4_30.urls)[l_4_0]).determination, 864000, 1000)
                                l_4_31 = l_4_30.urls
                                l_4_31 = l_4_31[l_4_0]
                                l_4_31 = l_4_31.confidence
                                l_4_4.UrlRep_Confidence = l_4_31
                                l_4_31 = l_4_30.urls
                                l_4_31 = l_4_31[l_4_0]
                                l_4_31 = l_4_31.determination
                                l_4_4.UrlRep_Determination = l_4_31
                                l_4_31 = l_4_30.urls
                                l_4_31 = l_4_31[l_4_0]
                                l_4_31 = l_4_31.determination
                                if l_4_31 ~= 4 then
                                  l_4_31 = l_4_30.urls
                                  l_4_31 = l_4_31[l_4_0]
                                  l_4_31 = l_4_31.determination
                                  if l_4_31 ~= 1 then
                                    do
                                      l_4_31 = l_4_30.urls
                                      l_4_31 = l_4_31[l_4_0]
                                      l_4_31 = l_4_31.determination
                                      if l_4_31 ~= 7 then
                                        l_4_3 = l_4_3 + 100
                                        l_4_4.BadUrlRep = true
                                        l_4_31 = MpCommon
                                        l_4_31 = l_4_31.Base64Encode
                                        l_4_31 = l_4_31(l_4_0 .. "_" .. ((l_4_30.urls)[l_4_0]).determination)
                                        ;
                                        (mp.set_mpattribute)("Appomaly_BadUrlRep_Found_" .. l_4_31)
                                      else
                                        l_4_31 = l_4_30.urls
                                        l_4_31 = l_4_31[l_4_0]
                                        l_4_31 = l_4_31.determination
                                        if l_4_31 == 7 then
                                          l_4_3 = l_4_3 + 50
                                          l_4_4.SusUrlRep = true
                                        end
                                      end
                                      if (MpCommon.StringRegExpSearch)("\\.(exe|dll|ps1|bat|rar|msi|torrent|png|gif|bin|zip|img|gz|vbs)$", l_4_0) then
                                        l_4_3 = l_4_3 + 20
                                        l_4_4.Susfile_extension = true
                                      end
                                      l_4_4.Url_Score = l_4_3
                                      return l_4_3, l_4_4
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
          end
        end
      end
    end
  end
end

AnomalyTableCheck = function(l_5_0, l_5_1, l_5_2, l_5_3)
  -- function num : 0_4
  if not l_5_2 then
    l_5_2 = 30
  end
  if l_5_2 == -1 then
    l_5_2 = 10950
  end
  local l_5_4 = (MpCommon.AnomalyTableLookup)(l_5_0)
  if l_5_4 and l_5_4.TableAge then
    l_5_4.TableAgeDays = l_5_4.TableAge / 1440 * 60
  end
  local l_5_5, l_5_6 = nil, nil
  local l_5_7 = {}
  l_5_7.AnomalyTableName = l_5_0
  l_5_7.Key = l_5_1
  local l_5_8, l_5_9 = GetCurrentPPID()
  do
    do
      if l_5_4 and l_5_8 and l_5_9 ~= "HSTR" and l_5_4.Size > 9000 then
        local l_5_10 = {}
        l_5_10.TableInfo = l_5_4
        l_5_10.AnomalyTableName = l_5_0
        l_5_10.Record_Marker = l_5_3
        l_5_10.Record = l_5_1
        ;
        (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTable_SizeWarning", safeJsonSerialize(l_5_10))
      end
      if l_5_3 then
        local l_5_11 = (MpCommon.AnomalyEventLookup)(l_5_0, l_5_3, 1)
        local l_5_12 = (MpCommon.GetCurrentTimeT)()
        local l_5_13 = l_5_12
        local l_5_14 = nil
        if l_5_11 and l_5_11.Count then
          l_5_13 = l_5_11.Count
          l_5_14 = l_5_11.UnbiasedTime or 0
          local l_5_15 = (l_5_12 - l_5_13) / 60
          local l_5_16 = (l_5_14) / 60
          local l_5_17 = l_5_15 / 1440
          local l_5_18 = l_5_16 / 1440
          local l_5_19 = (MpCommon.AnomalyEventLookup)(l_5_0, l_5_1, 1)
          if not l_5_19 then
            if l_5_2 < l_5_18 then
              l_5_4.Marker_Days_Elapsed_ActualTime = l_5_17
              l_5_4.Marker_Days_Elapsed_EventUnbiasedTime = l_5_18
              return true, false, l_5_4
            else
              l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, 1, 1)
              if not l_5_5 and l_5_8 and l_5_9 ~= "HSTR" then
                l_5_7.Error = tostring(l_5_6) .. "; Failed to add a new event with marker"
                ;
                (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTable_Error", safeJsonSerialize(l_5_7))
                return nil
              end
              l_5_4 = (MpCommon.AnomalyTableLookup)(l_5_0)
              if l_5_4 then
                l_5_4.Marker_Days_Elapsed_ActualTime = l_5_17
                l_5_4.Marker_Days_Elapsed_EventUnbiasedTime = l_5_18
              end
              return true, true, l_5_4
            end
          else
            local l_5_20 = l_5_19.Count
            -- DECOMPILER ERROR at PC147: Overwrote pending register: R6 in 'AssignReg'

            l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, l_5_20 + 1, 1)
            if not l_5_5 and l_5_8 and l_5_9 ~= "HSTR" then
              l_5_7.Error = tostring(l_5_6) .. "; Failed to update existing event with marker"
              ;
              (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTable_Error", safeJsonSerialize(l_5_7))
              return nil
            end
            l_5_4 = (MpCommon.AnomalyTableLookup)(l_5_0)
            if l_5_4 then
              l_5_4.Marker_Days_Elapsed_ActualTime = l_5_17
              l_5_4.Marker_Days_Elapsed_EventUnbiasedTime = l_5_18
            end
            local l_5_21 = false
            return l_5_21, l_5_17 < l_5_2, l_5_4
          end
        else
          l_5_13 = l_5_12
          -- DECOMPILER ERROR at PC197: Overwrote pending register: R6 in 'AssignReg'

          l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_3, l_5_12, 1)
          if l_5_5 and l_5_8 and l_5_9 ~= "HSTR" then
            (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTableMarker_Rcr", safeJsonSerialize(l_5_7))
            -- DECOMPILER ERROR at PC221: Overwrote pending register: R6 in 'AssignReg'

            l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, 1, 1)
          end
          if not l_5_5 and l_5_8 and l_5_9 ~= "HSTR" then
            l_5_7.Error = tostring(l_5_6) .. "; Failed to add a new event with marker for a new app"
            ;
            (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTable_Error", safeJsonSerialize(l_5_7))
            return nil
          end
          l_5_4 = (MpCommon.AnomalyTableLookup)(l_5_0)
          if l_5_4 then
            l_5_4.Marker_Days_Elapsed_ActualTime = 0
            l_5_4.Marker_Days_Elapsed_EventUnbiasedTime = 0
          end
          return true, true, l_5_4
        end
        return nil
      end
      if l_5_4 and l_5_4.TableAge then
        local l_5_24 = (MpCommon.AnomalyEventLookup)(l_5_0, l_5_1, 1)
        local l_5_25 = l_5_4.TableAge / 1440 * 60
        -- DECOMPILER ERROR at PC288: Overwrote pending register: R6 in 'AssignReg'

        if l_5_4.TableAge < 1440 * l_5_2 then
          if not l_5_24 then
            l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, 1, 1)
          else
            -- DECOMPILER ERROR at PC300: Overwrote pending register: R6 in 'AssignReg'

            l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, l_5_24.Count + 1, 1)
          end
          if l_5_5 then
            l_5_4 = (MpCommon.AnomalyTableLookup)(l_5_0)
            l_5_4.TableAgeDays = l_5_25
            return l_5_24 == nil, true, l_5_4
          else
            l_5_7.Error = tostring(l_5_6) .. "; Table age."
            if l_5_8 and l_5_9 ~= "HSTR" then
              (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTable_Error", safeJsonSerialize(l_5_7))
            end
            return nil
          end
        elseif not (MpCommon.AnomalyEventLookup)(l_5_0, l_5_1, 1) then
          l_5_4.TableAgeDays = l_5_25
          return true, false, l_5_4
        else
          l_5_4.TableAgeDays = l_5_25
          return false, false, l_5_4
        end
      else
        -- DECOMPILER ERROR at PC367: Overwrote pending register: R6 in 'AssignReg'

        l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, 1, 1)
        if l_5_5 then
          if l_5_8 and l_5_9 ~= "HSTR" then
            (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTableMarker_Rcr", safeJsonSerialize(l_5_7))
          end
          l_5_4 = (MpCommon.AnomalyTableLookup)(l_5_0)
          return true, true, (MpCommon.AnomalyTableLookup)(l_5_0)
        else
          l_5_7.Error = tostring(l_5_6) .. "; Failed to add a new record."
          if l_5_8 and l_5_9 ~= "HSTR" then
            (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTable_Error", safeJsonSerialize(l_5_7))
          end
          return nil
        end
      end
      do return nil end
      -- DECOMPILER ERROR: 19 unprocessed JMP targets
    end
  end
end

GetAnomalyTableAge = function(l_6_0)
  -- function num : 0_5
  local l_6_1 = (MpCommon.AnomalyTableLookup)(l_6_0)
  if l_6_1 and l_6_1.TableAge then
    return l_6_1.TableAge
  end
  return -1
end

getCmdKeywordsWeight = function()
  -- function num : 0_6
  local l_7_0 = {}
  l_7_0["%[io.file%]::writeallbytes"] = 5
  l_7_0["system.reflection.assembly"] = 5
  l_7_0["iisy.invoke"] = 5
  l_7_0.tcplistener = 5
  l_7_0.accepttcpclient = 5
  l_7_0.tcpclient = 5
  l_7_0.downloadstring = 10
  l_7_0.uploadfile = 10
  l_7_0["send-mailmessage"] = 0
  l_7_0["[^r]shell[^.]"] = 5
  l_7_0.defender = 20
  l_7_0["disable.*true"] = 5
  l_7_0["disable.*0"] = 5
  l_7_0.stop = 5
  l_7_0.remove = 5
  l_7_0.exclusion = 1
  l_7_0.sense = 1
  l_7_0.scriptblock = 5
  l_7_0.webrequest = 5
  l_7_0["user%-agent"] = 10
  l_7_0.webclient = 5
  l_7_0["unicode.getstring"] = 5
  l_7_0.whoami = 1
  l_7_0["net user"] = 1
  l_7_0["bitsadmin.*http"] = 5
  l_7_0["certutil.*http"] = 5
  l_7_0["invoke%-webrequest"] = 5
  l_7_0["invoke%-restmethod"] = 5
  l_7_0.curl = 5
  l_7_0.wget = 5
  l_7_0["new%-localuser"] = 5
  l_7_0["net group /add"] = 5
  l_7_0["new%-localgroup"] = 5
  l_7_0.icacls = 1
  l_7_0["set%-acl"] = 1
  l_7_0["set%-itemproperty"] = 1
  l_7_0["set%-mppreference"] = 5
  l_7_0["add%-mppreference"] = 5
  l_7_0.netstat = 1
  l_7_0.nmap = 1
  l_7_0.runas = 5
  l_7_0["enable%-privilege"] = 5
  l_7_0.psexec = 5
  l_7_0["invoke%-command"] = 5
  l_7_0.taskkill = 1
  l_7_0["stop%-process"] = 5
  l_7_0["reg add"] = 1
  l_7_0["set%-itemproperty.*disable"] = 2
  l_7_0["[^by]pass"] = 2
  l_7_0.password = 2
  l_7_0["invoke%-expression"] = 1
  l_7_0.dllimport = 1
  l_7_0["using system%.runtime"] = 1
  l_7_0["scripting.filesystemobject"] = 1
  l_7_0["http://"] = 1
  l_7_0["https://"] = 1
  l_7_0["start%-sleep"] = 1
  l_7_0.tanium = -10
  return l_7_0
end

CommandLineGrader = function(l_8_0, l_8_1, l_8_2)
  -- function num : 0_7
  local l_8_8, l_8_9, l_8_10, l_8_11, l_8_12, l_8_13, l_8_14, l_8_15, l_8_16, l_8_17, l_8_18, l_8_19, l_8_20 = nil
  if l_8_1 == nil then
    l_8_1 = true
  end
  if l_8_2 == nil then
    l_8_2 = 1
  end
  if not l_8_0 or l_8_0 == "" then
    return 
  end
  if hasBase64Content(l_8_0) then
    local l_8_3 = Base64Grader
    local l_8_4 = l_8_0
    local l_8_5 = 2
    local l_8_6 = l_8_1
    do
      local l_8_7 = l_8_2
      do return l_8_3(l_8_4, l_8_5, l_8_6, l_8_7) end
      -- DECOMPILER ERROR at PC23: Confused about usage of register R4 for local variables in 'ReleaseLocals'

      local l_8_21 = nil
      local l_8_22 = nil
      local l_8_23, l_8_24 = nil
      -- DECOMPILER ERROR at PC33: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC40: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC43: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC46: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC50: Overwrote pending register: R0 in 'AssignReg'

      -- DECOMPILER ERROR at PC51: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC52: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

      -- DECOMPILER ERROR at PC56: Overwrote pending register: R7 in 'AssignReg'

      if not l_8_22 or not l_8_23 or not l_8_23 or l_8_24 > 5000 then
        local l_8_25 = nil
        -- DECOMPILER ERROR at PC61: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC63: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC65: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC66: Overwrote pending register: R8 in 'AssignReg'

        if l_8_2 == 2 then
          for l_8_29,l_8_30 in l_8_25 do
            local l_8_30 = nil
            -- DECOMPILER ERROR at PC71: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC80: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC81: Overwrote pending register: R13 in 'AssignReg'

            if l_8_30 then
              l_8_30(l_8_21, l_8_28)
            end
          end
          -- DECOMPILER ERROR at PC87: Overwrote pending register: R8 in 'AssignReg'

          local l_8_31 = nil
          -- DECOMPILER ERROR at PC94: Overwrote pending register: R9 in 'AssignReg'

          if 0 + l_8_29 >= 5 then
            local l_8_32 = nil
            -- DECOMPILER ERROR at PC98: Overwrote pending register: R13 in 'AssignReg'

            local l_8_33 = nil
            -- DECOMPILER ERROR at PC106: Overwrote pending register: R11 in 'AssignReg'

            -- DECOMPILER ERROR at PC107: Overwrote pending register: R11 in 'AssignReg'

            -- DECOMPILER ERROR at PC116: Overwrote pending register: R11 in 'AssignReg'

            if not l_8_33 and l_8_33 then
              for l_8_37,l_8_38 in l_8_33 do
                local l_8_38 = nil
                local l_8_39 = nil
                -- DECOMPILER ERROR at PC126: Overwrote pending register: R17 in 'AssignReg'

                -- DECOMPILER ERROR at PC129: Overwrote pending register: R17 in 'AssignReg'

                if l_8_38 and not l_8_39 then
                  local l_8_40, l_8_41 = nil
                  -- DECOMPILER ERROR at PC136: Confused about usage of register: R3 in 'UnsetPending'

                end
              end
              -- DECOMPILER ERROR at PC142: Overwrote pending register: R11 in 'AssignReg'

              if l_8_39 ~= 0 then
                local l_8_42 = nil
                -- DECOMPILER ERROR at PC149: Overwrote pending register: R10 in 'AssignReg'

                -- DECOMPILER ERROR at PC150: Overwrote pending register: R12 in 'AssignReg'

                for l_8_46,l_8_47 in l_8_42 do
                  local l_8_47 = l_8_39
                  -- DECOMPILER ERROR at PC156: Overwrote pending register: R19 in 'AssignReg'

                  local l_8_48, l_8_49 = nil
                  -- DECOMPILER ERROR at PC162: Overwrote pending register: R19 in 'AssignReg'

                  -- DECOMPILER ERROR at PC166: Overwrote pending register: R19 in 'AssignReg'

                end
                do
                  -- DECOMPILER ERROR at PC172: Overwrote pending register: R9 in 'AssignReg'

                  -- DECOMPILER ERROR at PC175: Overwrote pending register: R9 in 'AssignReg'

                  if (l_8_47 == 0 or l_8_49 or l_8_2 > 1) and l_8_31 then
                    do
                      local l_8_50 = nil
                      -- DECOMPILER ERROR at PC183: Confused about usage of register: R3 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC183: Overwrote pending register: R10 in 'AssignReg'

                      do return l_8_32, l_8_31 end
                      -- DECOMPILER ERROR at PC186: Confused about usage of register R12 for local variables in 'ReleaseLocals'

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

Base64Grader = function(l_9_0, l_9_1, l_9_2, l_9_3)
  -- function num : 0_8
  if l_9_2 == nil then
    l_9_2 = true
  end
  if l_9_3 == nil then
    l_9_3 = 1
  end
  if not l_9_1 then
    l_9_1 = 1
  end
  if l_9_1 > 3 then
    return 
  end
  local l_9_4 = ""
  local l_9_5 = nil
  local l_9_6 = 0
  local l_9_7 = {}
  local l_9_8 = {}
  local l_9_9, l_9_10 = (MpCommon.StringRegExpSearch)("(?i)(?:FromBase64String\\(\\s*[\'\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([^\\s\'\"\\)]{35,})", l_9_0)
  if l_9_9 then
    l_9_5 = l_9_10
  else
    local l_9_11, l_9_12 = (MpCommon.StringRegExpSearch)("(?i)(?:FromBase64String\\(\\$)([\\w_]+)", l_9_0)
    if l_9_12 then
      local l_9_13 = "\\$" .. l_9_12 .. "\\s*=\\s*(?:[\'\"]+)?([A-Za-z0-9+/]+=*)(?:[\'\"]+)?;"
      local l_9_14, l_9_15 = (MpCommon.StringRegExpSearch)(l_9_13, l_9_0)
      if l_9_15 then
        l_9_5 = l_9_15
      else
        l_9_13 = "$" .. l_9_12 .. "%s*=%s*" .. "[^;]+"
        l_9_15 = (string.match)(l_9_0, l_9_13)
        if l_9_15 and not (string.find)(l_9_15, "[A-Za-z]:\\[^%s]+") and not (string.find)(l_9_15, "Get-Content") then
          l_9_6 = l_9_6 + 10
          l_9_5 = l_9_15
          ;
          (table.insert)(l_9_7, "Obfuscated_FailedToDecode_Var")
        end
      end
    else
      do
        do
          ;
          (table.insert)(l_9_7, "FailedToExtractBase64Buffer")
          l_9_8.Evidence = l_9_7
          l_9_8.Score = 0
          do return l_9_8 end
          if not l_9_5 then
            return l_9_8
          end
          if #l_9_5 > 500 then
            l_9_6 = l_9_6 + 5
            ;
            (table.insert)(l_9_7, "length_G500")
          else
            if #l_9_5 > 100 then
              l_9_6 = l_9_6 + 3
              ;
              (table.insert)(l_9_7, "length_G100")
            else
              ;
              (table.insert)(l_9_7, "length_L100")
              l_9_8.Score = 0
              l_9_8.Evidence = l_9_7
              return l_9_8
            end
          end
          local l_9_16 = (MpCommon.Base64Decode)(l_9_5)
          if l_9_16 then
            l_9_16 = (string.gsub)(l_9_16, "%z", "")
            l_9_16 = (string.gsub)(l_9_16, "\n", "")
            l_9_16 = (string.gsub)(l_9_16, "\r", "")
            l_9_4 = l_9_16
          else
            l_9_6 = l_9_6 + 10
            ;
            (table.insert)(l_9_7, "Obfuscated_FailedToDecode")
          end
          local l_9_17 = (string.lower)(l_9_0) .. (string.lower)(l_9_4)
          local l_9_18 = nil
          if l_9_3 == 2 then
            l_9_18 = getCmdKeywordsWeightV2()
          else
            l_9_18 = getCmdKeywordsWeight()
          end
          for l_9_22,l_9_23 in pairs(l_9_18) do
            if (string.find)(l_9_17, l_9_22, 1, false) then
              l_9_6 = l_9_6 + l_9_23
              ;
              (table.insert)(l_9_7, l_9_22)
            end
          end
          l_9_7.Urls = {}
          if l_9_6 >= 5 then
            local l_9_24 = "((i?)(ftp|http[s]?)://[^\\\"\\s\\\']+)"
            local l_9_25 = table_dedup(multi_match_regex(l_9_17, l_9_24))
            for l_9_29,l_9_30 in ipairs(l_9_25) do
              local l_9_31 = l_9_30:match("^%a+://([^:/]+)")
              local l_9_32, l_9_33 = UrlGrader(l_9_30, "Base64Grader", l_9_2)
              if l_9_32 ~= 0 and not (l_9_7.Urls)[l_9_31] then
                l_9_6 = l_9_6 + l_9_32
                l_9_33.Url = l_9_30
                -- DECOMPILER ERROR at PC227: Confused about usage of register: R24 in 'UnsetPending'

                ;
                (l_9_7.Urls)[l_9_31] = l_9_33
              end
            end
            local l_9_34 = "(?:\\s)(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})"
            l_9_25 = table_dedup(multi_match_regex(l_9_17, l_9_34))
            for l_9_38 in ipairs(l_9_25) do
              local l_9_39, l_9_40 = UrlGrader(l_9_38, "Base64Grader", l_9_2)
              if l_9_39 ~= 0 and not (l_9_7.Urls)[l_9_38] then
                l_9_6 = l_9_6 + l_9_39
                -- DECOMPILER ERROR at PC255: Confused about usage of register: R23 in 'UnsetPending'

                ;
                (l_9_7.Urls)[l_9_38] = l_9_40
              end
            end
          end
          do
            if l_9_1 == 1 and l_9_3 > 1 then
              l_9_24 = IsRemoteSession
              l_9_24 = l_9_24()
              l_9_7.IsRemoteSession = l_9_24
              l_9_24 = l_9_7.IsRemoteSession
              if l_9_24 then
                l_9_6 = l_9_6 + 10
              end
            end
            l_9_24 = "Evidence_L"
            l_9_25 = l_9_1
            l_9_24 = l_9_24 .. l_9_25
            l_9_8[l_9_24] = l_9_7
            l_9_8.Score = l_9_6
            l_9_24 = CommandLineTokenizer
            l_9_25 = l_9_4
            l_9_24 = l_9_24(l_9_25)
            l_9_8.CommandlineTokens = l_9_24
            l_9_24 = MpCommon
            l_9_24 = l_9_24.StringRegExpSearch
            l_9_25 = "(?i)(?:FromBase64String\\(\\s*[\'\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([^\\s\'\"\\)]{35,})"
            l_9_34 = l_9_4
            l_9_24 = l_9_24(l_9_25, l_9_34)
            if l_9_24 then
              l_9_6 = l_9_6 + 20
              l_9_7.MultilayerEncoding = true
              l_9_24 = "Evidence_L"
              l_9_25 = l_9_1
              l_9_24 = l_9_24 .. l_9_25
              l_9_8[l_9_24] = l_9_7
              l_9_8.Score = l_9_6
              l_9_1 = l_9_1 + 1
              l_9_24 = Base64Grader
              l_9_25 = l_9_4
              l_9_34 = l_9_1
              l_9_24 = l_9_24(l_9_25, l_9_34)
              local l_9_41, l_9_42 = nil
              if l_9_25 then
                l_9_34 = l_9_25.Score
                if l_9_34 then
                  l_9_34 = l_9_25.Evidence
                  if l_9_34 then
                    l_9_34 = "Evidence_L"
                    l_9_41 = l_9_1
                    l_9_34 = l_9_34 .. l_9_41
                    local l_9_43 = nil
                    l_9_41 = l_9_25.Evidence
                    l_9_8[l_9_34] = l_9_41
                    l_9_34 = l_9_25.Score
                    l_9_34 = l_9_6 + l_9_34
                    l_9_8.Score = l_9_34
                  end
                end
              end
            end
            do
              l_9_24 = l_9_8.Score
              l_9_25 = l_9_8
              return l_9_24, l_9_25
            end
          end
        end
      end
    end
  end
end

hasTamperingCmd = function(l_10_0)
  -- function num : 0_9
  if not l_10_0 then
    return false
  end
  l_10_0 = (string.lower)(l_10_0)
  do
    local l_10_1 = {}
    -- DECOMPILER ERROR at PC14: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC15: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC16: Overwrote pending register: R3 in 'AssignReg'

    for l_10_5,l_10_6 in ("(disable|remove|stop).*(defender|windefend|sense)")("(defender|windefend|sense).*(disable|remove|stop)") do
      if (MpCommon.StringRegExpSearch)(l_10_6, l_10_0) then
        return true
      end
    end
    do return false end
    -- WARNING: undefined locals caused missing assignments!
  end
end

hasBase64Content = function(l_11_0)
  -- function num : 0_10
  if not l_11_0 then
    return false
  end
  if not (mp.get_mpattribute)("MpCmdLineFoundB64") then
    return (MpCommon.StringRegExpSearch)("(?i)(frombase64string|(powershell|pwsh)(.exe)?.*-e(nc|ncodedcommand)?\\s+([\'\"]+)?([^\'\"\\s;]{30,}))", l_11_0)
  end
end

hasBase64encodedParent = function(l_12_0, l_12_1)
  -- function num : 0_11
  if not l_12_1 then
    l_12_1 = 4
  end
  if not l_12_0 and not GetCurrentPPID() then
    return false
  end
  local l_12_2 = (mp.GetProcessCommandLine)(l_12_0)
  if l_12_2 and hasBase64Content(l_12_2) then
    return true
  end
  local l_12_3 = {}
  local l_12_4 = {}
  -- DECOMPILER ERROR at PC28: No list found for R4 , SetList fails

  local l_12_5 = {}
  -- DECOMPILER ERROR at PC30: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: No list found for R5 , SetList fails

  local l_12_6 = {}
  -- DECOMPILER ERROR at PC34: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC36: No list found for R6 , SetList fails

  local l_12_7 = {}
  -- DECOMPILER ERROR at PC38: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: No list found for R7 , SetList fails

  local l_12_8 = {}
  -- DECOMPILER ERROR at PC42: Overwrote pending register: R9 in 'AssignReg'

  local l_12_9 = " -encodedcommand "
  do
    local l_12_10 = " -encodedcommand "
    -- DECOMPILER ERROR at PC44: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC45: No list found for R3 , SetList fails

    l_12_4 = checkParentCmdlineCaseInsensitive
    l_12_5 = l_12_0
    l_12_6 = l_12_3
    l_12_7 = l_12_1
    do return l_12_4(l_12_5, l_12_6, l_12_7) end
    -- DECOMPILER ERROR at PC52: Confused about usage of register R5 for local variables in 'ReleaseLocals'

  end
end

hasURLEncodedContent = function(l_13_0)
  -- function num : 0_12
  if not l_13_0 then
    return false
  end
  local l_13_1, l_13_2 = (MpCommon.StringRegExpSearch)("(?i)(?:\\[URI\\]::UNESCAPEDATASTRING\\([\'\"]+)([^\'\"]+)", l_13_0)
  if not l_13_1 then
    return false
  end
  return true, l_13_2
end

urlDecode = function(l_14_0)
  -- function num : 0_13
  if not l_14_0 then
    return 
  end
  local l_14_1, l_14_2 = (l_14_0:gsub("%%(%x%x)", function(l_15_0)
    -- function num : 0_13_0
    local l_15_1 = string.char
    do
      local l_15_2, l_15_3, l_15_4 = tonumber(l_15_0, 16), .end
      do return l_15_1(l_15_2, l_15_3, l_15_4) end
      -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)):gsub, l_14_0:gsub("%%(%x%x)", function(l_15_0)
    -- function num : 0_13_0
    local l_15_1 = string.char
    do
      local l_15_2, l_15_3, l_15_4 = tonumber(l_15_0, 16), .end
      do return l_15_1(l_15_2, l_15_3, l_15_4) end
      -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)
  local l_14_3 = "+"
  do
    local l_14_4 = " "
    do return l_14_1(l_14_2, l_14_3, l_14_4) end
    -- DECOMPILER ERROR at PC12: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

AlertGrading = function(l_15_0, l_15_1)
  -- function num : 0_14
  if type(l_15_0) ~= "table" or not l_15_1 then
    return -1
  end
  if l_15_0.isThreat then
    return 20
  end
  do
    if ((versioning.IsServer)() and l_15_0.type == "Tampering") or (string.find)(l_15_0.alert, "tamper", 1, true) then
      local l_15_2 = 1 + 1 + 2
    end
    local l_15_3 = nil
    for l_15_7,l_15_8 in ipairs({"Behavior:Win32/MpTamperEx.B", "Behavior:Win32/MuprocMpTamperPreference.gen!A", "Behavior:Win32/MpTamperRTP.C", "Behavior:Win32/MpTamperGpDisableAV.A", "Behavior:Win32/MpTamperSrvDisableAV.B", "Behavior:Win32/MpTamperRTP.D", "Behavior:Win32/MpTamperSrv.A", "Behavior:Win32/MpTamperPShell.A", "Behavior:Win32/MpTamperGpDisableAVFriendly.A"}) do
      local l_15_4 = nil
      -- DECOMPILER ERROR at PC52: Confused about usage of register: R8 in 'UnsetPending'

      if (string.find)(l_15_0.alert, "Behavior:Win32/MpTamperSrvDisableAV.B") then
        l_15_3 = l_15_3 + 15
      end
    end
    local l_15_9 = nil
    local l_15_10 = {"cmd.exe", "powershell.exe", "reg.exe", "regedit.exe", "net.exe"}
    if (MpCommon.GetImagePathFromPid)(l_15_1) and contains((MpCommon.GetImagePathFromPid)(l_15_1), l_15_10) then
      l_15_3 = l_15_3 + 2
    end
    if hasBase64encodedParent(l_15_1) then
      l_15_3 = l_15_3 + 15
    end
    local l_15_11 = nil
    local l_15_12 = {}
    -- DECOMPILER ERROR at PC90: No list found for R6 , SetList fails

    -- DECOMPILER ERROR at PC91: Overwrote pending register: R7 in 'AssignReg'

    if (({"reg", "disable"}).GetProcessCommandLine)(l_15_1) then
      local l_15_13 = nil
      local l_15_14 = contains
      local l_15_15 = l_15_13
      l_15_14 = l_15_14(l_15_15, {"reg.*disable"}, false)
    end
    if not l_15_14 then
      l_15_14 = checkParentCmdlineCaseInsensitive
      l_15_15 = l_15_1
      l_15_14 = l_15_14(l_15_15, l_15_12, 3)
    end
    if l_15_14 then
      l_15_3 = l_15_3 + 5
    end
    return l_15_3
  end
end

startTrackingApp = function(l_16_0, l_16_1, l_16_2, l_16_3)
  -- function num : 0_15
  local l_16_4 = "Appomaly_InstalledApp1"
  local l_16_5 = 500
  local l_16_6 = {}
  l_16_6.PFServers = 10
  l_16_6.programfiles_targeted = 20
  l_16_6.programfiles_Net = 30
  l_16_6.programfiles = 20
  l_16_6.generic = 50
  local l_16_7 = {}
  l_16_7.PFServers = 180
  l_16_7.programfiles_targeted = 180
  l_16_7.programfiles_Net = 180
  l_16_7.programfiles = 90
  l_16_7.generic = 1
  if not l_16_6[l_16_2] then
    return false
  end
  local l_16_8 = l_16_7[l_16_2]
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R9 in 'UnsetPending'

  if (MpCommon.DoesProcessHaveAttribute)(l_16_0, l_16_3 or "PFAppTracked") or (MpCommon.DoesProcessHaveAttribute)(l_16_0, "inherit:" .. (l_16_3 or "PFAppTracked")) then
    AppendToRollingQueue(l_16_4, l_16_2, l_16_1, 86400 * l_16_8, l_16_5, 1)
    return true, {}
  end
  local l_16_10 = nil
  do
    if not GetRollingQueueCountForKey(l_16_4, l_16_2) then
      local l_16_11, l_16_13 = {AllTrackedApps = GetRollingQueueKeys(l_16_4), IsNewApp = false}, IsKeyValuePairInRollingQueue(l_16_4, l_16_2, l_16_1) or 0
    end
    -- DECOMPILER ERROR at PC71: Confused about usage of register: R11 in 'UnsetPending'

    if l_16_13 < l_16_6[l_16_2] then
      local l_16_12 = nil
      AppendToRollingQueue(l_16_4, l_16_2, l_16_1, 86400 * l_16_8, l_16_5, 1)
    else
      do
        -- DECOMPILER ERROR at PC88: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC88: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC89: Confused about usage of register: R11 in 'UnsetPending'

        -- DECOMPILER ERROR at PC89: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC89: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC91: Confused about usage of register: R10 in 'UnsetPending'

        do return false, l_16_12 end
        local l_16_14 = nil
        l_16_14.AttributeValue = {AppName = l_16_1, Pid = l_16_0, AppCategory = l_16_2, Score = 0}
        l_16_14.AllTrackedApps = GetRollingQueueKeyValues(l_16_4, l_16_2)
        -- DECOMPILER ERROR at PC110: Confused about usage of register: R11 in 'UnsetPending'

        do
          local l_16_15 = nil
          if not pcall(MpCommon.AddProcessAttribute, l_16_0, l_16_10, safeJsonSerialize({AppName = l_16_1, Pid = l_16_0, AppCategory = l_16_2, Score = 0}), true) then
            l_16_14.err = MpCommon.AddProcessAttribute
            return false, l_16_14
          end
          do return true, l_16_14 end
          -- DECOMPILER ERROR at PC123: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

isAnomalousProcess = function(l_17_0, l_17_1)
  -- function num : 0_16
  local l_17_2, l_17_3 = GetAppomalyProcessAttribute(l_17_0)
  if not l_17_3 then
    return false, {}
  end
  local l_17_4 = safeJsonDeserialize(l_17_3)
  if not l_17_4 then
    return false, {}
  end
  do
    local l_17_5 = l_17_4.Score or 0
    do
      if not l_17_4.Reason then
        local l_17_6 = nil
      end
      do
        local l_17_7 = nil
        do
          local l_17_8 = nil
          while 1 do
            if (mp.GetParentProcInfo)(l_17_0) and ((mp.GetParentProcInfo)(l_17_0)).ppid and ((mp.GetParentProcInfo)(l_17_0)).image_path then
              do
                if not (MpCommon.GetProcessAttributeValue)(l_17_0, l_17_2) then
                  local l_17_9, l_17_10 = {}, l_17_4.ReasonCount or 0
                end
                if (MpCommon.GetProcessAttributeValue)(l_17_0, "inherit:" .. l_17_2) then
                  local l_17_11 = nil
                  if safeJsonDeserialize((MpCommon.GetProcessAttributeValue)(l_17_0, "inherit:" .. l_17_2)) then
                    for l_17_15,l_17_16 in pairs((safeJsonDeserialize((MpCommon.GetProcessAttributeValue)(l_17_0, "inherit:" .. l_17_2))).Reason) do
                      local l_17_12, l_17_13, l_17_14, l_17_15 = nil
                      -- DECOMPILER ERROR at PC65: Confused about usage of register: R14 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC68: Confused about usage of register: R15 in 'UnsetPending'

                      if not l_17_11[R14_PC65] then
                        l_17_11[R14_PC65] = R15_PC68
                        if R15_PC68.IndicatorScore then
                          l_17_8 = l_17_8 + R15_PC68.IndicatorScore
                          l_17_12 = l_17_12 + 1
                        end
                      end
                    end
                  end
                end
                do
                  -- DECOMPILER ERROR at PC79: Confused about usage of register: R8 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC82: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
          -- DECOMPILER ERROR at PC85: Confused about usage of register: R7 in 'UnsetPending'

          pcall(MpCommon.AddProcessAttribute, l_17_0, l_17_2, safeJsonSerialize(l_17_4), true)
          -- DECOMPILER ERROR at PC98: Confused about usage of register: R7 in 'UnsetPending'

          if l_17_8 > 35 or l_17_12 > 1 then
            (MpCommon.BmTriggerSig)(l_17_0, "AnomalyMultiStage", safeJsonSerialize(l_17_4))
            return true
          end
          do return false end
          -- WARNING: undefined locals caused missing assignments!
        end
      end
    end
  end
end

add_related_anomalydetections = function(l_18_0)
  -- function num : 0_17
  local l_18_1 = (mp.enum_mpattributesubstring)("Behavior:Win32/PFAp")
  if l_18_1 and #l_18_1 > 0 then
    for l_18_5,l_18_6 in ipairs(l_18_1) do
      (bm.add_related_string)("RelatedBMAppomalyHits", l_18_6, bm.RelatedStringBMReport)
    end
  end
  do
    return 
  end
end

add_parents_mp = function()
  -- function num : 0_18
  local l_19_0 = GetCurrentPPID()
  if not l_19_0 then
    return 
  end
  local l_19_1 = {}
  while 1 do
    if l_19_0 then
      local l_19_2, l_19_3 = pcall(MpCommon.IsFriendlyProcess, l_19_0)
      local l_19_4 = nil
      local l_19_5 = (MpCommon.GetImagePathFromPid)(l_19_0)
      if mp.ContextualExpandEnvironmentVariables and l_19_5 then
        local l_19_6 = pcall(mp.ContextualExpandEnvironmentVariables, l_19_5)
      end
      if mp.ContextualExpandEnvironmentVariables or l_19_5 then
        l_19_6 = mp
        l_19_6 = l_19_6.IsKnownFriendlyFile
        l_19_6 = l_19_6(l_19_5, false, true)
        local l_19_7 = nil
        l_19_4 = l_19_6
      end
      do
        l_19_6 = table
        l_19_6 = l_19_6.insert
        local l_19_8 = nil
        l_19_8 = l_19_1
        local l_19_9 = nil
        do
          local l_19_10 = nil
          l_19_6(l_19_8, l_19_9)
          l_19_9 = {ImagePath = l_19_5, IsFriendlyProcess = l_19_3, IsFriendlyImage = l_19_4, Pid = l_19_0}
          l_19_6 = mp
          l_19_6 = l_19_6.GetParentProcInfo
          l_19_8 = l_19_0
          l_19_6 = l_19_6(l_19_8)
          if not l_19_6 then
            return l_19_1
          end
          l_19_0 = l_19_6.ppid
          -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return l_19_1
end

isFileNameOrPath = function(l_20_0)
  -- function num : 0_19
  if (string.find)(l_20_0, "^[%w%._-]+%.exe$") then
    return true
  end
  if (sysio.IsFileExists)(l_20_0) then
    return true
  end
  return false
end

add_parents_AMSI = function()
  -- function num : 0_20
  if not (mp.get_mpattribute)("MpIsAMSIScan") then
    return 
  end
  local l_21_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  local l_21_1 = {}
  if l_21_0 then
    local l_21_2 = (mp.GetProcessCommandLine)(l_21_0)
    if l_21_2 then
      local l_21_3 = (mp.GetExecutablesFromCommandLine)(l_21_2)
      if l_21_3 then
        for l_21_7,l_21_8 in ipairs(l_21_3) do
          if isFileNameOrPath(l_21_8) then
            (table.insert)(l_21_1, l_21_8)
          end
        end
      end
      do
        local l_21_9, l_21_19 = (mp.GetParentProcInfo)(l_21_0)
        if l_21_9 then
          l_21_19 = l_21_9.ppid
          if l_21_19 then
            l_21_19 = mp
            l_21_19 = l_21_19.GetProcessCommandLine
            l_21_19 = l_21_19(l_21_9.ppid)
            local l_21_10, l_21_20 = nil
            if l_21_19 then
              l_21_10 = mp
              l_21_10 = l_21_10.GetExecutablesFromCommandLine
              l_21_20 = l_21_19
              l_21_10 = l_21_10(l_21_20)
              local l_21_11, l_21_21 = nil
              l_21_20 = ipairs
              l_21_11 = l_21_10
              l_21_20 = l_21_20(l_21_11)
              for l_21_15,l_21_16 in l_21_20 do
                local l_21_14, l_21_15, l_21_16 = nil
                l_21_14 = isFileNameOrPath
                l_21_15 = l_21_13
                l_21_14 = l_21_14(l_21_15)
                if l_21_14 then
                  local l_21_25, l_21_26 = nil
                  l_21_14 = table
                  l_21_14 = l_21_14.insert
                  local l_21_27 = nil
                  l_21_15 = l_21_1
                  local l_21_28 = nil
                  l_21_16 = l_21_13
                  local l_21_29 = nil
                  l_21_14(l_21_15, l_21_16)
                end
              end
              -- DECOMPILER ERROR at PC78: Confused about usage of register R9 for local variables in 'ReleaseLocals'

            end
          end
        end
        l_21_2 = table_dedup
        local l_21_17 = nil
        l_21_3 = l_21_1
        do
          local l_21_18 = nil
          do return l_21_2(l_21_3) end
          -- DECOMPILER ERROR at PC82: Confused about usage of register R8 for local variables in 'ReleaseLocals'

        end
      end
    end
  end
end

CleanUpIndicators = function(l_22_0, l_22_1)
  -- function num : 0_21
  local l_22_2 = (MpCommon.GetCurrentTimeT)()
  local l_22_3 = 0
  for l_22_7,l_22_8 in pairs(l_22_0) do
    if not l_22_8.TimeStamp or l_22_2 - l_22_8.TimeStamp > 259200 then
      l_22_0[l_22_7] = nil
      l_22_1 = l_22_1 - (l_22_8.IndicatorScore or 0)
    else
      l_22_3 = l_22_3 + 1
    end
  end
  return l_22_0, l_22_3, l_22_1
end

isSimilarIndicator = function(l_23_0, l_23_1, l_23_2)
  -- function num : 0_22
  local l_23_3 = l_23_2.IndicatorScore
  local l_23_4 = nil
  if (string.find)(l_23_1, "SuspFileDrop", 1, true) then
    for l_23_8,l_23_9 in pairs(l_23_0) do
      if (string.find)(l_23_8, "SuspFileDrop", 1, true) and (l_23_8 == l_23_1 or (string.match)(l_23_8, "SuspFileDrop%[(%d+)%]%[(.-)%]") == (string.match)(l_23_1, "SuspFileDrop%[(%d+)%]%[(.-)%]")) then
        l_23_4 = true
        if l_23_9.IndicatorScore < l_23_3 then
          l_23_3 = l_23_9.IndicatorScore
        end
      end
    end
    if l_23_4 then
      return true, l_23_3 / 2
    else
      return false
    end
  end
  if (string.find)(l_23_1, "NoneDefaultDirectory", 1, true) then
    for l_23_13,l_23_14 in pairs(l_23_0) do
      if (string.find)(l_23_13, "NoneDefaultDirectory", 1, true) then
        local l_23_20 = (string.match)(l_23_13, "NoneDefaultDirectory%[(%d+)%]%[(.-)%]")
        local l_23_23, l_23_24 = , (string.match)(l_23_1, "NoneDefaultDirectory%[(%d+)%]%[(.-)%]")
        if l_23_23 == l_23_1 then
          return true, 0
        end
      end
    end
    return false
  end
  if (string.find)(l_23_1, "Base64Cmd_child", 1, true) then
    for l_23_18,l_23_19 in pairs(l_23_0) do
      local l_23_21 = string.find
      local l_23_22 = l_23_18
      l_23_21 = l_23_21(l_23_22, "Base64Cmd_child", 1, true)
      if l_23_21 then
        l_23_21 = l_23_19.IndicatorScore
        l_23_22 = l_23_2.IndicatorScore
        if l_23_21 == l_23_22 then
          l_23_4 = true
          l_23_21 = l_23_19.IndicatorScore
          if l_23_21 < l_23_3 then
            l_23_3 = l_23_19.IndicatorScore
          end
        end
      end
    end
    if l_23_4 then
      return true, l_23_3 / 2
    else
      return false
    end
  end
  if (string.find)(l_23_1, "SuspDownload", 1, true) then
    for l_23_28,l_23_29 in pairs(l_23_0) do
      if (string.find)(l_23_28, "SuspDownload", 1, true) and l_23_29.IndicatorScore == l_23_2.IndicatorScore then
        l_23_4 = true
        if l_23_29.IndicatorScore < l_23_3 then
          l_23_3 = l_23_29.IndicatorScore
        end
      end
    end
    if l_23_4 then
      return true, l_23_3 / 2
    else
      return false
    end
  end
  if (string.find)(l_23_1, "SuspDirectoryDrop", 1, true) then
    for l_23_33,l_23_34 in pairs(l_23_0) do
      if l_23_33 == l_23_1 then
        l_23_4 = true
        if l_23_34.IndicatorScore < l_23_3 then
          l_23_3 = l_23_34.IndicatorScore
        end
      end
    end
    if l_23_4 then
      return true, l_23_3 / 2
    else
      return false
    end
  end
  return false
end

IncreaseProcessAnomalyScore = function(l_24_0, l_24_1, l_24_2, l_24_3, l_24_4)
  -- function num : 0_23
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R5 in 'UnsetPending'

  do
    if not (MpCommon.GetProcessAttributeValue)(l_24_0, l_24_3 or "PFAppTracked") then
      local l_24_5, l_24_6 = , (MpCommon.GetProcessAttributeValue)(l_24_0, "inherit:" .. (l_24_3 or "PFAppTracked"))
      l_24_5 = "inherit:" .. l_24_5
    end
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R6 in 'UnsetPending'

    if not l_24_6 then
      return 0, {}
    end
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R6 in 'UnsetPending'

    local l_24_7 = nil
    if not safeJsonDeserialize(l_24_6) then
      return mp.CLEAN
    end
    if not l_24_4 then
      l_24_4 = {}
    end
    l_24_4.TimeStamp = (MpCommon.GetCurrentTimeT)()
    l_24_4.IndicatorScore = l_24_1
    if not (safeJsonDeserialize(l_24_6)).Reason then
      (safeJsonDeserialize(l_24_6)).Reason = {}
    end
    do
      if not (safeJsonDeserialize(l_24_6)).ReasonCount then
        local l_24_8 = nil
        for l_24_12,l_24_13 in pairs((safeJsonDeserialize(l_24_6)).Reason) do
          local l_24_9, l_24_10 = , 0
          l_24_10 = l_24_10 + 1
        end
        -- DECOMPILER ERROR at PC59: Confused about usage of register: R8 in 'UnsetPending'

        -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

        l_24_9.ReasonCount = l_24_10
      end
      -- DECOMPILER ERROR at PC60: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC64: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC65: Confused about usage of register: R7 in 'UnsetPending'

      do
        if l_24_9.ReasonCount >= 20 then
          local l_24_14, l_24_15 = nil
          if l_24_9.Reason < l_24_15.ReasonCount then
            l_24_15.Reason = CleanUpIndicators(l_24_9.Reason, l_24_9.Score)
            l_24_15.ReasonCount = l_24_9.Reason
            l_24_15.Score = l_24_9.Score
          end
        end
        -- DECOMPILER ERROR at PC73: Confused about usage of register: R7 in 'UnsetPending'

        if l_24_15.ReasonCount + 1 > 20 then
          local l_24_16 = nil
          -- DECOMPILER ERROR at PC78: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (MpCommon.BmTriggerSig)(l_24_0, "IncreaseProcAttribScoreError", "Indicators count exceeds the threshold" .. ";" .. safeJsonSerialize({CurrentAttributeValue = l_24_15, NewIndicator_Reason = l_24_2, NewIndicator_Value = l_24_4 or true}))
          -- DECOMPILER ERROR at PC97: Confused about usage of register: R9 in 'UnsetPending'

          return false, "Indicators count exceeds the threshold"
        end
        do
          -- DECOMPILER ERROR at PC99: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC104: Confused about usage of register: R7 in 'UnsetPending'

          do
            if not (l_24_15.Reason)[l_24_2] then
              local l_24_18, l_24_19 = nil
              if isSimilarIndicator(l_24_15.Reason, l_24_2, l_24_4) then
                l_24_1 = 
                l_24_4.IndicatorScore = l_24_15.Reason
              end
              -- DECOMPILER ERROR at PC114: Confused about usage of register: R7 in 'UnsetPending'

              -- DECOMPILER ERROR at PC116: Confused about usage of register: R7 in 'UnsetPending'

              -- DECOMPILER ERROR at PC116: Confused about usage of register: R7 in 'UnsetPending'

              if l_24_1 > 0 then
                l_24_15.ReasonCount = l_24_15.ReasonCount + 1
                -- DECOMPILER ERROR at PC117: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC119: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC119: Confused about usage of register: R7 in 'UnsetPending'

                l_24_15.Score = l_24_15.Score + l_24_1
                -- DECOMPILER ERROR at PC120: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC121: Confused about usage of register: R10 in 'UnsetPending'

                ;
                (l_24_15.Reason)[l_24_2] = l_24_4
              end
            end
            -- DECOMPILER ERROR at PC126: Confused about usage of register: R5 in 'UnsetPending'

            -- DECOMPILER ERROR at PC128: Confused about usage of register: R7 in 'UnsetPending'

            local l_24_20, l_24_21 = nil
            if not pcall(MpCommon.AddProcessAttribute, l_24_0, l_24_18, safeJsonSerialize(l_24_15), true) then
              local l_24_22 = nil
              local l_24_23 = nil
              local l_24_24 = nil
              if not l_24_24 then
                do
                  do
                    (MpCommon.BmTriggerSig)(l_24_0, "IncreaseProcAttribScoreError", "" .. ";" .. safeJsonSerialize(l_24_22))
                    do return false, l_24_24 end
                    isAnomalousProcess(l_24_0)
                    -- DECOMPILER ERROR at PC154: Confused about usage of register: R7 in 'UnsetPending'

                    do return true, l_24_22 end
                    -- DECOMPILER ERROR at PC156: freeLocal<0 in 'ReleaseLocals'

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

isInstalledApp = function(l_25_0)
  -- function num : 0_24
  if (not l_25_0 and GetCurrentPPID()) or not ((bm.get_current_process_startup_info)()).ppid then
    return false
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  local l_25_1 = nil
  while 1 do
    if l_25_1 and (MpCommon.GetImagePathFromPid)(((bm.get_current_process_startup_info)()).ppid) then
      local l_25_2, l_25_3, l_25_4 = , (MpCommon.StringRegExpSearch)("(?i)(?:\\\\program\\sfiles(?:\\s\\(x86\\))?)\\\\([^\\\\]+)(\\\\[^\\\\]+\\\\)?", (MpCommon.GetImagePathFromPid)(((bm.get_current_process_startup_info)()).ppid))
      if not l_25_4 then
        local l_25_6 = nil
        do
          -- DECOMPILER ERROR at PC40: Confused about usage of register: R7 in 'UnsetPending'

          if (not l_25_3 or "") .. (l_25_6 or "") ~= "" then
            return true, (not l_25_3 or "") .. (l_25_6 or ""), l_25_1
          end
          do
            local l_25_8 = nil
            if not (mp.GetParentProcInfo)(l_25_1) then
              return false
            end
            l_25_1 = ((mp.GetParentProcInfo)(l_25_1)).ppid
            l_25_2 = ((mp.GetParentProcInfo)(l_25_1)).image_path
            -- DECOMPILER ERROR at PC53: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC53: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC53: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC53: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC53: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  do return false end
  -- DECOMPILER ERROR at PC56: freeLocal<0 in 'ReleaseLocals'

end

GetAppomalyProcessAttribute = function(l_26_0)
  -- function num : 0_25
  local l_26_1 = {}
  -- DECOMPILER ERROR at PC3: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC4: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC5: Overwrote pending register: R3 in 'AssignReg'

  for l_26_5,l_26_6 in ("PFAppTracked")("PFApp_Parent") do
    local l_26_7 = (MpCommon.GetProcessAttributeValue)(l_26_0, l_26_6)
    if l_26_7 then
      return l_26_6, l_26_7
    else
      l_26_7 = (MpCommon.GetProcessAttributeValue)(l_26_0, "inherit:" .. l_26_6)
      if l_26_7 then
        return "inherit:" .. l_26_6, l_26_7
      end
    end
  end
  return 
end

GetDirectoryRiskScore = function(l_27_0)
  -- function num : 0_26
  if not l_27_0 then
    return 0
  end
  local l_27_1 = (string.match)(l_27_0, "^(.*)\\")
  if not l_27_1 then
    return 0
  end
  local l_27_2 = NormalizeFilePathWithEnvVariable(l_27_1)
  local l_27_3 = {}
  l_27_3["%temp%"] = 20
  l_27_3["%system%"] = 20
  l_27_3["%desktopdirectory%"] = 15
  l_27_3["%mypictures%"] = 15
  l_27_3["%windows%"] = 20
  l_27_3["%windir%"] = 20
  l_27_3["%mydocuments%"] = 15
  l_27_3["%common_startup%"] = 10
  l_27_3["%common_programs%"] = 10
  l_27_3["%systemdrive%"] = 20
  l_27_3["%programdata%"] = 20
  l_27_3["%recent%"] = 15
  l_27_3["%appdata%"] = 15
  l_27_3["%common_desktop%"] = 15
  l_27_3["%userprofile%"] = 15
  l_27_3["%startup%"] = 15
  l_27_3["%common_pictures%"] = 15
  l_27_3["%common_documents%"] = 15
  l_27_3["%localappdata%"] = 1
  l_27_3["%mymusic%"] = 15
  l_27_3["%programs%"] = 15
  l_27_3["%program_files%"] = 15
  l_27_3["%common_music%"] = 15
  l_27_3["%myvideo%"] = 15
  l_27_3["%common_video%"] = 15
  l_27_3["%startmenu%"] = 15
  l_27_3["%CSIDLResources%"] = 15
  l_27_3["%commonfiles%"] = 10
  do
    if (string.find)(l_27_0, "%w:$") or (string.find)(l_27_0, "%w:\\$") then
      local l_27_4 = (l_27_3[l_27_2] or 0) + 20
    end
    -- DECOMPILER ERROR at PC64: Confused about usage of register: R4 in 'UnsetPending'

    return l_27_4, l_27_2
  end
end

GetFileNameRandomnessScore = function(l_28_0)
  -- function num : 0_27
  if not l_28_0 then
    return 
  end
  local l_28_1 = 0
  local l_28_2 = 0
  local l_28_3 = 0
  for l_28_7 in l_28_0:gmatch("%x%x%x%x+") do
    if l_28_3 < #l_28_7 then
      l_28_3 = #l_28_7
    end
  end
  if l_28_3 > 0 then
    l_28_2 = #l_28_0
    l_28_1 = l_28_3
  end
  if #l_28_0 > 20 then
    if #l_28_0 <= 40 then
      l_28_1 = l_28_1 + (#l_28_0 - 20)
    else
      l_28_1 = l_28_1 + 20
    end
    l_28_2 = l_28_2 + 20
  end
  if l_28_2 > 0 then
    return (l_28_1) * 100 / (l_28_2)
  end
  return 0
end

NormalizeFileName = function(l_29_0)
  -- function num : 0_28
  if not l_29_0 then
    return 
  end
  l_29_0 = (string.lower)(l_29_0)
  local l_29_1 = "%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x"
  l_29_0 = l_29_0:gsub(l_29_1, "GUID")
  l_29_0 = (string.gsub)(l_29_0, "%d", "0")
  if #l_29_0 <= 20 or not (string.sub)(l_29_0, 1, 20) .. ":" .. #l_29_0 then
    return l_29_0
  end
end

isSimilarPath = function(l_30_0, l_30_1, l_30_2, l_30_3)
  -- function num : 0_29
  l_30_0 = l_30_0:gsub("\"", "")
  l_30_1 = l_30_1:gsub("\"", "")
  l_30_0 = NormalizeDirectory(l_30_0)
  l_30_1 = NormalizeDirectory(l_30_1)
  if l_30_0 == l_30_1 then
    return true
  end
  local l_30_4, l_30_5 = l_30_0:gsub("\\", "\\")
  local l_30_6, l_30_7 = l_30_1:gsub("\\", "\\")
  local l_30_8, l_30_9 = nil, nil
  if l_30_5 < l_30_7 then
    l_30_8 = l_30_1
    l_30_9 = l_30_0
  else
    l_30_8 = l_30_0
    l_30_9 = l_30_1
  end
  local l_30_10 = 0
  local l_30_11 = 0
  for l_30_15 in (string.gmatch)(l_30_8, "\\([^\\]+)") do
    for l_30_19 in (string.gmatch)(l_30_9, "\\([^\\]+)") do
      if l_30_15 == l_30_19 then
        l_30_11 = l_30_11 + 1
      end
    end
    l_30_10 = l_30_10 + 1
  end
  do
    if not l_30_3 or l_30_3 < 0 or l_30_10 < l_30_3 then
      l_30_3 = l_30_11
    end
    if l_30_11 < l_30_3 then
      return false
    end
    if not l_30_2 or type(l_30_2) ~= "number" or l_30_2 > 100 or l_30_2 < 0 then
      l_30_2 = 100
    end
    if l_30_11 == l_30_10 then
      return true
    end
    if l_30_2 <= (l_30_11) * 100 / (l_30_10) then
      return true
    end
    return false
  end
end

NormalizeDirectory = function(l_31_0)
  -- function num : 0_30
  if not l_31_0 then
    return 
  end
  l_31_0 = (mp.ContextualExpandEnvironmentVariables)(l_31_0)
  l_31_0 = (string.lower)(l_31_0)
  if (string.find)(l_31_0, "\\.+%.[%w%d]+$", 1, false) then
    l_31_0 = l_31_0:match("^(.*)[/\\]")
  end
  local l_31_1 = "%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x"
  l_31_0 = l_31_0:gsub(l_31_1, "{GUID}")
  local l_31_2 = "\\[%d%._-]+"
  l_31_0 = l_31_0:gsub(l_31_2, "\\{VERSION}")
  l_31_0 = (string.gsub)(l_31_0, "%d+", "0")
  return l_31_0
end

GetProcessNameScore = function(l_32_0)
  -- function num : 0_31
  if not l_32_0 then
    return 0
  end
  local l_32_1 = {}
  l_32_1["cmd.exe"] = 10
  l_32_1["powershell.exe"] = 10
  l_32_1["reg.exe"] = 5
  l_32_1.pwsh = 10
  l_32_1["regsvr.exe"] = 5
  l_32_1["curl.exe"] = 5
  l_32_1["certutil.exe"] = 5
  l_32_1["wmic.exe"] = 5
  l_32_1["net.exe"] = 5
  l_32_1["net1.exe"] = 5
  l_32_1["rundll32.exe"] = 5
  return l_32_1[l_32_0] or 0
end

GetFileExtensionScore = function(l_33_0)
  -- function num : 0_32
  if not l_33_0 then
    return 0
  end
  local l_33_1 = {}
  l_33_1.exe = 5
  l_33_1.dll = 1
  l_33_1.ps1 = 2
  l_33_1.bat = 2
  l_33_1.cmd = 2
  l_33_1.php = 1
  l_33_1.py = 1
  l_33_1.rb = 1
  l_33_1.js = 0
  l_33_1.asmx = 0
  l_33_1.aspx = 0
  l_33_1.html = 0
  l_33_1.jar = 1
  l_33_1.class = 0
  l_33_1.tmp = -5
  return l_33_1[l_33_0] or 0
end

NormalizeFilePathWithEnvVariable = function(l_34_0)
  -- function num : 0_33
  if not l_34_0 or not (string.find)(l_34_0, "^%w:\\") then
    return l_34_0
  end
  local l_34_1 = {}
  -- DECOMPILER ERROR at PC43: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC44: Overwrote pending register: R2 in 'AssignReg'

  local l_34_2 = "%system%"
  -- DECOMPILER ERROR at PC45: Overwrote pending register: R3 in 'AssignReg'

  local l_34_3 = "%program_files%"
  -- DECOMPILER ERROR at PC46: Overwrote pending register: R4 in 'AssignReg'

  local l_34_4 = "%windows%"
  local l_34_5 = {}
  -- DECOMPILER ERROR at PC48: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R7 in 'AssignReg'

  for l_34_9,l_34_10 in ("%programdata%")("%localappdata%") do
    -- DECOMPILER ERROR at PC52: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC53: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC54: Overwrote pending register: R13 in 'AssignReg'

    if not ("%userprofile%")("%commonfiles%", "%desktopdirectory%") then
      local l_34_11, l_34_12 = (mp.ContextualExpandEnvironmentVariables)(l_34_10)
      -- DECOMPILER ERROR at PC66: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC68: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC72: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC75: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC75: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC78: Overwrote pending register: R17 in 'AssignReg'

      if l_34_11 and not l_34_12 then
        l_34_12(l_34_2, l_34_10, ("%common_documents%")("%common_desktop%"), l_34_3, "%startup%")
        -- DECOMPILER ERROR at PC80: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC83: Overwrote pending register: R12 in 'AssignReg'

      end
    else
      do
        do
          -- DECOMPILER ERROR at PC86: Overwrote pending register: R12 in 'AssignReg'

          -- DECOMPILER ERROR at PC90: Confused about usage of register: R11 in 'UnsetPending'

          -- DECOMPILER ERROR at PC91: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC91: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC91: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  local l_34_13 = l_34_0:lower()
  local l_34_14 = ""
  local l_34_15 = ""
  for l_34_19,l_34_20 in pairs(l_34_5) do
    -- DECOMPILER ERROR at PC109: Overwrote pending register: R18 in 'AssignReg'

  end
  do
    do
      do return l_34_13:find(l_34_19) and #l_34_15 < #l_34_19 and l_34_14 or l_34_13 end
      -- DECOMPILER ERROR at PC123: freeLocal<0 in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

hasSeenBefore = function(l_35_0, l_35_1, l_35_2, l_35_3)
  -- function num : 0_34
  local l_35_4 = l_35_3 or "Behaviors_GEN"
  local l_35_5, l_35_6 = 86400 * l_35_2, IsKeyInRollingQueue(l_35_4, l_35_0 .. l_35_1)
  if not l_35_4 then
    AppendToRollingQueue(l_35_4, l_35_0, 1, l_35_5, 1000)
    return false, 0
  else
    if l_35_4 then
      AppendToRollingQueue(R9_PC27, l_35_0, tonumber(R9_PC27) + 1, l_35_5, 1000)
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC37: Overwrote pending register: R9 in 'AssignReg'

      return true, R9_PC27
    end
  end
end

CommandlineMLScore = function()
  -- function num : 0_35
  local l_36_0 = (mp.enum_mpattributesubstring)("RPF:CmdLineMLv2:")
  local l_36_1 = 0
  if l_36_0 and #l_36_0 > 0 then
    for l_36_5,l_36_6 in ipairs(l_36_0) do
      local l_36_7 = (string.match)(l_36_6, "RPF:CmdLineMLv2:(%d+)")
      if l_36_7 then
        l_36_7 = tonumber(l_36_7)
        if l_36_1 < l_36_7 then
          l_36_1 = l_36_7
        end
      end
    end
  end
  do
    return l_36_1
  end
end

VectorSimilarityRatio = function(l_37_0, l_37_1)
  -- function num : 0_36
  if not l_37_0 or not l_37_1 then
    return 0
  end
  local l_37_2 = {}
  if #l_37_1 == 0 or #l_37_0 == 0 then
    return 0
  end
  if #l_37_1 < 5 or #l_37_0 < 5 then
    return 0
  end
  local l_37_3, l_37_4 = nil, nil
  if #l_37_0 < #l_37_1 then
    l_37_3 = #l_37_1
    l_37_4 = #l_37_0
  else
    l_37_3 = #l_37_0
    l_37_4 = #l_37_1
  end
  for l_37_8,l_37_9 in ipairs(l_37_0) do
    for l_37_13,l_37_14 in ipairs(l_37_1) do
      if l_37_9 == l_37_14 then
        (table.insert)(l_37_2, l_37_9)
      end
    end
  end
  local l_37_15 = #l_37_2 * 100 / l_37_3
  local l_37_16 = #l_37_2 * 100 / l_37_4
  return l_37_16 < l_37_15 and l_37_15 or l_37_16, l_37_2
end

IsPotentiallyClean = function(l_38_0, l_38_1, l_38_2)
  -- function num : 0_37
  if not l_38_1 or not l_38_2 then
    return false
  end
  if l_38_0 == "CmdLine" then
    if type(l_38_2) ~= "table" then
      return false
    end
    local l_38_3 = l_38_0 .. "_Appomaly_90d"
    local l_38_4 = (MpCommon.GetCurrentTimeT)()
    local l_38_5 = GetRollingQueueKeyValues(l_38_3, l_38_1)
    if l_38_5 then
      for l_38_9,l_38_10 in ipairs(l_38_5) do
        if l_38_4 - l_38_10.insert_time > 604800 then
          local l_38_11 = (string.gmatch)(l_38_10.value, "([^|]+)")
          local l_38_12, l_38_20, l_38_21 = VectorSimilarityRatio(l_38_2, l_38_11)
          if l_38_12 >= 70 then
            l_38_21 = true
            return l_38_21, l_38_12, l_38_11
          end
        end
      end
    end
    do
      local l_38_13 = 7776000
      local l_38_14 = (table.concat)(l_38_2, "|")
      local l_38_15 = AppendToRollingQueue
      local l_38_16 = l_38_3
      local l_38_17 = l_38_1
      local l_38_18 = l_38_14
      do
        local l_38_19 = l_38_13
        l_38_15(l_38_16, l_38_17, l_38_18, l_38_19, 5000, 0)
        l_38_15 = false
        do return l_38_15 end
        if (string.find)(l_38_0, "CleanProcessChain_", 1, true) then
          if type(l_38_2) ~= "string" then
            return false
          end
          local l_38_22 = 210
          local l_38_23 = l_38_1 .. "_" .. l_38_2
          local l_38_24 = (crypto.CRC32Buffer)(-1, (string.lower)(l_38_23), 0, (string.len)(l_38_23))
          if (MpCommon.NidSearch)(l_38_22, l_38_24) and l_38_22 == "#Appomaly_" .. l_38_0 .. "_" .. l_38_1 then
            return true
          end
          return false
        end
        do
          if l_38_0 == "CleanFileDrop" then
            if type(l_38_2) ~= "string" then
              return false
            end
            local l_38_25 = 210
            local l_38_26 = l_38_1 .. "_" .. l_38_2
            local l_38_27 = (crypto.CRC32Buffer)(-1, (string.lower)(l_38_26), 0, (string.len)(l_38_26))
            local l_38_28, l_38_29 = (MpCommon.NidSearch)(l_38_25, l_38_27)
            if l_38_28 and (l_38_29 == "#Appomaly_CleanFileDrop_" .. l_38_1 or l_38_29 == "#Appomaly_CleanProcessChain_" .. l_38_1) then
              return true
            end
            return false
          end
          do
            do
              if l_38_0 == "CmdLine_Basic" then
                local l_38_30 = {}
                -- DECOMPILER ERROR at PC174: No list found for R3 , SetList fails

                -- DECOMPILER ERROR at PC175: Overwrote pending register: R4 in 'AssignReg'

                -- DECOMPILER ERROR at PC176: Overwrote pending register: R5 in 'AssignReg'

                -- DECOMPILER ERROR at PC177: Overwrote pending register: R6 in 'AssignReg'

                if ("$mypsboundparameters%.containskey%(cimsession%)")("get%-wmiobject.*root\\microsoft\\windows\\defender.*$%($mpcomputerstatus%.realtimeprotectionenabled%)", "add%-type.*%-assemblyname.*system%.serviceprocess%.servicecontroller%(windefend%)", false) then
                  return true
                end
                return false
              end
              if type(l_38_2) ~= "string" then
                return false
              end
              local l_38_31 = 210
              local l_38_32 = l_38_1 .. "_" .. l_38_2
              local l_38_33 = (crypto.CRC32Buffer)(-1, (string.lower)(l_38_32), 0, (string.len)(l_38_32))
              if (MpCommon.NidSearch)(l_38_31, l_38_33) and l_38_31 == "#Appomaly_" .. l_38_0 .. "_" .. l_38_1 then
                return true
              end
              return false
            end
          end
        end
      end
    end
  end
end


