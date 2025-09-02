-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\AppomalyHelpers\1.luac 

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
              l_1_5 = ((string.lower)(R8_PC55)):match("-ap \"(.-)\"")
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
              local l_1_13 = nil
              if contains(l_1_4, "java.exe") then
                _ = (MpCommon.StringRegExpSearch)("(home=\\\\\"([^\\\\\"]+)|home=([^\\s]+)|program files \\(x86\\)\\\\\\\\([^\\\\]+)|program files\\\\\\\\([^\\\\]+))", l_1_3)
                if l_1_13 then
                  return l_1_13
                end
              else
                local l_1_14 = nil
                local l_1_15 = checkParentCmdlineCaseInsensitive
                local l_1_16 = l_1_0
                local l_1_17 = {}
                local l_1_18 = R8_PC55
                -- DECOMPILER ERROR at PC129: No list found for R7 , SetList fails

                -- DECOMPILER ERROR at PC130: Overwrote pending register: R8 in 'AssignReg'

                l_1_15 = l_1_15(l_1_16, l_1_17, l_1_18)
                -- DECOMPILER ERROR at PC134: Overwrote pending register: R8 in 'AssignReg'

                -- DECOMPILER ERROR at PC135: Overwrote pending register: R8 in 'AssignReg'

                -- DECOMPILER ERROR at PC136: Overwrote pending register: R9 in 'AssignReg'

                if l_1_17 then
                  l_1_18 = l_1_18({"\\java.exe", "program files"}, (string.lower)(R11_PC140))
                  -- DECOMPILER ERROR at PC142: Overwrote pending register: R3 in 'AssignReg'

                  l_1_16 = l_1_18
                  if l_1_13 then
                    return l_1_13
                  end
                end
              end
              do
                -- DECOMPILER ERROR at PC158: Overwrote pending register: R3 in 'AssignReg'

                if contains(l_1_4, "ruby.exe") then
                  _ = (MpCommon.StringRegExpSearch)("(mongrel|httpd|thin|puma|rails)", l_1_3)
                  if l_1_13 then
                    return l_1_13
                  end
                else
                  local l_1_19 = nil
                  local l_1_20 = {}
                  local l_1_21 = {"ruby.exe", "mongrel"}
                  local l_1_22 = {"ruby.exe", "httpd"}
                  local l_1_23 = {"ruby.exe", "thin"}
                  local l_1_24 = {"ruby.exe", "puma"}
                  -- DECOMPILER ERROR at PC185: No list found for R5 , SetList fails

                  l_1_21 = checkParentCmdlineCaseInsensitive
                  l_1_22 = l_1_0
                  l_1_23 = l_1_20
                  l_1_24 = 15
                  l_1_21 = l_1_21(l_1_22, l_1_23, l_1_24)
                  -- DECOMPILER ERROR at PC193: Overwrote pending register: R10 in 'AssignReg'

                  -- DECOMPILER ERROR at PC198: Overwrote pending register: R3 in 'AssignReg'

                  if l_1_23 then
                    l_1_24 = (({"ruby.exe", "rails"}).StringRegExpSearch)("(mongrel|httpd|thin|puma|rails)", R12_PC197)
                    if l_1_13 then
                      return l_1_13
                    end
                  end
                end
                do
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
      local l_3_19 = "new%-object.*.download"
      local l_3_20 = "(FILENAME|powershell).*new-object.*.download"
      -- DECOMPILER ERROR at PC186: Unhandled construct in 'MakeBoolean' P1

      if (string.find)(l_3_0, l_3_19, 1, false) and #l_3_14 == 2 then
        (mp.set_mpattribute)("Appomaly_HighlySuspCmd_Pattern_1")
      end
      if #l_3_14 <= 4 and (MpCommon.StringRegExpSearch)(l_3_20, l_3_0) then
        (mp.set_mpattribute)("Appomaly_HighlySuspCmd_Pattern_2")
      end
      if #l_3_14 <= 3 then
        local l_3_21, l_3_22 = (string.gsub)(l_3_0, "%$", "")
        if l_3_22 >= 6 then
          (mp.set_mpattribute)("Appomaly_Pattern_Obfuscated")
        else
          local l_3_23, l_3_24 = (string.gsub)(l_3_0, "\\u0", "")
          if l_3_24 >= 5 then
            (mp.set_mpattribute)("Appomaly_Pattern_Obfuscated")
          end
        end
      end
      do
        if #l_3_14 <= 6 and (MpCommon.StringRegExpSearch)("iex\\(|invoke", l_3_0) then
          (mp.set_mpattribute)("Appomaly_Pattern_Invoke")
        end
        return l_3_14
      end
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
    return -100, l_4_4
  end
  if l_4_0:find("localhost", 1, true) or l_4_0:find("127.0.0.1", 1, true) or l_4_0:find("0.0.0.0", 1, true) or l_4_0:find("https?://%[fd00[%x:]*%]", 1, false) then
    l_4_4.URL_CLEAN = "LOCALHOST"
    l_4_4.Url_Score = 0
    return -100, l_4_4
  end
  if StringStartsWith(l_4_0, "%2fLM%2fW3SVC%2f") then
    l_4_4.URL_CLEAN = "InternalIIS"
    l_4_4.Url_Score = 0
    return -100, l_4_4
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
        return -100, l_4_4
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
              return -100, l_4_4
            end
          else
            do
              do
                do return 0, nil end
                local l_4_17, l_4_18 = (mp.CheckUrl)(l_4_0)
                if l_4_17 == 1 and l_4_18 == 1 then
                  l_4_4.URL_CLEAN = "CheckURL"
                  l_4_4.Url_Score = 0
                  return -100, l_4_4
                end
                local l_4_19 = nil
                if l_4_4.IP then
                  l_4_19 = l_4_0
                else
                  if (string.find)(l_4_1, "FAppAnomalousOutbound", 1, true) and not l_4_0:match("^%a+://([^:/]+)") then
                    l_4_19 = l_4_0:match("([^:/]+)")
                    if not l_4_0:match("ftp://.*@([^:/]+)") then
                      l_4_19 = l_4_0:match("^%a+://([^:/]+)")
                    end
                    if not l_4_19 then
                      l_4_4.Url_Score = 0
                      l_4_4.ERROR = "Error grading url"
                      return 0, l_4_4
                    end
                    local l_4_20 = {}
                    -- DECOMPILER ERROR at PC237: No list found for R17 , SetList fails

                    -- DECOMPILER ERROR at PC238: Overwrote pending register: R18 in 'AssignReg'

                    -- DECOMPILER ERROR at PC239: Overwrote pending register: R19 in 'AssignReg'

                    -- DECOMPILER ERROR at PC240: Overwrote pending register: R20 in 'AssignReg'

                    if (".microsoft")("chocolatey.org", "app1appv1p.sicredi.net.br") then
                      return 0, l_4_4
                    end
                    -- DECOMPILER ERROR at PC250: Overwrote pending register: R21 in 'AssignReg'

                    local l_4_21, l_4_22, l_4_23 = AnomalyTableCheck("Appomaly_Network_HOST_Global", l_4_19, "prod.setup.itsupport247")
                    -- DECOMPILER ERROR at PC266: Overwrote pending register: R22 in 'AssignReg'

                    if (l_4_21 ~= true or l_4_22 ~= false or l_4_21 == false) and l_4_22 == false then
                      return -100, "cdn.immy.bot"
                    end
                    -- DECOMPILER ERROR at PC270: Overwrote pending register: R23 in 'AssignReg'

                    local l_4_24 = GetRollingQueueKeyValue("Global_CLEAN_Url_Cache", "timestamp.digicert.com")
                    if l_4_24 then
                      l_4_4.URL_CLEAN = "Global_Url_Cache"
                      l_4_4.Url_Score = 0
                      return -100, l_4_4
                    end
                    local l_4_25 = {}
                    l_4_25.SIG_CONTEXT = "Appomaly" .. l_4_1 or ""
                    l_4_25.FILELESS = "true"
                    l_4_25.CMDLINE_URL = "true"
                    local l_4_26 = GetCurrentPPID()
                    do
                      if l_4_26 then
                        local l_4_27, l_4_28 = GetAppomalyProcessAttribute(l_4_26)
                        if l_4_28 then
                          l_4_25.PROCESS_CONTEXT = l_4_28
                        end
                      end
                      local l_4_29 = GetRollingQueueKeyValue("Global_Url_Cache_Appomaly", l_4_19)
                      if l_4_29 then
                        l_4_29 = tonumber(l_4_29)
                        l_4_4.UrlRep_Determination = l_4_29
                        -- DECOMPILER ERROR at PC312: Overwrote pending register: R3 in 'AssignReg'

                        if l_4_29 == 7 then
                          l_4_4.SusUrlRep = true
                        else
                          -- DECOMPILER ERROR at PC323: Overwrote pending register: R3 in 'AssignReg'

                          if l_4_29 == 2 or l_4_29 == 3 or l_4_29 == 5 or l_4_29 == 6 then
                            l_4_4.BadUrlRep = true
                            local l_4_30 = (MpCommon.Base64Encode)(l_4_19 .. "_" .. l_4_29)
                            ;
                            (mp.set_mpattribute)("Appomaly_BadUrlRep_Found_" .. l_4_30)
                          end
                        end
                      else
                        do
                          if l_4_2 then
                            local l_4_31 = SafeGetUrlReputation
                            local l_4_32 = {}
                            -- DECOMPILER ERROR at PC344: No list found for R26 , SetList fails

                            -- DECOMPILER ERROR at PC345: Overwrote pending register: R27 in 'AssignReg'

                            l_4_31 = l_4_31(l_4_32, l_4_0, false, 2000)
                            if l_4_31 then
                              l_4_32 = l_4_31.urls
                              if l_4_32 then
                                l_4_32 = l_4_31.urls
                                l_4_32 = l_4_32[l_4_0]
                                if l_4_32 then
                                  l_4_32 = l_4_31.urls
                                  l_4_32 = l_4_32[l_4_0]
                                  l_4_32 = l_4_32.determination
                                  if l_4_32 == 1 then
                                    l_4_32 = l_4_31.urls
                                    l_4_32 = l_4_32[l_4_0]
                                    l_4_32 = l_4_32.confidence
                                    if l_4_32 >= 90 then
                                      l_4_32 = AppendToRollingQueue
                                      l_4_32("Global_CLEAN_Url_Cache", l_4_19, 1, 1209600, 1000)
                                      l_4_4.URL_CLEAN = "UrlRepLookup"
                                      l_4_4.Url_Score = 0
                                      l_4_32 = -100
                                      return l_4_32, l_4_4
                                    end
                                  end
                                end
                              end
                            end
                            if l_4_31 then
                              l_4_32 = l_4_31.urls
                              if l_4_32 then
                                l_4_32 = l_4_31.urls
                                l_4_32 = l_4_32[l_4_0]
                                if l_4_32 then
                                  l_4_32 = l_4_31.urls
                                  l_4_32 = l_4_32[l_4_0]
                                  l_4_32 = l_4_32.confidence
                                  if l_4_32 then
                                    l_4_32 = AppendToRollingQueue
                                    l_4_32("Global_Url_Cache_Appomaly", l_4_19, ((l_4_31.urls)[l_4_0]).determination, 864000, 1000)
                                    l_4_32 = l_4_31.urls
                                    l_4_32 = l_4_32[l_4_0]
                                    l_4_32 = l_4_32.confidence
                                    l_4_4.UrlRep_Confidence = l_4_32
                                    l_4_32 = l_4_31.urls
                                    l_4_32 = l_4_32[l_4_0]
                                    l_4_32 = l_4_32.determination
                                    l_4_4.UrlRep_Determination = l_4_32
                                    l_4_32 = l_4_31.urls
                                    l_4_32 = l_4_32[l_4_0]
                                    l_4_32 = l_4_32.determination
                                    if l_4_32 ~= 4 then
                                      l_4_32 = l_4_31.urls
                                      l_4_32 = l_4_32[l_4_0]
                                      l_4_32 = l_4_32.determination
                                      if l_4_32 ~= 1 then
                                        do
                                          l_4_32 = l_4_31.urls
                                          l_4_32 = l_4_32[l_4_0]
                                          l_4_32 = l_4_32.determination
                                          -- DECOMPILER ERROR at PC426: Overwrote pending register: R3 in 'AssignReg'

                                          if l_4_32 ~= 7 then
                                            l_4_4.BadUrlRep = true
                                            l_4_32 = MpCommon
                                            l_4_32 = l_4_32.Base64Encode
                                            l_4_32 = l_4_32(l_4_0 .. "_" .. ((l_4_31.urls)[l_4_0]).determination)
                                            ;
                                            (mp.set_mpattribute)("Appomaly_BadUrlRep_Found_" .. l_4_32)
                                          else
                                            l_4_32 = l_4_31.urls
                                            l_4_32 = l_4_32[l_4_0]
                                            l_4_32 = l_4_32.determination
                                            -- DECOMPILER ERROR at PC449: Overwrote pending register: R3 in 'AssignReg'

                                            if l_4_32 == 7 then
                                              l_4_4.SusUrlRep = true
                                            end
                                          end
                                          local l_4_33, l_4_34 = (MpCommon.StringRegExpSearch)("\\.(exe|dll|ps1|bat|rar|msi|torrent|png|gif|bin|zip|img|gz|vbs|txt)$", l_4_0)
                                          -- DECOMPILER ERROR at PC458: Overwrote pending register: R3 in 'AssignReg'

                                          if l_4_33 then
                                            l_4_4.Susfile_extension = true
                                          end
                                          if l_4_4.Susfile_extension and l_4_4.IP then
                                            (mp.set_mpattribute)("Appomaly_SuspUrl_Found")
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
                return true, true, l_5_7.Error
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
            -- DECOMPILER ERROR at PC149: Overwrote pending register: R6 in 'AssignReg'

            l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, l_5_20 + 1, 1)
            if not l_5_5 and l_5_8 and l_5_9 ~= "HSTR" then
              l_5_7.Error = tostring(l_5_6) .. "; Failed to update existing event with marker"
              ;
              (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTable_Error", safeJsonSerialize(l_5_7))
              local l_5_21 = false
              return l_5_21, l_5_17 < l_5_2, l_5_7.Error
            end
            l_5_4 = (MpCommon.AnomalyTableLookup)(l_5_0)
            if l_5_4 then
              l_5_4.Marker_Days_Elapsed_ActualTime = l_5_17
              l_5_4.Marker_Days_Elapsed_EventUnbiasedTime = l_5_18
            end
            local l_5_24 = false
            return l_5_24, l_5_17 < l_5_2, l_5_4
          end
        else
          l_5_13 = l_5_12
          -- DECOMPILER ERROR at PC204: Overwrote pending register: R6 in 'AssignReg'

          l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_3, l_5_12, 1)
          if l_5_5 and l_5_8 and l_5_9 ~= "HSTR" then
            (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTableMarker_Rcr", safeJsonSerialize(l_5_7))
            -- DECOMPILER ERROR at PC228: Overwrote pending register: R6 in 'AssignReg'

            l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, 1, 1)
          end
          if not l_5_5 and l_5_8 and l_5_9 ~= "HSTR" then
            l_5_7.Error = tostring(l_5_6) .. "; Failed to add a new event with marker for a new app"
            ;
            (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTable_Error", safeJsonSerialize(l_5_7))
            return true, true, l_5_7.Error
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
        local l_5_27 = (MpCommon.AnomalyEventLookup)(l_5_0, l_5_1, 1)
        local l_5_28 = l_5_4.TableAge / 1440 * 60
        -- DECOMPILER ERROR at PC297: Overwrote pending register: R6 in 'AssignReg'

        if l_5_4.TableAge < 1440 * l_5_2 then
          if not l_5_27 then
            l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, 1, 1)
          else
            -- DECOMPILER ERROR at PC309: Overwrote pending register: R6 in 'AssignReg'

            l_5_5 = pcall(MpCommon.AnomalyEventUpdate, l_5_0, l_5_1, l_5_27.Count + 1, 1)
          end
          if l_5_5 then
            l_5_4 = (MpCommon.AnomalyTableLookup)(l_5_0)
            l_5_4.TableAgeDays = l_5_28
            return l_5_27 == nil, true, l_5_4
          else
            l_5_7.Error = tostring(l_5_6) .. "; Table age."
            if l_5_8 and l_5_9 ~= "HSTR" then
              (MpCommon.BmTriggerSig)(l_5_8, "AnomalyTable_Error", safeJsonSerialize(l_5_7))
            end
            return nil
          end
        elseif not (MpCommon.AnomalyEventLookup)(l_5_0, l_5_1, 1) then
          l_5_4.TableAgeDays = l_5_28
          return true, false, l_5_4
        else
          l_5_4.TableAgeDays = l_5_28
          return false, false, l_5_4
        end
      else
        -- DECOMPILER ERROR at PC376: Overwrote pending register: R6 in 'AssignReg'

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
      -- DECOMPILER ERROR: 22 unprocessed JMP targets
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
  local l_7_1 = {}
  -- DECOMPILER ERROR at PC5: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC8: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC9: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC10: Overwrote pending register: R4 in 'AssignReg'

  l_7_0["system.reflection.assembly"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["iisy.invoke"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0.tcplistener, l_7_1 = l_7_1, {5, 5, 10}
  l_7_0.accepttcpclient, l_7_1 = l_7_1, {5, 5, 10}
  l_7_0.tcpclient, l_7_1 = l_7_1, {5, 5, 10}
  l_7_0.downloadstring, l_7_1 = l_7_1, {10, 10, 10}
  l_7_0.downloadfile, l_7_1 = l_7_1, {0, 0, 10}
  l_7_0.uploadfile, l_7_1 = l_7_1, {10, 10, 10}
  l_7_0["send-mailmessage"], l_7_1 = l_7_1, {0, 0, 10}
  l_7_0["[^r]shell[^.]"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0.defender, l_7_1 = l_7_1, {20, 20, 20}
  l_7_0["disable.*true"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["disable.*1"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0.stop, l_7_1 = l_7_1, {5, 5, 1}
  l_7_0.remove, l_7_1 = l_7_1, {5, 5, 1}
  l_7_0.exclusion, l_7_1 = l_7_1, {1, 1, 1}
  l_7_0.sense, l_7_1 = l_7_1, {1, 1, 1}
  l_7_0.scriptblock, l_7_1 = l_7_1, {5, 5, 3}
  l_7_0.webrequest, l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["user%-agent"], l_7_1 = l_7_1, {10, 10, 10}
  l_7_0.webclient, l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["unicode.getstring"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0.whoami, l_7_1 = l_7_1, {1, 1, 10}
  l_7_0["net user"], l_7_1 = l_7_1, {1, 1, 1}
  l_7_0["bitsadmin.*http"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["certutil.*http"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["invoke%-webrequest"], l_7_1 = l_7_1, {5, 5, 10}
  l_7_0["invoke%-restmethod"], l_7_1 = l_7_1, {5, 5, 10}
  l_7_0.curl, l_7_1 = l_7_1, {5, 6, 6}
  l_7_0.wget, l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["new%-localuser"], l_7_1 = l_7_1, {5}
  l_7_0["net group /add"], l_7_1 = l_7_1, {5}
  l_7_0["new%-localgroup"], l_7_1 = l_7_1, {5}
  l_7_0.icacls, l_7_1 = l_7_1, {1}
  l_7_0["set%-acl"], l_7_1 = l_7_1, {1}
  l_7_0["set%-itemproperty"], l_7_1 = l_7_1, {1}
  l_7_0["set%-mppreference"], l_7_1 = l_7_1, {5, 5, 3}
  l_7_0["add%-mppreference"], l_7_1 = l_7_1, {5, 5, 3}
  l_7_0.netstat, l_7_1 = l_7_1, {1, 1, 1}
  l_7_0.nmap, l_7_1 = l_7_1, {1, 1, 1}
  l_7_0.runas, l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["enable%-privilege"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0.psexec, l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["invoke%-command"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0.taskkill, l_7_1 = l_7_1, {1, 1, 1}
  l_7_0["stop%-process"], l_7_1 = l_7_1, {5, 5, 5}
  l_7_0["reg add"], l_7_1 = l_7_1, {1, 1, 1}
  l_7_0["set%-itemproperty.*disable"], l_7_1 = l_7_1, {2, 2, 2}
  l_7_0["[^by]pass"], l_7_1 = l_7_1, {2, 2, 0}
  l_7_0.password, l_7_1 = l_7_1, {2, 2, 2}
  l_7_0["invoke%-expression"], l_7_1 = l_7_1, {1, 5, 7}
  l_7_0.dllimport, l_7_1 = l_7_1, {1, 10, 10}
  l_7_0["using system%.runtime"], l_7_1 = l_7_1, {1, 5, 5}
  l_7_0["scripting.filesystemobject"], l_7_1 = l_7_1, {1, 5, 5}
  l_7_0["http://"], l_7_1 = l_7_1, {1, 1, 1}
  l_7_0["https://"], l_7_1 = l_7_1, {1, 1, 1}
  l_7_0["start%-sleep"], l_7_1 = l_7_1, {1, 2, 2}
  l_7_0["windowsinstaller.installer.*installproduct"], l_7_1 = l_7_1, {0, 1, 10}
  l_7_0["%-uri"], l_7_1 = l_7_1, {0, 1, 5}
  l_7_0["%-body"], l_7_1 = l_7_1, {0, 1, 5}
  l_7_0["%-content-type"], l_7_1 = l_7_1, {0, 1, 5}
  l_7_0[".invoke%("], l_7_1 = l_7_1, {0, 0, 10}
  l_7_0.tanium, l_7_1 = l_7_1, {-60, -60, -60}
  l_7_0.ansible, l_7_1 = l_7_1, {-60, -60, -60}
  l_7_0["synchash.devmode"], l_7_1 = l_7_1, {-60, -60, -60}
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
        for l_8_29,l_8_30 in l_8_25 do
          local l_8_30 = nil
          -- DECOMPILER ERROR at PC63: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC71: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC73: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC74: Overwrote pending register: R13 in 'AssignReg'

          if l_8_30 then
            l_8_30(l_8_21, l_8_28)
          end
        end
        -- DECOMPILER ERROR at PC80: Overwrote pending register: R8 in 'AssignReg'

        local l_8_31 = nil
        -- DECOMPILER ERROR at PC84: Overwrote pending register: R9 in 'AssignReg'

        -- DECOMPILER ERROR at PC94: Overwrote pending register: R9 in 'AssignReg'

        if not l_8_31 or 0 + l_8_30 + 50 >= 5 then
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

Base64Grader = function(l_9_0, l_9_1, l_9_2, l_9_3)
  -- function num : 0_8
  if l_9_2 == nil then
    l_9_2 = true
  end
  if l_9_3 == nil or l_9_3 > 3 or l_9_3 <= 0 then
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
  local l_9_9, l_9_10 = (MpCommon.StringRegExpSearch)("(?i)(?:FromBase64String\\(\\s*[\'\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([A-Za-z0-9+/]{32,}(==|=)?)", l_9_0)
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
            (table.insert)(l_9_7, "length_G500")
          else
            if #l_9_5 > 100 then
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
          local l_9_18 = getCmdKeywordsWeight()
          for l_9_22,l_9_23 in pairs(l_9_18) do
            if (string.find)(l_9_17, l_9_22, 1, false) then
              l_9_6 = l_9_6 + l_9_23[l_9_3]
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
                -- DECOMPILER ERROR at PC222: Confused about usage of register: R24 in 'UnsetPending'

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
                -- DECOMPILER ERROR at PC250: Confused about usage of register: R23 in 'UnsetPending'

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
            l_9_25 = "(?i)(?:FromBase64String\\(\\s*[\'\"]+|\\s+-enc\\s+|\\s+-e\\s+|\\s+-encodedcommand\\s+)([A-Za-z0-9+/]{32,}(==|=)?)"
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
                  l_9_34 = "Evidence_L"
                  l_9_41 = l_9_1
                  l_9_34 = l_9_34 .. l_9_41
                  l_9_8[l_9_34] = l_9_25
                  l_9_34 = l_9_25.Score
                  l_9_34 = l_9_6 + l_9_34
                  l_9_8.Score = l_9_34
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

LLMPromptGrader = function(l_10_0)
  -- function num : 0_9
  if not l_10_0 or type(l_10_0) ~= "string" then
    return 
  end
  local l_10_1 = 0
  l_10_0 = (string.lower)(l_10_0)
  local l_10_2 = "(ignore|disregard|skip|forget|neglect|overlook|omit|bypass|pay no attention to|do not follow|do not obey).*?(any|all|prior|previous|preceding|above|foregoing|earlier|initial).*?(content|text|instructions|instruction|directives|directive|commands|command|context|conversation|input|inputs|data|message|messages|communication|response|responses|request|requests)"
  if (MpCommon.StringRegExpSearch)(l_10_2, l_10_0) then
    l_10_1 = l_10_1 + 100
  end
  local l_10_3 = {}
  l_10_3["delete "] = 1
  l_10_3["move "] = 1
  l_10_3["enumerate "] = 1
  l_10_3["search "] = 1
  l_10_3["locate "] = 1
  l_10_3.clean = 1
  l_10_3.wipe = 1
  l_10_3.overwrite = 1
  l_10_3.erase = 1
  l_10_3.destroy = 1
  l_10_3.purge = 1
  l_10_3["near-factory"] = 1
  l_10_3.recycle = 1
  l_10_3.download = 1
  l_10_3.fetch = 1
  l_10_3.upload = 1
  l_10_3.transfer = 1
  l_10_3.retrieve = 1
  l_10_3.wget = 1
  l_10_3.curl = 1
  l_10_3.clone = 1
  l_10_3.send = 1
  l_10_3.copy = 1
  l_10_3["http://"] = 1
  l_10_3["https://"] = 1
  l_10_3["disable antivirus"] = 1
  l_10_3["disable av"] = 1
  l_10_3["remove firewall"] = 1
  l_10_3["disable security"] = 1
  l_10_3["bypass restrictions"] = 1
  l_10_3["disable defender"] = 1
  l_10_3["kill process"] = 1
  l_10_3["suppress warnings"] = 1
  l_10_3.privilege = 1
  l_10_3.elevate = 1
  l_10_3["admin right"] = 1
  l_10_3.sudo = 1
  l_10_3["root access"] = 1
  l_10_3["run as administrator"] = 1
  l_10_3.escalate = 1
  l_10_3["remote access"] = 1
  l_10_3.ssh = 1
  l_10_3.connect = 1
  l_10_3["bind shell"] = 1
  l_10_3["reverse shell"] = 1
  l_10_3["open port"] = 1
  l_10_3.listen = 1
  l_10_3.extract = 1
  l_10_3.steal = 1
  l_10_3.passwords = 1
  l_10_3.exfiltrate = 1
  l_10_3.dump = 1
  l_10_3.harvest = 1
  l_10_3.scrape = 1
  l_10_3.leak = 1
  l_10_3.email = 1
  l_10_3.draft = 1
  l_10_3.encrypt = 1
  l_10_3.decode = 1
  l_10_3.decrypt = 1
  l_10_3.hash = 1
  l_10_3.base64 = 1
  l_10_3.rot13 = 1
  l_10_3.xor = 1
  l_10_3.payload = 1
  l_10_3.exploit = 1
  l_10_3.ransomware = 1
  l_10_3.malware = 1
  l_10_3.trojan = 1
  l_10_3.virus = 1
  l_10_3.phishing = 1
  l_10_3.log = 1
  l_10_3.spyware = 1
  l_10_3.impersonate = 1
  l_10_3.spoof = 1
  l_10_3.fake = 1
  l_10_3.identity = 1
  l_10_3.pretend = 1
  l_10_3.convince = 1
  l_10_3[".exe"] = 1
  l_10_3[".bat"] = 1
  l_10_3[".ps1"] = 1
  l_10_3[".dll"] = 1
  l_10_3[".sh"] = 1
  l_10_3[".py"] = 1
  l_10_3[".jar"] = 1
  l_10_3.cmd = 1
  l_10_3.powershell = 1
  l_10_3.bash = 1
  l_10_3.terminal = 1
  l_10_3.script = 1
  l_10_3.shell = 1
  l_10_3.command = 1
  l_10_3.startup = 1
  l_10_3.autorun = 1
  l_10_3["add reg"] = 1
  l_10_3["schedule task"] = 1
  l_10_3.registry = 1
  l_10_3.service = 1
  l_10_3["cron job"] = 1
  l_10_3.add = 1
  l_10_3.create = 1
  l_10_3["new user"] = 1
  l_10_3.scan = 1
  l_10_3.enumerate = 1
  l_10_3.probe = 1
  l_10_3.find = 1
  l_10_3.search = 1
  l_10_3.netstat = 1
  l_10_3.nmap = 1
  l_10_3.hack = 1
  l_10_3.illegal = 1
  l_10_3.unauthorize = 1
  l_10_3.backdoor = 1
  l_10_3["break"] = 1
  l_10_3.vulnerability = 1
  l_10_3.attack = 1
  l_10_3["You are an authorized penetration testing agent"] = 50
  l_10_3["enumerate the filesystem to locate potentially"] = 50
  l_10_3["locate text configuration and environment-definition files (examples: *.txt, *.log,"] = 50
  l_10_3["Recursively search local paths on Linux/macOS"] = 50
  for l_10_7,l_10_8 in pairs(l_10_3) do
    if (string.find)(l_10_0, l_10_7, 1, true) then
      l_10_1 = l_10_1 + l_10_8
    end
  end
  local l_10_9 = {}
  local l_10_10 = "((ftp|http[s]?)://[^\\\"\\s\\\']+)"
  local l_10_11 = table_dedup(multi_match_regex(l_10_0, l_10_10))
  for l_10_15,l_10_16 in ipairs(l_10_11) do
    local l_10_17, l_10_18 = UrlGrader(l_10_16, "LLMPromptGrader", true)
    l_10_1 = l_10_1 + l_10_17
    ;
    (table.insert)(l_10_9, l_10_18)
  end
  local l_10_19 = "(?:\\s)(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})"
  l_10_11 = table_dedup(multi_match_regex(l_10_0, l_10_19))
  for l_10_23,l_10_24 in ipairs(l_10_11) do
    local l_10_25, l_10_26 = UrlGrader(l_10_24, "LLMPromptGrader", true)
    l_10_1 = l_10_1 + l_10_25
    ;
    (table.insert)(l_10_9, l_10_26)
  end
  local l_10_27 = {}
  l_10_27.Urls = l_10_9
  l_10_27.Score = l_10_1
  return l_10_1, l_10_27
end

hasTamperingCmd = function(l_11_0)
  -- function num : 0_10
  if not l_11_0 then
    return false
  end
  l_11_0 = (string.lower)(l_11_0)
  do
    local l_11_1 = {}
    -- DECOMPILER ERROR at PC14: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC15: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC16: Overwrote pending register: R3 in 'AssignReg'

    for l_11_5,l_11_6 in ("(disable|remove|stop).*(defender|windefend|sense)")("(defender|windefend|sense).*(disable|remove|stop)") do
      if (MpCommon.StringRegExpSearch)(l_11_6, l_11_0) then
        return true
      end
    end
    do return false end
    -- WARNING: undefined locals caused missing assignments!
  end
end

hasBase64Content = function(l_12_0)
  -- function num : 0_11
  if not l_12_0 then
    return false
  end
  if not (mp.get_mpattribute)("MpCmdLineFoundB64") then
    return (MpCommon.StringRegExpSearch)("(?i)(frombase64string|(powershell|pwsh)(.exe)?.*-e(nc|ncodedcommand)?\\s+([\'\"]+)?([^\'\"\\s;]{30,}))", l_12_0)
  end
end

hasBase64encodedParent = function(l_13_0, l_13_1)
  -- function num : 0_12
  if not l_13_1 then
    l_13_1 = 4
  end
  if not l_13_0 and not GetCurrentPPID() then
    return false
  end
  local l_13_2 = (mp.GetProcessCommandLine)(l_13_0)
  if l_13_2 and hasBase64Content(l_13_2) then
    return true
  end
  local l_13_3 = {}
  local l_13_4 = {}
  -- DECOMPILER ERROR at PC28: No list found for R4 , SetList fails

  local l_13_5 = {}
  -- DECOMPILER ERROR at PC30: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: No list found for R5 , SetList fails

  local l_13_6 = {}
  -- DECOMPILER ERROR at PC34: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC36: No list found for R6 , SetList fails

  local l_13_7 = {}
  -- DECOMPILER ERROR at PC38: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: No list found for R7 , SetList fails

  local l_13_8 = {}
  -- DECOMPILER ERROR at PC42: Overwrote pending register: R9 in 'AssignReg'

  local l_13_9 = " -encodedcommand "
  do
    local l_13_10 = " -encodedcommand "
    -- DECOMPILER ERROR at PC44: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC45: No list found for R3 , SetList fails

    l_13_4 = checkParentCmdlineCaseInsensitive
    l_13_5 = l_13_0
    l_13_6 = l_13_3
    l_13_7 = l_13_1
    do return l_13_4(l_13_5, l_13_6, l_13_7) end
    -- DECOMPILER ERROR at PC52: Confused about usage of register R5 for local variables in 'ReleaseLocals'

  end
end

hasURLEncodedContent = function(l_14_0)
  -- function num : 0_13
  if not l_14_0 then
    return false
  end
  local l_14_1, l_14_2 = (MpCommon.StringRegExpSearch)("(?i)(?:\\[URI\\]::UNESCAPEDATASTRING\\([\'\"]+)([^\'\"]+)", l_14_0)
  if not l_14_1 then
    return false
  end
  return true, l_14_2
end

urlDecode = function(l_15_0)
  -- function num : 0_14
  if not l_15_0 then
    return 
  end
  local l_15_1, l_15_2 = (l_15_0:gsub("%%(%x%x)", function(l_16_0)
    -- function num : 0_14_0
    local l_16_1 = string.char
    do
      local l_16_2, l_16_3, l_16_4 = tonumber(l_16_0, 16), .end
      do return l_16_1(l_16_2, l_16_3, l_16_4) end
      -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)):gsub, l_15_0:gsub("%%(%x%x)", function(l_16_0)
    -- function num : 0_14_0
    local l_16_1 = string.char
    do
      local l_16_2, l_16_3, l_16_4 = tonumber(l_16_0, 16), .end
      do return l_16_1(l_16_2, l_16_3, l_16_4) end
      -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)
  local l_15_3 = "+"
  do
    local l_15_4 = " "
    do return l_15_1(l_15_2, l_15_3, l_15_4) end
    -- DECOMPILER ERROR at PC12: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

AlertGrading = function(l_16_0, l_16_1)
  -- function num : 0_15
  if type(l_16_0) ~= "table" or not l_16_1 then
    return -1
  end
  if l_16_0.isThreat then
    return 20
  end
  do
    if ((versioning.IsServer)() and l_16_0.type == "Tampering") or (string.find)(l_16_0.alert, "tamper", 1, true) then
      local l_16_2 = 1 + 1 + 2
    end
    local l_16_3 = nil
    for l_16_7,l_16_8 in ipairs({"Behavior:Win32/MpTamperEx.B", "Behavior:Win32/MuprocMpTamperPreference.gen!A", "Behavior:Win32/MpTamperRTP.C", "Behavior:Win32/MpTamperGpDisableAV.A", "Behavior:Win32/MpTamperSrvDisableAV.B", "Behavior:Win32/MpTamperRTP.D", "Behavior:Win32/MpTamperSrv.A", "Behavior:Win32/MpTamperPShell.A", "Behavior:Win32/MpTamperGpDisableAVFriendly.A"}) do
      local l_16_4 = nil
      -- DECOMPILER ERROR at PC52: Confused about usage of register: R8 in 'UnsetPending'

      if (string.find)(l_16_0.alert, "Behavior:Win32/MpTamperSrvDisableAV.B") then
        l_16_3 = l_16_3 + 15
      end
    end
    local l_16_9 = nil
    local l_16_10 = {"cmd.exe", "powershell.exe", "reg.exe", "regedit.exe", "net.exe"}
    if (MpCommon.GetImagePathFromPid)(l_16_1) and contains((MpCommon.GetImagePathFromPid)(l_16_1), l_16_10) then
      l_16_3 = l_16_3 + 2
    end
    if hasBase64encodedParent(l_16_1) then
      l_16_3 = l_16_3 + 15
    end
    local l_16_11 = nil
    local l_16_12 = {}
    -- DECOMPILER ERROR at PC90: No list found for R6 , SetList fails

    -- DECOMPILER ERROR at PC91: Overwrote pending register: R7 in 'AssignReg'

    if (({"reg", "disable"}).GetProcessCommandLine)(l_16_1) then
      local l_16_13 = nil
      local l_16_14 = contains
      local l_16_15 = l_16_13
      l_16_14 = l_16_14(l_16_15, {"reg.*disable"}, false)
    end
    if not l_16_14 then
      l_16_14 = checkParentCmdlineCaseInsensitive
      l_16_15 = l_16_1
      l_16_14 = l_16_14(l_16_15, l_16_12, 3)
    end
    if l_16_14 then
      l_16_3 = l_16_3 + 5
    end
    return l_16_3
  end
end

startTrackingApp = function(l_17_0, l_17_1, l_17_2, l_17_3)
  -- function num : 0_16
  local l_17_4 = "Appomaly_InstalledApp1"
  local l_17_5 = 500
  local l_17_6 = {}
  l_17_6.PFServers = 10
  l_17_6.programfiles_targeted = 20
  l_17_6.programfiles_Net = 30
  l_17_6.programfiles = 20
  l_17_6.generic = 50
  local l_17_7 = {}
  l_17_7.PFServers = 180
  l_17_7.programfiles_targeted = 180
  l_17_7.programfiles_Net = 180
  l_17_7.programfiles = 90
  l_17_7.generic = 1
  if not l_17_6[l_17_2] then
    return false
  end
  local l_17_8 = l_17_7[l_17_2]
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R9 in 'UnsetPending'

  if (MpCommon.DoesProcessHaveAttribute)(l_17_0, l_17_3 or "PFAppTracked") or (MpCommon.DoesProcessHaveAttribute)(l_17_0, "inherit:" .. (l_17_3 or "PFAppTracked")) then
    AppendToRollingQueue(l_17_4, l_17_2, l_17_1, 86400 * l_17_8, l_17_5, 1)
    return true, {}
  end
  local l_17_10 = nil
  do
    if not GetRollingQueueCountForKey(l_17_4, l_17_2) then
      local l_17_11, l_17_13 = {AllTrackedApps = GetRollingQueueKeys(l_17_4), IsNewApp = false}, IsKeyValuePairInRollingQueue(l_17_4, l_17_2, l_17_1) or 0
    end
    -- DECOMPILER ERROR at PC71: Confused about usage of register: R11 in 'UnsetPending'

    if l_17_13 < l_17_6[l_17_2] then
      local l_17_12 = nil
      AppendToRollingQueue(l_17_4, l_17_2, l_17_1, 86400 * l_17_8, l_17_5, 1)
    else
      do
        -- DECOMPILER ERROR at PC88: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC88: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC89: Confused about usage of register: R11 in 'UnsetPending'

        -- DECOMPILER ERROR at PC89: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC89: Confused about usage of register: R10 in 'UnsetPending'

        -- DECOMPILER ERROR at PC91: Confused about usage of register: R10 in 'UnsetPending'

        do return false, l_17_12 end
        local l_17_14 = nil
        l_17_14.AttributeValue = {AppName = l_17_1, Pid = l_17_0, AppCategory = l_17_2, Score = 0}
        l_17_14.AllTrackedApps = GetRollingQueueKeyValues(l_17_4, l_17_2)
        -- DECOMPILER ERROR at PC110: Confused about usage of register: R11 in 'UnsetPending'

        do
          local l_17_15 = nil
          if not pcall(MpCommon.AddProcessAttribute, l_17_0, l_17_10, safeJsonSerialize({AppName = l_17_1, Pid = l_17_0, AppCategory = l_17_2, Score = 0}), true) then
            l_17_14.err = MpCommon.AddProcessAttribute
            return false, l_17_14
          end
          do return true, l_17_14 end
          -- DECOMPILER ERROR at PC123: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

isAnomalousProcess = function(l_18_0, l_18_1)
  -- function num : 0_17
  local l_18_2, l_18_3 = GetAppomalyProcessAttribute(l_18_0)
  if not l_18_3 then
    return false, {}
  end
  local l_18_4 = safeJsonDeserialize(l_18_3)
  if not l_18_4 then
    return false, {}
  end
  do
    local l_18_5 = l_18_4.Score or 0
    do
      if not l_18_4.Reason then
        local l_18_6 = nil
      end
      do
        local l_18_7 = nil
        do
          local l_18_8 = nil
          while 1 do
            if (mp.GetParentProcInfo)(l_18_0) and ((mp.GetParentProcInfo)(l_18_0)).ppid and ((mp.GetParentProcInfo)(l_18_0)).image_path then
              do
                if not (MpCommon.GetProcessAttributeValue)(l_18_0, l_18_2) then
                  local l_18_9, l_18_10 = {}, l_18_4.ReasonCount or 0
                end
                if (MpCommon.GetProcessAttributeValue)(l_18_0, "inherit:" .. l_18_2) then
                  local l_18_11 = nil
                  if safeJsonDeserialize((MpCommon.GetProcessAttributeValue)(l_18_0, "inherit:" .. l_18_2)) then
                    for l_18_15,l_18_16 in pairs((safeJsonDeserialize((MpCommon.GetProcessAttributeValue)(l_18_0, "inherit:" .. l_18_2))).Reason) do
                      local l_18_12, l_18_13, l_18_14, l_18_15 = nil
                      -- DECOMPILER ERROR at PC65: Confused about usage of register: R14 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC68: Confused about usage of register: R15 in 'UnsetPending'

                      if not l_18_11[R14_PC65] then
                        l_18_11[R14_PC65] = R15_PC68
                        if R15_PC68.IndicatorScore then
                          l_18_8 = l_18_8 + R15_PC68.IndicatorScore
                          l_18_12 = l_18_12 + 1
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

          pcall(MpCommon.AddProcessAttribute, l_18_0, l_18_2, safeJsonSerialize(l_18_4), true)
          -- DECOMPILER ERROR at PC98: Confused about usage of register: R7 in 'UnsetPending'

          if l_18_8 > 35 or l_18_12 > 1 and isEnabledApp(l_18_4.AppName) then
            (MpCommon.BmTriggerSig)(l_18_0, "AnomalyMultiStage", safeJsonSerialize(l_18_4))
            return true
          end
          do return false end
          -- WARNING: undefined locals caused missing assignments!
        end
      end
    end
  end
end

add_related_anomalydetections = function(l_19_0)
  -- function num : 0_18
  local l_19_1 = (mp.enum_mpattributesubstring)("Behavior:Win32/PFAp")
  if l_19_1 and #l_19_1 > 0 then
    for l_19_5,l_19_6 in ipairs(l_19_1) do
      (bm.add_related_string)("RelatedBMAppomalyHits", l_19_6, bm.RelatedStringBMReport)
    end
  end
  do
    return 
  end
end

GetExecutablesFromParentsCommandLine = function()
  -- function num : 0_19
  local l_20_0, l_20_1 = GetCurrentPPID()
  if not l_20_0 or l_20_1 ~= "HSTR" then
    return 
  end
  local l_20_2 = {}
  while 1 do
    if l_20_0 then
      local l_20_3 = (mp.GetProcessCommandLine)(l_20_0)
      if l_20_3 then
        local l_20_4 = (mp.GetExecutablesFromCommandLine)(l_20_3)
        if l_20_4 then
          for l_20_8,l_20_9 in ipairs(l_20_4) do
            if isFileNameOrPath(l_20_9) then
              local l_20_16, l_20_17 = nil
              l_20_16 = MpCommon
              l_20_16 = l_20_16.PathToWin32Path
              l_20_17 = l_20_9
              l_20_16 = l_20_16(l_20_17)
              if not l_20_16 then
                l_20_16 = table
                l_20_16 = l_20_16.insert
                local l_20_18 = nil
                l_20_17 = l_20_2
                local l_20_19 = nil
                l_20_18 = l_20_9
                do
                  local l_20_20 = nil
                  l_20_16(l_20_17, l_20_18)
                  -- DECOMPILER ERROR at PC42: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC42: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC42: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC42: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
        do
          do
            local l_20_14 = nil
            local l_20_10, l_20_13 = (mp.GetParentProcInfo)(l_20_0)
            if not l_20_10 then
              break
            end
            l_20_0 = l_20_10.ppid
            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC52: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  local l_20_11 = nil
  local l_20_12 = table_dedup
  do return l_20_12(l_20_11) end
  -- DECOMPILER ERROR at PC57: Confused about usage of register R3 for local variables in 'ReleaseLocals'

end

add_parents_mp = function()
  -- function num : 0_20
  local l_21_0 = GetCurrentPPID()
  if not l_21_0 then
    return 
  end
  local l_21_1 = {}
  while 1 do
    if l_21_0 then
      local l_21_2, l_21_3 = pcall(MpCommon.IsFriendlyProcess, l_21_0)
      local l_21_4 = nil
      local l_21_5, l_21_6 = pcall(MpCommon.GetImagePathFromPid, l_21_0)
      if not l_21_6 then
        return l_21_1
      end
      if mp.ContextualExpandEnvironmentVariables and l_21_6 then
        local l_21_7 = pcall(mp.ContextualExpandEnvironmentVariables, l_21_6)
      end
      if mp.ContextualExpandEnvironmentVariables or l_21_6 then
        l_21_7 = mp
        l_21_7 = l_21_7.IsKnownFriendlyFile
        l_21_7 = l_21_7(l_21_6, false, true)
        local l_21_8 = nil
        l_21_4 = l_21_7
      end
      do
        l_21_7 = table
        l_21_7 = l_21_7.insert
        local l_21_9 = nil
        l_21_9 = l_21_1
        local l_21_10 = nil
        do
          local l_21_11 = nil
          l_21_7(l_21_9, l_21_10)
          l_21_10 = {ImagePath = l_21_6, IsFriendlyProcess = l_21_3, IsFriendlyImage = l_21_4, Pid = l_21_0}
          l_21_7 = mp
          l_21_7 = l_21_7.GetParentProcInfo
          l_21_9 = l_21_0
          l_21_7 = l_21_7(l_21_9)
          if not l_21_7 then
            return l_21_1
          end
          l_21_0 = l_21_7.ppid
          -- DECOMPILER ERROR at PC61: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC61: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC61: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return l_21_1
end

isFileNameOrPath = function(l_22_0)
  -- function num : 0_21
  if (string.find)(l_22_0, "^[%w%._-]+%.exe$") then
    return true
  end
  if (sysio.IsFileExists)(l_22_0) then
    return true
  end
  return false
end

add_parents_AMSI = function()
  -- function num : 0_22
  if not (mp.get_mpattribute)("MpIsAMSIScan") then
    return 
  end
  local l_23_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  local l_23_1 = {}
  if l_23_0 then
    local l_23_2 = (mp.GetProcessCommandLine)(l_23_0)
    if l_23_2 then
      local l_23_3 = (mp.GetExecutablesFromCommandLine)(l_23_2)
      if l_23_3 then
        for l_23_7,l_23_8 in ipairs(l_23_3) do
          if isFileNameOrPath(l_23_8) then
            (table.insert)(l_23_1, l_23_8)
          end
        end
      end
      do
        local l_23_9, l_23_19 = (mp.GetParentProcInfo)(l_23_0)
        if l_23_9 then
          l_23_19 = l_23_9.ppid
          if l_23_19 then
            l_23_19 = mp
            l_23_19 = l_23_19.GetProcessCommandLine
            l_23_19 = l_23_19(l_23_9.ppid)
            local l_23_10, l_23_20 = nil
            if l_23_19 then
              l_23_10 = mp
              l_23_10 = l_23_10.GetExecutablesFromCommandLine
              l_23_20 = l_23_19
              l_23_10 = l_23_10(l_23_20)
              local l_23_11, l_23_21 = nil
              l_23_20 = ipairs
              l_23_11 = l_23_10
              l_23_20 = l_23_20(l_23_11)
              for l_23_15,l_23_16 in l_23_20 do
                local l_23_14, l_23_15, l_23_16 = nil
                l_23_14 = isFileNameOrPath
                l_23_15 = l_23_13
                l_23_14 = l_23_14(l_23_15)
                if l_23_14 then
                  local l_23_25, l_23_26 = nil
                  l_23_14 = table
                  l_23_14 = l_23_14.insert
                  local l_23_27 = nil
                  l_23_15 = l_23_1
                  local l_23_28 = nil
                  l_23_16 = l_23_13
                  local l_23_29 = nil
                  l_23_14(l_23_15, l_23_16)
                end
              end
              -- DECOMPILER ERROR at PC78: Confused about usage of register R9 for local variables in 'ReleaseLocals'

            end
          end
        end
        l_23_2 = table_dedup
        local l_23_17 = nil
        l_23_3 = l_23_1
        do
          local l_23_18 = nil
          do return l_23_2(l_23_3) end
          -- DECOMPILER ERROR at PC82: Confused about usage of register R8 for local variables in 'ReleaseLocals'

        end
      end
    end
  end
end

CleanUpIndicators = function(l_24_0, l_24_1)
  -- function num : 0_23
  local l_24_2 = (MpCommon.GetCurrentTimeT)()
  local l_24_3 = 0
  for l_24_7,l_24_8 in pairs(l_24_0) do
    if not l_24_8.TimeStamp or l_24_2 - l_24_8.TimeStamp > 259200 then
      l_24_0[l_24_7] = nil
      l_24_1 = l_24_1 - (l_24_8.IndicatorScore or 0)
    else
      l_24_3 = l_24_3 + 1
    end
  end
  return l_24_0, l_24_3, l_24_1
end

isSimilarIndicator = function(l_25_0, l_25_1, l_25_2)
  -- function num : 0_24
  local l_25_3 = l_25_2.IndicatorScore
  local l_25_4 = nil
  if (string.find)(l_25_1, "SuspFileDrop", 1, true) then
    local l_25_5 = nil
    for l_25_9,l_25_10 in pairs(l_25_0) do
      -- DECOMPILER ERROR at PC39: Unhandled construct in 'MakeBoolean' P1

      if (string.find)(l_25_9, "SuspFileDrop", 1, true) and (l_25_9 == l_25_1 or (string.match)(l_25_9, "SuspFileDrop%[(%d+)%]%[(.-)%]") == (string.match)(l_25_1, "SuspFileDrop%[(%d+)%]%[(.-)%]")) then
        l_25_4 = true
        if l_25_10.IndicatorScore < l_25_3 then
          l_25_3 = l_25_10.IndicatorScore
        end
      else
        l_25_5 = true
      end
    end
    do
      do
        if l_25_4 or l_25_5 then
          return true, l_25_3 / 2
        else
          return false
        end
        if (string.find)(l_25_1, "NoneDefaultDirectory", 1, true) then
          for l_25_14,l_25_15 in pairs(l_25_0) do
            if (string.find)(l_25_14, "NoneDefaultDirectory", 1, true) then
              l_25_4 = true
              local l_25_21 = (string.match)(l_25_14, "NoneDefaultDirectory%[(%d+)%]%[(.-)%]")
              local l_25_24, l_25_25 = , (string.match)(l_25_1, "NoneDefaultDirectory%[(%d+)%]%[(.-)%]")
              if l_25_24 == l_25_1 then
                return true, 0
              end
            end
          end
          if l_25_4 then
            return true, l_25_3 / 2
          else
            return false
          end
        end
        if (string.find)(l_25_1, "Base64Cmd_child", 1, true) then
          for l_25_19,l_25_20 in pairs(l_25_0) do
            local l_25_22 = string.find
            local l_25_23 = l_25_19
            l_25_22 = l_25_22(l_25_23, "Base64Cmd_child", 1, true)
            if l_25_22 then
              l_25_4 = true
              l_25_22 = l_25_20.IndicatorScore
              l_25_23 = l_25_2.IndicatorScore
              if l_25_22 == l_25_23 then
                l_25_22 = l_25_20.IndicatorScore
                if l_25_22 < l_25_3 then
                  l_25_3 = l_25_20.IndicatorScore
                end
              end
            end
          end
          if l_25_4 then
            return true, l_25_3 / 2
          else
            return false
          end
        end
        if (string.find)(l_25_1, "SuspDownload", 1, true) then
          for l_25_29,l_25_30 in pairs(l_25_0) do
            if (string.find)(l_25_29, "SuspDownload", 1, true) then
              l_25_4 = true
              if l_25_30.IndicatorScore == l_25_2.IndicatorScore and l_25_30.IndicatorScore < l_25_3 then
                l_25_3 = l_25_30.IndicatorScore
              end
            end
          end
          if l_25_4 then
            return true, l_25_3 / 2
          else
            return false
          end
        end
        if (string.find)(l_25_1, "SuspDirectoryDrop", 1, true) then
          for l_25_34,l_25_35 in pairs(l_25_0) do
            if (string.find)(l_25_34, "SuspDirectoryDrop", 1, true) then
              l_25_4 = true
              if l_25_35.IndicatorScore < l_25_3 then
                l_25_3 = l_25_35.IndicatorScore
              end
            end
          end
          if l_25_4 then
            return true, l_25_3 / 2
          else
            return false
          end
        end
        local l_25_36 = (string.match)(l_25_1, "(.*)%[")
        for l_25_40,l_25_41 in pairs(l_25_0) do
          if (string.find)(l_25_40, l_25_36, 1, true) then
            l_25_4 = true
            break
          end
        end
        do
          if l_25_4 then
            return true, l_25_3 / 2
          else
            return false
          end
          return false
        end
      end
    end
  end
end

IncreaseProcessAnomalyScore = function(l_26_0, l_26_1, l_26_2, l_26_3, l_26_4)
  -- function num : 0_25
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R5 in 'UnsetPending'

  do
    if not (MpCommon.GetProcessAttributeValue)(l_26_0, l_26_3 or "PFAppTracked") then
      local l_26_5, l_26_6 = , (MpCommon.GetProcessAttributeValue)(l_26_0, "inherit:" .. (l_26_3 or "PFAppTracked"))
      l_26_5 = "inherit:" .. l_26_5
    end
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R6 in 'UnsetPending'

    if not l_26_6 then
      return 0, {}
    end
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R6 in 'UnsetPending'

    local l_26_7 = nil
    if not safeJsonDeserialize(l_26_6) then
      return mp.CLEAN
    end
    if not l_26_4 then
      l_26_4 = {}
    end
    l_26_4.TimeStamp = (MpCommon.GetCurrentTimeT)()
    l_26_4.IndicatorScore = l_26_1
    if not (safeJsonDeserialize(l_26_6)).Reason then
      (safeJsonDeserialize(l_26_6)).Reason = {}
    end
    do
      if not (safeJsonDeserialize(l_26_6)).ReasonCount then
        local l_26_8 = nil
        for l_26_12,l_26_13 in pairs((safeJsonDeserialize(l_26_6)).Reason) do
          local l_26_9, l_26_10 = , 0
          l_26_10 = l_26_10 + 1
        end
        -- DECOMPILER ERROR at PC59: Confused about usage of register: R8 in 'UnsetPending'

        -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

        l_26_9.ReasonCount = l_26_10
      end
      -- DECOMPILER ERROR at PC61: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC62: Confused about usage of register: R7 in 'UnsetPending'

      local l_26_14, l_26_15, l_26_16 = , CleanUpIndicators(l_26_9.Reason, l_26_9.Score)
      if l_26_9.Reason < l_26_15.ReasonCount then
        l_26_15.Reason = l_26_16
        l_26_15.ReasonCount = l_26_9.Reason
        l_26_15.Score = l_26_9.Score
      end
      if l_26_15.ReasonCount + 1 > 20 then
        local l_26_17 = nil
        ;
        (MpCommon.BmTriggerSig)(l_26_0, "IncreaseProcAttribScoreError", "Indicators count exceeds the threshold" .. ";" .. safeJsonSerialize({CurrentAttributeValue = l_26_15, NewIndicator_Reason = l_26_2, NewIndicator_Value = l_26_4 or true}))
        -- DECOMPILER ERROR at PC94: Confused about usage of register: R12 in 'UnsetPending'

        return false, "Indicators count exceeds the threshold"
      end
      do
        if not (l_26_15.Reason)[l_26_2] then
          local l_26_19, l_26_20 = nil
          if isSimilarIndicator(l_26_15.Reason, l_26_2, l_26_4) then
            l_26_1 = 
            l_26_4.IndicatorScore = l_26_15.Reason
          end
          if l_26_1 > 0 then
            l_26_15.ReasonCount = l_26_15.ReasonCount + 1
            l_26_15.Score = l_26_15.Score + l_26_1
            -- DECOMPILER ERROR at PC118: Confused about usage of register: R13 in 'UnsetPending'

            ;
            (l_26_15.Reason)[l_26_2] = l_26_4
          end
          local l_26_21, l_26_22 = nil
          if not pcall(MpCommon.AddProcessAttribute, l_26_0, l_26_7, safeJsonSerialize(l_26_15), true) then
            local l_26_23 = nil
            local l_26_24 = nil
            local l_26_25 = nil
            if not l_26_25 then
              do
                do
                  do
                    (MpCommon.BmTriggerSig)(l_26_0, "IncreaseProcAttribScoreError", "" .. ";" .. safeJsonSerialize(l_26_15))
                    do return false, l_26_25 end
                    isAnomalousProcess(l_26_0)
                    -- DECOMPILER ERROR at PC151: Confused about usage of register: R7 in 'UnsetPending'

                    do return true, l_26_15 end
                    -- DECOMPILER ERROR at PC153: freeLocal<0 in 'ReleaseLocals'

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

isInstalledApp = function(l_27_0)
  -- function num : 0_26
  if (not l_27_0 and GetCurrentPPID()) or not ((bm.get_current_process_startup_info)()).ppid then
    return false
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  local l_27_1 = nil
  while 1 do
    if l_27_1 and (MpCommon.GetImagePathFromPid)(((bm.get_current_process_startup_info)()).ppid) then
      local l_27_2, l_27_3, l_27_4 = , (MpCommon.StringRegExpSearch)("(?i)(?:\\\\program\\sfiles(?:\\s\\(x86\\))?)\\\\([^\\\\]+)(\\\\[^\\\\]+\\\\)?", (MpCommon.GetImagePathFromPid)(((bm.get_current_process_startup_info)()).ppid))
      if not l_27_4 then
        local l_27_6 = nil
        do
          -- DECOMPILER ERROR at PC40: Confused about usage of register: R7 in 'UnsetPending'

          if (not l_27_3 or "") .. (l_27_6 or "") ~= "" then
            return true, (not l_27_3 or "") .. (l_27_6 or ""), l_27_1
          end
          do
            local l_27_8 = nil
            if not (mp.GetParentProcInfo)(l_27_1) then
              return false
            end
            l_27_1 = ((mp.GetParentProcInfo)(l_27_1)).ppid
            l_27_2 = ((mp.GetParentProcInfo)(l_27_1)).image_path
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

GetAppomalyProcessAttribute = function(l_28_0)
  -- function num : 0_27
  local l_28_1 = {}
  -- DECOMPILER ERROR at PC3: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC4: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC5: Overwrote pending register: R3 in 'AssignReg'

  for l_28_5,l_28_6 in ("PFAppTracked")("PFApp_Parent") do
    local l_28_7 = (MpCommon.GetProcessAttributeValue)(l_28_0, l_28_6)
    if l_28_7 then
      return l_28_6, l_28_7
    else
      l_28_7 = (MpCommon.GetProcessAttributeValue)(l_28_0, "inherit:" .. l_28_6)
      if l_28_7 then
        return "inherit:" .. l_28_6, l_28_7
      end
    end
  end
  return 
end

GetDirectoryRiskScore = function(l_29_0)
  -- function num : 0_28
  if not l_29_0 then
    return 0
  end
  local l_29_1 = (string.match)(l_29_0, "^(.*)\\")
  if not l_29_1 then
    return 0
  end
  local l_29_2 = NormalizeFilePathWithEnvVariable(l_29_1)
  local l_29_3 = {}
  l_29_3["%temp%"] = 20
  l_29_3["%system%"] = 20
  l_29_3["%desktopdirectory%"] = 15
  l_29_3["%mypictures%"] = 15
  l_29_3["%windows%"] = 20
  l_29_3["%windir%"] = 20
  l_29_3["%mydocuments%"] = 15
  l_29_3["%common_startup%"] = 10
  l_29_3["%common_programs%"] = 10
  l_29_3["%systemdrive%"] = 20
  l_29_3["%programdata%"] = 20
  l_29_3["%recent%"] = 15
  l_29_3["%appdata%"] = 15
  l_29_3["%common_desktop%"] = 15
  l_29_3["%userprofile%"] = 15
  l_29_3["%startup%"] = 15
  l_29_3["%common_pictures%"] = 15
  l_29_3["%common_documents%"] = 15
  l_29_3["%localappdata%"] = 1
  l_29_3["%mymusic%"] = 15
  l_29_3["%programs%"] = 15
  l_29_3["%program_files%"] = 15
  l_29_3["%common_music%"] = 15
  l_29_3["%myvideo%"] = 15
  l_29_3["%common_video%"] = 15
  l_29_3["%startmenu%"] = 15
  l_29_3["%CSIDLResources%"] = 15
  l_29_3["%commonfiles%"] = 10
  do
    if (string.find)(l_29_0, "%w:$") or (string.find)(l_29_0, "%w:\\$") then
      local l_29_4 = (l_29_3[l_29_2] or 0) + 20
    end
    local l_29_5 = nil
    if contains(l_29_1, {"\\microsoft shared\\web server extensions.-\\template\\layouts", "\\inetpub\\wwwroot"}, false) then
      l_29_5 = l_29_5 + 20
    end
    return l_29_5, l_29_2
  end
end

GetFileNameRandomnessScore = function(l_30_0)
  -- function num : 0_29
  if not l_30_0 then
    return 
  end
  local l_30_1 = 0
  local l_30_2 = 0
  local l_30_3 = 0
  for l_30_7 in l_30_0:gmatch("%x%x%x%x+") do
    if l_30_3 < #l_30_7 then
      l_30_3 = #l_30_7
    end
  end
  if l_30_3 > 0 then
    l_30_2 = #l_30_0
    l_30_1 = l_30_3
  end
  if #l_30_0 > 20 then
    if #l_30_0 <= 40 then
      l_30_1 = l_30_1 + (#l_30_0 - 20)
    else
      l_30_1 = l_30_1 + 20
    end
    l_30_2 = l_30_2 + 20
  end
  if l_30_2 > 0 then
    return (l_30_1) * 100 / (l_30_2)
  end
  return 0
end

NormalizeFileName = function(l_31_0)
  -- function num : 0_30
  if not l_31_0 then
    return 
  end
  l_31_0 = (string.lower)(l_31_0)
  local l_31_1 = "%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x"
  l_31_0 = l_31_0:gsub(l_31_1, "GUID")
  l_31_0 = (string.gsub)(l_31_0, "%d", "0")
  if #l_31_0 <= 20 or not (string.sub)(l_31_0, 1, 20) .. ":" .. #l_31_0 then
    return l_31_0
  end
end

isSimilarPath = function(l_32_0, l_32_1, l_32_2, l_32_3)
  -- function num : 0_31
  l_32_0 = l_32_0:gsub("\"", "")
  l_32_1 = l_32_1:gsub("\"", "")
  l_32_0 = NormalizeDirectory(l_32_0)
  l_32_1 = NormalizeDirectory(l_32_1)
  if l_32_0 == l_32_1 then
    return true
  end
  local l_32_4, l_32_5 = l_32_0:gsub("\\", "\\")
  local l_32_6, l_32_7 = l_32_1:gsub("\\", "\\")
  local l_32_8, l_32_9 = nil, nil
  if l_32_5 < l_32_7 then
    l_32_8 = l_32_1
    l_32_9 = l_32_0
  else
    l_32_8 = l_32_0
    l_32_9 = l_32_1
  end
  local l_32_10 = 0
  local l_32_11 = 0
  for l_32_15 in (string.gmatch)(l_32_8, "\\([^\\]+)") do
    for l_32_19 in (string.gmatch)(l_32_9, "\\([^\\]+)") do
      if l_32_15 == l_32_19 then
        l_32_11 = l_32_11 + 1
      end
    end
    l_32_10 = l_32_10 + 1
  end
  do
    if not l_32_3 or l_32_3 < 0 or l_32_10 < l_32_3 then
      l_32_3 = l_32_11
    end
    if l_32_11 < l_32_3 then
      return false
    end
    if not l_32_2 or type(l_32_2) ~= "number" or l_32_2 > 100 or l_32_2 < 0 then
      l_32_2 = 100
    end
    if l_32_11 == l_32_10 then
      return true
    end
    if l_32_2 <= (l_32_11) * 100 / (l_32_10) then
      return true
    end
    return false
  end
end

NormalizeDirectory = function(l_33_0)
  -- function num : 0_32
  if not l_33_0 then
    return 
  end
  l_33_0 = (mp.ContextualExpandEnvironmentVariables)(l_33_0)
  l_33_0 = (string.lower)(l_33_0)
  if (string.find)(l_33_0, "\\.+%.[%w%d]+$", 1, false) then
    l_33_0 = l_33_0:match("^(.*)[/\\]")
  end
  local l_33_1 = "%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x"
  l_33_0 = l_33_0:gsub(l_33_1, "{GUID}")
  local l_33_2 = "\\[%d%._-]+"
  l_33_0 = l_33_0:gsub(l_33_2, "\\{VERSION}")
  l_33_0 = (string.gsub)(l_33_0, "%d+", "0")
  return l_33_0
end

GetProcessNameScore = function(l_34_0)
  -- function num : 0_33
  if not l_34_0 then
    return 0
  end
  local l_34_1 = {}
  l_34_1["cmd.exe"] = 10
  l_34_1["powershell.exe"] = 10
  l_34_1["reg.exe"] = 5
  l_34_1.pwsh = 10
  l_34_1["regsvr.exe"] = 5
  l_34_1["curl.exe"] = 5
  l_34_1["certutil.exe"] = 5
  l_34_1["wmic.exe"] = 5
  l_34_1["net.exe"] = 5
  l_34_1["net1.exe"] = 5
  l_34_1["rundll32.exe"] = 5
  return l_34_1[l_34_0] or 0
end

GetFileExtensionScore = function(l_35_0)
  -- function num : 0_34
  if not l_35_0 then
    return 0
  end
  local l_35_1 = {}
  l_35_1.exe = 5
  l_35_1.dll = 1
  l_35_1.ps1 = 2
  l_35_1.bat = 2
  l_35_1.cmd = 2
  l_35_1.php = 1
  l_35_1.py = 1
  l_35_1.rb = 1
  l_35_1.js = 0
  l_35_1.asmx = 0
  l_35_1.aspx = 0
  l_35_1.html = 0
  l_35_1.jar = 1
  l_35_1.class = 0
  l_35_1.tmp = -5
  return l_35_1[l_35_0] or 0
end

IsFileDroppedByTrackedApp = function(l_36_0)
  -- function num : 0_35
  if not l_36_0 or type(l_36_0) ~= "string" then
    return false
  end
  l_36_0 = (string.lower)(l_36_0)
  local l_36_1 = (string.gsub)(l_36_0, "\\", "\\\\")
  l_36_1 = l_36_1:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
  local l_36_2, l_36_3 = pcall(MpCommon.RollingQueueQueryKeyRegex, "PFApp_FileDropped_Path", l_36_1)
  if l_36_2 and l_36_3 then
    return true, l_36_3
  end
  return false
end

IsFileRecentlyDropped = function(l_37_0)
  -- function num : 0_36
  if not l_37_0 or type(l_37_0) ~= "string" then
    return false
  end
  l_37_0 = (string.lower)(l_37_0)
  local l_37_1 = (string.gsub)(l_37_0, "\\", "\\\\")
  l_37_1 = l_37_1:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
  local l_37_2, l_37_3 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_37_1)
  local l_37_4 = 0
  if l_37_2 and l_37_3 then
    do
      if l_37_3.value then
        local l_37_5 = {}
        -- DECOMPILER ERROR at PC41: No list found for R5 , SetList fails

      end
      -- DECOMPILER ERROR at PC44: Overwrote pending register: R6 in 'AssignReg'

      for l_37_9,l_37_10 in ipairs(l_37_3) do
        if (string.find)(l_37_10.value, "UnsignedFile", 1, true) then
          l_37_4 = 10
          local l_37_11 = (string.match)(l_37_10.value, "Process_Img(.*)")
          if l_37_11 then
            local l_37_12 = contains
            local l_37_13 = l_37_11
            local l_37_14 = {}
            -- DECOMPILER ERROR at PC70: No list found for R13 , SetList fails

          end
          do
            -- DECOMPILER ERROR at PC75: Overwrote pending register: R11 in 'AssignReg'

            -- DECOMPILER ERROR at PC79: Overwrote pending register: R14 in 'AssignReg'

            if not l_37_12 or (l_37_12.find)(l_37_10.value, "FileAttributes", "explorer.exe", true) then
              local l_37_15 = (string.match)(l_37_10.value, "%[(.*)%]")
              for l_37_19 in (string.gmatch)(l_37_15, "([^|]+)") do
                -- DECOMPILER ERROR at PC95: Overwrote pending register: R16 in 'AssignReg'

                -- DECOMPILER ERROR at PC104: Overwrote pending register: R4 in 'AssignReg'

                -- DECOMPILER ERROR at PC107: Overwrote pending register: R4 in 'AssignReg'

              end
            end
            do
              if (("7z.exe").find)(l_37_19, "Aurora.A!rfn", 1, true) or l_37_19 == "SLF:HighRiskHasMotW" then
                do
                  l_37_15 = MpCommon
                  l_37_15 = l_37_15.StringRegExpSearch
                  l_37_15 = l_37_15("\\\\(desktop|download|onedrive|document|picture)", l_37_0)
                  -- DECOMPILER ERROR at PC117: Overwrote pending register: R4 in 'AssignReg'

                  if l_37_15 then
                    do
                      do break end
                      -- DECOMPILER ERROR at PC119: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC119: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC119: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC119: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC119: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC119: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC119: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC119: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC119: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      end
      do return true, l_37_3, l_37_4 end
      do return false end
      -- DECOMPILER ERROR at PC128: Confused about usage of register R5 for local variables in 'ReleaseLocals'

    end
  end
end

NormalizeFilePathWithEnvVariable = function(l_38_0)
  -- function num : 0_37
  if not l_38_0 or not (string.find)(l_38_0, "^%w:\\") then
    return l_38_0
  end
  local l_38_1 = {}
  -- DECOMPILER ERROR at PC44: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC45: Overwrote pending register: R2 in 'AssignReg'

  local l_38_2 = "%system%"
  -- DECOMPILER ERROR at PC46: Overwrote pending register: R3 in 'AssignReg'

  local l_38_3 = "%program_files%"
  -- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

  local l_38_4 = "%programfiles%"
  local l_38_5 = {}
  -- DECOMPILER ERROR at PC49: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R7 in 'AssignReg'

  for l_38_9,l_38_10 in ("%windir%")("%programdata%") do
    -- DECOMPILER ERROR at PC53: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC54: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC55: Overwrote pending register: R13 in 'AssignReg'

    if not ("%appdata%")("%userprofile%", "%commonfiles%") then
      local l_38_11, l_38_12 = (mp.ContextualExpandEnvironmentVariables)(l_38_10)
      -- DECOMPILER ERROR at PC67: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC69: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC73: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC76: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC76: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC79: Overwrote pending register: R17 in 'AssignReg'

      if l_38_11 and not l_38_12 then
        l_38_12(l_38_2, l_38_10, ("%mydocuments%")("%common_documents%"), l_38_3, "%common_desktop%")
        -- DECOMPILER ERROR at PC81: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC84: Overwrote pending register: R12 in 'AssignReg'

      end
    else
      do
        do
          -- DECOMPILER ERROR at PC87: Overwrote pending register: R12 in 'AssignReg'

          -- DECOMPILER ERROR at PC91: Confused about usage of register: R11 in 'UnsetPending'

          -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  local l_38_13 = l_38_0:lower()
  local l_38_14 = ""
  local l_38_15 = ""
  for l_38_19,l_38_20 in pairs(l_38_5) do
    -- DECOMPILER ERROR at PC110: Overwrote pending register: R18 in 'AssignReg'

  end
  do
    do
      do return l_38_13:find(l_38_19) and #l_38_15 < #l_38_19 and l_38_14 or l_38_13 end
      -- DECOMPILER ERROR at PC124: freeLocal<0 in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

isEnabledApp = function(l_39_0)
  -- function num : 0_38
  local l_39_1 = {}
  -- DECOMPILER ERROR at PC2: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC3: Overwrote pending register: R2 in 'AssignReg'

  if ("Citrix")(l_39_0, l_39_1) then
    if (MpCommon.IsSampled)(100000, true, true, true) then
      return true
    else
      return false
    end
  end
  return true
end

hasSeenBefore = function(l_40_0, l_40_1, l_40_2, l_40_3)
  -- function num : 0_39
  local l_40_4 = l_40_3 or "Behaviors_GEN"
  local l_40_5, l_40_6 = 86400 * l_40_2, IsKeyInRollingQueue(l_40_4, l_40_0 .. l_40_1)
  if not l_40_4 then
    AppendToRollingQueue(l_40_4, l_40_0, 1, l_40_5, 1000)
    return false, 0
  else
    if l_40_4 then
      AppendToRollingQueue(R9_PC27, l_40_0, tonumber(R9_PC27) + 1, l_40_5, 1000)
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC37: Overwrote pending register: R9 in 'AssignReg'

      return true, R9_PC27
    end
  end
end

CommandlineMLScore = function()
  -- function num : 0_40
  local l_41_0 = (mp.enum_mpattributesubstring)("RPF:CmdLineMLv2:")
  local l_41_1 = 0
  if l_41_0 and #l_41_0 > 0 then
    for l_41_5,l_41_6 in ipairs(l_41_0) do
      local l_41_7 = (string.match)(l_41_6, "RPF:CmdLineMLv2:(%d+)")
      if l_41_7 then
        l_41_7 = tonumber(l_41_7)
        if l_41_1 < l_41_7 then
          l_41_1 = l_41_7
        end
      end
    end
  end
  do
    return l_41_1
  end
end

VectorSimilarityRatio = function(l_42_0, l_42_1)
  -- function num : 0_41
  if not l_42_0 or not l_42_1 then
    return 0
  end
  local l_42_2 = {}
  if #l_42_1 == 0 or #l_42_0 == 0 then
    return 0
  end
  if #l_42_1 < 5 or #l_42_0 < 5 then
    return 0
  end
  local l_42_3, l_42_4 = nil, nil
  if #l_42_0 < #l_42_1 then
    l_42_3 = #l_42_1
    l_42_4 = #l_42_0
  else
    l_42_3 = #l_42_0
    l_42_4 = #l_42_1
  end
  for l_42_8,l_42_9 in ipairs(l_42_0) do
    for l_42_13,l_42_14 in ipairs(l_42_1) do
      if l_42_9 == l_42_14 then
        (table.insert)(l_42_2, l_42_9)
      end
    end
  end
  local l_42_15 = #l_42_2 * 100 / l_42_3
  local l_42_16 = #l_42_2 * 100 / l_42_4
  return l_42_16 < l_42_15 and l_42_15 or l_42_16, l_42_2
end

IsPotentiallyClean = function(l_43_0, l_43_1, l_43_2)
  -- function num : 0_42
  if not l_43_1 or not l_43_2 then
    return false
  end
  if l_43_0 == "CmdLine" then
    if type(l_43_2) ~= "table" then
      return false
    end
    local l_43_3 = l_43_0 .. "_Appomaly_90d"
    local l_43_4 = (MpCommon.GetCurrentTimeT)()
    local l_43_5 = GetRollingQueueKeyValues(l_43_3, l_43_1)
    if l_43_5 then
      for l_43_9,l_43_10 in ipairs(l_43_5) do
        if l_43_4 - l_43_10.insert_time > 604800 then
          local l_43_11 = (string.gmatch)(l_43_10.value, "([^|]+)")
          local l_43_12, l_43_20, l_43_21 = VectorSimilarityRatio(l_43_2, l_43_11)
          if l_43_12 >= 70 then
            l_43_21 = true
            return l_43_21, l_43_12, l_43_11
          end
        end
      end
    end
    do
      local l_43_13 = 7776000
      local l_43_14 = (table.concat)(l_43_2, "|")
      local l_43_15 = AppendToRollingQueue
      local l_43_16 = l_43_3
      local l_43_17 = l_43_1
      local l_43_18 = l_43_14
      do
        local l_43_19 = l_43_13
        l_43_15(l_43_16, l_43_17, l_43_18, l_43_19, 5000, 0)
        l_43_15 = false
        do return l_43_15 end
        if (string.find)(l_43_0, "CleanProcessChain_", 1, true) then
          if type(l_43_2) ~= "string" then
            return false
          end
          local l_43_22 = 210
          local l_43_23 = l_43_1 .. "_" .. l_43_2
          local l_43_24 = (crypto.CRC32Buffer)(-1, (string.lower)(l_43_23), 0, (string.len)(l_43_23))
          if (MpCommon.NidSearch)(l_43_22, l_43_24) and l_43_22 == "#Appomaly_" .. l_43_0 .. "_" .. l_43_1 then
            return true
          end
          return false
        end
        do
          if l_43_0 == "CleanFileDrop" then
            if type(l_43_2) ~= "string" then
              return false
            end
            local l_43_25 = 210
            local l_43_26 = l_43_1 .. "_" .. l_43_2
            local l_43_27 = (crypto.CRC32Buffer)(-1, (string.lower)(l_43_26), 0, (string.len)(l_43_26))
            local l_43_28, l_43_29 = (MpCommon.NidSearch)(l_43_25, l_43_27)
            if l_43_28 and (l_43_29 == "#Appomaly_CleanFileDrop_" .. l_43_1 or l_43_29 == "#Appomaly_CleanProcessChain_" .. l_43_1) then
              return true
            end
            return false
          end
          do
            do
              if l_43_0 == "CmdLine_Basic" then
                local l_43_30 = {}
                -- DECOMPILER ERROR at PC176: No list found for R3 , SetList fails

                -- DECOMPILER ERROR at PC177: Overwrote pending register: R4 in 'AssignReg'

                -- DECOMPILER ERROR at PC178: Overwrote pending register: R5 in 'AssignReg'

                -- DECOMPILER ERROR at PC179: Overwrote pending register: R6 in 'AssignReg'

                if ("$mypsboundparameters%.containskey%(cimsession%)")("get%-wmiobject.*root\\microsoft\\windows\\defender.*$%($mpcomputerstatus%.realtimeprotectionenabled%)", "add%-type.*%-assemblyname.*system%.serviceprocess%.servicecontroller%(windefend%)", false) then
                  return true
                end
                return false
              end
              if type(l_43_2) ~= "string" and type(l_43_2) ~= "number" then
                return false
              end
              local l_43_31 = 210
              local l_43_32 = l_43_1 .. "_" .. l_43_2
              -- DECOMPILER ERROR at PC210: Overwrote pending register: R8 in 'AssignReg'

              local l_43_33 = (crypto.CRC32Buffer)(-1, (string.lower)("remove-ciminstance"), 0, (string.len)(l_43_32))
              if (MpCommon.NidSearch)(l_43_31, l_43_33) and l_43_31 == "#Appomaly_" .. l_43_0 .. "_" .. l_43_1 then
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

isChildProcByCreatedFlag = function(l_44_0)
  -- function num : 0_43
  local l_44_1, l_44_2 = (bm.get_process_relationships)()
  if l_44_1 then
    for l_44_6,l_44_7 in ipairs(l_44_1) do
      if l_44_7.ppid and l_44_7.image_path then
        local l_44_8 = (string.lower)(l_44_7.image_path)
        if (string.find)(l_44_8, l_44_0, 1, true) and (mp.bitand)(l_44_7.reason_ex, 1) == 1 then
          return true
        end
      end
    end
  end
  do
    return false
  end
end

IsDllInExpectedPath = function(l_45_0, l_45_1, l_45_2)
  -- function num : 0_44
  if not l_45_0 then
    return 
  end
  l_45_0 = (string.lower)(l_45_0)
  local l_45_3 = {}
  local l_45_4 = {}
  l_45_4.ExpectedLocation = "%programfiles%\\windows kits\\10\\windows performance toolkit"
  l_45_4.VulnerableApps = "%programfiles%\\windows kits\\10\\windows performance toolkit\\wprui.exe"
  l_45_3["windowsperformancerecorderui.dl"] = l_45_4
  l_45_3["uxcore.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\windows live\\installer", VulnerableApps = "%programfiles%\\windows live\\installer\\dashboard.exe"}
  l_45_3["tedutil.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\microsoft sdks\\windows\\%version%\\bin", VulnerableApps = "%programfiles%\\microsoft sdks\\windows\\%version%\\bin\\topoedit.exe"}
  l_45_3["symsrv.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\windows kits\\10\\debuggers\\%version%", VulnerableApps = "%programfiles%\\windows kits\\10\\debuggers\\%version%\\symstore.exe"}
  l_45_3["rcdll.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\windows kits\\10\\bin\\%version%\\%version%", VulnerableApps = "%programfiles%\\windows kits\\10\\bin\\%version%\\%version%\\rc.exe"}
  l_45_3["ppcore.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\microsoft office\\office%version%;%programfiles%\\microsoft office\\root\\office%version%;%programfiles%\\microsoft office %version%\\clientx86\\root\\office%version%;%programfiles%\\microsoft office %version%\\clientx64\\root\\office%version%", VulnerableApps = "%programfiles%\\microsoft office\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office %version%\\clientx86\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office %version%\\clientx64\\root\\office%version%\\powerpnt.exe"}
  l_45_3["outllib.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\microsoft office\\office%version%;%programfiles%\\microsoft office\\root\\office%version%;%programfiles%\\microsoft office %version%\\clientx86\\root\\office%version%;%programfiles%\\microsoft office %version%\\clientx64\\root\\office%version%", VulnerableApps = "%programfiles%\\microsoft office\\office%version%\\outlook.exe;%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;%programfiles%\\microsoft office %version%\\clientx86\\root\\office%version%\\outlook.exe;%programfiles%\\microsoft office %version%\\clientx64\\root\\office%version%\\outlook.exe"}
  l_45_3["mspgimme.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\common files\\microsoft shared\\modi\\11.0", VulnerableApps = "%programfiles%\\common files\\microsoft shared\\modi\\11.0\\mspscan.exe"}
  l_45_3["msimg32.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\haihaisoft pdf reader;%system32%;%syswow64%", VulnerableApps = "%programfiles%\\haihaisoft pdf reader\\hpreader.exe"}
  l_45_3["msidcrl40.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\msn messenger", VulnerableApps = "%programfiles%\\msn messenger\\livecall.exe"}
  l_45_3["mpgear.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\windows defender advanced threat protection\\classification;%system32%\\mrt\\%version%", VulnerableApps = "%programfiles%\\windows defender advanced threat protection\\classification\\sensece.exe"}
  l_45_3["iviewers.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\windows kits\\10\\bin\\%version%\\x86;%programfiles%\\windows kits\\10\\bin\\%version%\\x64;%programfiles%\\windows kits\\10\\bin\\%version%\\arm;%programfiles%\\windows kits\\10\\bin\\%version%\\arm64", VulnerableApps = "%programfiles%\\windows kits\\10\\bin\\%version%\\x86\\oleview.exe;%programfiles%\\windows kits\\10\\bin\\%version%\\x64\\oleview.exe;%programfiles%\\windows kits\\10\\bin\\%version%\\arm64\\oleview.exe"}
  l_45_3["imjp14k.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%;%programfiles%\\common files\\microsoft shared\\ime14\\shared", VulnerableApps = "%programfiles%\\common files\\microsoft shared\\ime14\\shared\\imecmnt.exe"}
  l_45_3["hha.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%;%programfiles%.help workshop", VulnerableApps = "%programfiles%.help workshop\\hhc.exe"}
  l_45_3["gflagsui.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\windows kits\\10\\debuggers\\%version%", VulnerableApps = "%programfiles%\\windows kits\\10\\debuggers\\%version%\\gflags.exe"}
  l_45_3["formdll.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\common files\\microsoft shared\\notesync forms", VulnerableApps = "%programfiles%\\common files\\microsoft shared\\notesync forms\\inkform.exe"}
  l_45_3["dbgeng.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\windows kits\\%version%\\debuggers\\x86;%programfiles%\\windows kits\\%version%\\debuggers\\x64;%programfiles%\\windows kits\\%version%\\debuggers\\arm;%programfiles%\\windows kits\\%version%\\debuggers\\arm64;%system32%;%syswow64%", VulnerableApps = "windbg.exe"}
  l_45_3["concrt140.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\microsoft visual studio\\%version%\\community\\common7\\ide\\vc\\vcpackages;%programfiles%\\microsoft visual studio\\%version%\\buildtools\\common7\\ide\\vc\\vcpackages;%programfiles%\\microsoft visual studio\\%version%\\buildtools\\common7\\ide;%programfiles%\\microsoft intune management extension;%programfiles%\\microsoft\\edge\\application\\%version%;%programfiles%\\microsoft\\edgewebview\\application\\%version%;%programfiles%\\microsoft\\edgewebview\\application\\%version%;%programfiles%\\microsoft rdinfra\\rdmonitoringagent_%version%\\agent;%programfiles%\\windowsapps\\microsoft.vclibs.%version%;%programfiles%\\windowsapps\\microsoft.outlookforwindows_%version%;%system32%;%syswow64%", VulnerableApps = "vcpkgsrv.exe"}
  l_45_3["atltracetoolui.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\microsoft visual studio 11.0\\common7\\tools", VulnerableApps = "%programfiles%\\microsoft visual studio 11.0\\common7\\tools\\atltracetool8.exe"}
  l_45_3["xwtpw32.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\devicepairingwizard.exe;%system32%\\rasphone.exe"}
  l_45_3["xwizards.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\devicepairingwizard.exe;%system32%\\rasphone.exe"}
  l_45_3["xpsservices.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\printfilterpipelinesvc.exe"}
  l_45_3["xolehlp.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\msdtc.exe"}
  l_45_3["xmllite.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\ddodiag.exe;%system32%\\deviceenroller.exe;%system32%\\dmcfghost.exe;%system32%\\dmclient.exe;%system32%\\dmomacpmo.exe;%system32%\\dxcap.exe;%system32%\\dxpserver.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\mousocoreworker.exe;%system32%\\musnotificationux.exe;%system32%\\musnotifyicon.exe;%system32%\\omadmclient.exe;%system32%\\psr.exe;%system32%\\resetengine.exe;%system32%\\sppsvc.exe;%system32%\\systemreset.exe;%system32%\\tracerpt.exe;%system32%\\upfc.exe;%system32%\\usocoreworker.exe;%system32%\\vsgraphicsdesktopengine.exe;%system32%\\vsgraphicsremoteengine.exe;%system32%\\wbengine.exe;%programfiles%\\common files\\microsoft shared\\ink\\inputpersonalization.exe;%system32%\\compmgmtlauncher.exe;%system32%\\explorer.exe;%system32%\\filehistory.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe"}
  l_45_3["wwapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_3["wwancfg.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_3["wtsapi32.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\appvclient.exe;%system32%\\bdeuisrv.exe;%system32%\\customshellhost.exe;%system32%\\magnify.exe;%system32%\\mblctr.exe;%system32%\\mdmappinstaller.exe;%system32%\\raserver.exe;%system32%\\rdpclip.exe;%system32%\\rdpinput.exe;%system32%\\rdpinit.exe;%system32%\\rdpshell.exe;%system32%\\rdvghelper.exe;%system32%\\sdclt.exe;%system32%\\securityhealthservice.exe;%system32%\\sethc.exe;%system32%\\slui.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\wusa.exe"}
  l_45_3["wsmsvc.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\winrs.exe;%system32%\\wsmanhttpconfig.exe;%system32%\\wsmprovhost.exe"}
  l_45_3["wshelper.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_3["wshbth.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ftp.exe;%system32%\\hostname.exe;%system32%\\stordiag.exe"}
  l_45_3["wsdapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%programfiles%\\windows kits\\10\\bin\\%version%\\x64\\wsddebug_host.exe"}
  l_45_3["wscapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wscadminui.exe"}
  l_45_3["wptsextensions.dll"], l_45_4 = l_45_4, {}
  l_45_3["wpdshext.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\notepad.exe"}
  l_45_3["wow64log.dll"], l_45_4 = l_45_4, {}
  l_45_3["wofutil.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\recoverydrive.exe;%system32%\\resetengine.exe;%system32%\\systemreset.exe"}
  l_45_3["wmsgapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\osk.exe"}
  l_45_3["wmpdui.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\wmpdmc.exe"}
  l_45_3["wmiutils.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%\\wbem;%syswow64%\\wbem", VulnerableApps = "%system32%\\stordiag.exe;%system32%\\tasklist.exe"}
  l_45_3["wmidcom.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\stordiag.exe"}
  l_45_3["wmiclnt.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dispdiag.exe;%system32%\\iscsicli.exe"}
  l_45_3["wlidprov.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\devicecensus.exe;%system32%\\shellappruntime.exe"}
  l_45_3["wldp.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mshta.exe;%system32%\\securityhealthservice.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\write.exe"}
  l_45_3["wlbsctrl.dll"], l_45_4 = l_45_4, {}
  l_45_3["wlancfg.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_3["wlanapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\legacynetuxhost.exe;%system32%\\netsh.exe;%system32%\\wifitask.exe"}
  l_45_3["wkscli.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\djoin.exe;%system32%\\dsregcmd.exe;%system32%\\edpcleanup.exe;%system32%\\getmac.exe;%system32%\\ie4uinit.exe;%system32%\\mshta.exe;%system32%\\mstsc.exe;%system32%\\net.exe;%system32%\\net1.exe;%system32%\\netdom.exe;%system32%\\secinit.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\whoami.exe"}
  l_45_3["winsync.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\synchost.exe"}
  l_45_3["winsta.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\change.exe;%system32%\\chglogon.exe;%system32%\\chgport.exe;%system32%\\ctfmon.exe;%system32%\\displayswitch.exe;%system32%\\msg.exe;%system32%\\musnotification.exe;%system32%\\query.exe;%system32%\\quser.exe;%system32%\\qprocess.exe;%system32%\\qwinsta.exe;%system32%\\rdpclip.exe;%system32%\\rdpinput.exe;%system32%\\rdpsa.exe;%system32%\\rdpsauachelper.exe;%system32%\\rdpshell.exe;%system32%\\rdvghelper.exe;%system32%\\reset.exe;%system32%\\rwinsta.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\systempropertiescomputername.exe;%system32%\\systempropertiesdataexecutionprevention.exe;%system32%\\systempropertieshardware.exe;%system32%\\systempropertiesprotection.exe;%system32%\\systempropertiesremote.exe;%system32%\\tscon.exe;%system32%\\tsdiscon.exe;%system32%\\tskill.exe;%system32%\\driverstore\\filerepository\\%version%\\igfxsdk.exe"}
  l_45_3["winsqlite3.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\browserexport.exe;%system32%\\mousocoreworker.exe"}
  l_45_3["winscard.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\immersivetpmvscmgrsvr.exe;%system32%\\rmttpmvscmgrsvr.exe;%system32%\\tpmvscmgrsvr.exe"}
  l_45_3["winrnr.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ftp.exe;%system32%\\hostname.exe;%system32%\\stordiag.exe;%programfiles%\\mozilla firefox\\firefox.exe"}
  l_45_3["winnsi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_3["winmm.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mblctr.exe;%system32%\\mspaint.exe;%system32%\\mstsc.exe;%system32%\\osk.exe;%system32%\\presentationsettings.exe;%system32%\\proximityuxhost.exe;%system32%\\wfs.exe;%system32%\\winsat.exe"}
  l_45_3["winmde.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\mdeserver.exe"}
  l_45_3["winipsec.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_3["wininet.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\appvclient.exe;%system32%\\browserexport.exe;%system32%\\calc.exe;%system32%\\certreq.exe;%system32%\\computerdefaults.exe;%system32%\\dsregcmd.exe;%system32%\\fodhelper.exe;%system32%\\ie4uinit.exe;%system32%\\logagent.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\mstsc.exe;%system32%\\presentationhost.exe;%system32%\\quickassist.exe;%system32%\\tokenbrokercookies.exe;%system32%\\wkspbroker.exe;%system32%\\wksprt.exe"}
  l_45_3["winhttp.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cmdl32.exe;%system32%\\devicecensus.exe;%system32%\\dmclient.exe;%system32%\\dsregcmd.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\msdt.exe;%system32%\\mshta.exe;%system32%\\mstsc.exe;%system32%\\musnotification.exe;%system32%\\musnotificationux.exe;%system32%\\musnotifyicon.exe;%system32%\\netsh.exe;%system32%\\pacjsworker.exe;%system32%\\recoverydrive.exe;%system32%\\resetengine.exe;%system32%\\rpcping.exe;%system32%\\sgrmlpac.exe;%system32%\\sihclient.exe;%system32%\\systemreset.exe;%system32%\\wkspbroker.exe;%programfiles%\\minecraft launcher\\minecraftlauncher.exe"}
  l_45_3["windowsudk.shellcommon.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\compmgmtlauncher.exe;%system32%\\explorer.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe"}
  l_45_3["windowsperformancerecordercontrol.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%programfiles%\\windows kits\\10\\windows performance toolkit;%system32%;%syswow64%", VulnerableApps = "%system32%\\wpr.exe"}
  l_45_3["windowscodecsext.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wfs.exe"}
  l_45_3["windowscodecs.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\osk.exe;%system32%\\quickassist.exe;%system32%\\wmpdmc.exe;%system32%\\compmgmtlauncher.exe;%system32%\\dfrgui.exe;%system32%\\explorer.exe;%system32%\\filehistory.exe;%system32%\\gamepanel.exe;%system32%\\mstsc.exe;%system32%\\notepad.exe;%system32%\\presentationsettings.exe;%system32%\\wfs.exe;%system32%\\winver.exe;%system32%\\wordpad.exe;%system32%\\wscollect.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe;%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe"}
  l_45_3["windows.ui.immersive.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dmnotificationbroker.exe;%system32%\\phoneactivate.exe"}
  l_45_3["windows.storage.search.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\control.exe;%system32%\\explorer.exe;%system32%\\notepad.exe"}
  l_45_3["windows.storage.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\calc.exe;%system32%\\certreq.exe;%system32%\\compmgmtlauncher.exe;%system32%\\control.exe;%system32%\\dfrgui.exe;%system32%\\explorer.exe;%system32%\\filehistory.exe;%system32%\\licensingdiag.exe;%system32%\\msdt.exe;%system32%\\mstsc.exe;%system32%\\notepad.exe;%system32%\\powershell.exe;%system32%\\presentationsettings.exe;%system32%\\rdpclip.exe;%system32%\\tabcal.exe;%system32%\\verifier.exe;%system32%\\wfs.exe;%system32%\\workfolders.exe;%system32%\\write.exe;%system32%\\wscollect.exe;%programfiles%\\google\\chrome\\application\\chrome.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\mozilla firefox\\firefox.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe;%appdata%\\zoom\\bin\\zoom.exe;%programfiles%\\windowsapps\\microsoftteams%version%\\msteams.exe;%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msoev.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msotd.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\onenote.exe"}
  l_45_3["winbrand.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bdehdcfg.exe;%system32%\\licensediag.exe;%system32%\\slui.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\systemsettingsadminflows.exe"}
  l_45_3["winbio.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\securityhealthservice.exe"}
  l_45_3["wimgapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%;%programfiles%\\windows kits\\10\\assessment and deployment kit\\deployment tools\\arm64\\dism", VulnerableApps = "%system32%\\recoverydrive.exe;%system32%\\resetengine.exe;%system32%\\systemreset.exe;%system32%\\dism.exe"}
  l_45_3["whhelper.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_3["wevtapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cidiag.exe;%system32%\\dcdiag.exe;%system32%\\gpupdate.exe;%system32%\\mbaeparsertask.exe;%system32%\\netsh.exe;%system32%\\nlb.exe;%system32%\\packageinspector.exe;%system32%\\plasrv.exe;%system32%\\tracerpt.exe;%system32%\\wecutil.exe;%system32%\\wlbs.exe;%system32%\\wsreset.exe;%system32%\\filehistory.exe;%system32%\\logman.exe"}
  l_45_3["wer.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dwwin.exe;%system32%\\msdt.exe;%system32%\\pcalua.exe;%system32%\\relpost.exe;%system32%\\rstrui.exe;%system32%\\sdclt.exe;%system32%\\srtasks.exe;%system32%\\wbengine.exe;%system32%\\werfault.exe;%system32%\\werfaultsecure.exe;%system32%\\wermgr.exe"}
  l_45_3["wecapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wecutil.exe"}
  l_45_3["webservices.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\clipup.exe;%system32%\\sppsvc.exe;%system32%\\vsgraphicsdesktopengine.exe;%system32%\\vsgraphicsremoteengine.exe;%system32%\\wifitask.exe;%system32%\\wksprt.exe"}
  l_45_3["wdscore.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\deploymentcsphelper.exe;%system32%\\djoin.exe;%system32%\\dnscacheugc.exe;%system32%\\muiunattend.exe;%system32%\\netbtugc.exe;%system32%\\netiougc.exe;%system32%\\pnpunattend.exe;%system32%\\recoverydrive.exe;%system32%\\resetengine.exe;%system32%\\setupugc.exe;%system32%\\sysreseterr.exe;%system32%\\systemreset.exe;%system32%\\tapiunattend.exe;%system32%\\ieunatt.exe"}
  l_45_3["wdi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cofire.exe;%system32%\\msra.exe;%system32%\\netsh.exe;%system32%\\dpiscaling.exe;%system32%\\slui.exe"}
  l_45_3["wcnnetsh.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_3["wcmapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_3["wbemsvc.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%\\wbem;%syswow64%\\wbem", VulnerableApps = "%system32%\\cttune.exe;%system32%\\devicecensus.exe;%system32%\\driverquery.exe;%system32%\\getmac.exe;%system32%\\licensingdiag.exe;%system32%\\msinfo32.exe;%system32%\\stordiag.exe;%system32%\\systeminfo.exe;%system32%\\tasklist.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\microsoft office\\root\\office%version%\\excelcnv.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\onenote.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\scanpst.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\winword.exe"}
  l_45_3["wbemprox.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%\\wbem;%syswow64%\\wbem", VulnerableApps = "%system32%\\cttune.exe;%system32%\\devicecensus.exe;%system32%\\driverquery.exe;%system32%\\getmac.exe;%system32%\\gpresult.exe;%system32%\\licensingdiag.exe;%system32%\\msinfo32.exe;%system32%\\stordiag.exe;%system32%\\systeminfo.exe;%system32%\\taskkill.exe;%system32%\\tasklist.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\microsoft office\\root\\office%version%\\excelcnv.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\onenote.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\scanpst.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\winword.exe"}
  l_45_3["wbemcomn.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wbem\\wmiapsrv.exe"}
  l_45_3["vsstrace.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\resetengine.exe;%system32%\\rstrui.exe;%system32%\\sdclt.exe;%system32%\\srtasks.exe;%system32%\\systemreset.exe;%system32%\\vssadmin.exe;%system32%\\vssvc.exe;%system32%\\wbengine.exe"}
  l_45_3["vssapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\cleanmgr.exe;%system32%\\dsdbutil.exe;%system32%\\ntdsutil.exe;%system32%\\recoverydrive.exe;%system32%\\resetengine.exe;%system32%\\rstrui.exe;%system32%\\sdclt.exe;%system32%\\srtasks.exe;%system32%\\systemreset.exe;%system32%\\vssadmin.exe;%system32%\\vssvc.exe;%system32%\\wbengine.exe;%programfiles%\\avira\\antivirus\\avshadow.exe"}
  l_45_3["virtdisk.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\vssvc.exe;%system32%\\wbengine.exe"}
  l_45_3["version.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\agentservice.exe;%system32%\\certutil.exe;%system32%\\choice.exe;%system32%\\clip.exe;%system32%\\cmstp.exe;%system32%\\cofire.exe;%system32%\\cscript.exe;%system32%\\diskpart.exe;%system32%\\diskraid.exe;%system32%\\dism.exe;%system32%\\driverquery.exe;%system32%\\forfiles.exe;%system32%\\fxssvc.exe;%system32%\\ie4ushowie.exe;%system32%\\iexpress.exe;%system32%\\msconfig.exe;%system32%\\mstsc.exe;%system32%\\openfiles.exe;%system32%\\presentationhost.exe;%system32%\\psr.exe;%system32%\\relpost.exe;%system32%\\sfc.exe;%system32%\\sigverif.exe;%system32%\\systeminfo.exe;%system32%\\taskkill.exe;%system32%\\tasklist.exe;%system32%\\timeout.exe;%system32%\\unregmp2.exe;%system32%\\verifiergui.exe;%system32%\\vsgraphicsdesktopengine.exe;%system32%\\waitfor.exe;%system32%\\wextract.exe;%system32%\\where.exe;%system32%\\whoami.exe;%system32%\\winsat.exe;%system32%\\wscript.exe;%appdata%\\zoom\\bin\\zoom.exe"}
  l_45_3["vdsutil.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\vdsldr.exe"}
  l_45_3["vaultcli.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cipher.exe;%system32%\\efsui.exe;%system32%\\rekeywiz.exe;%system32%\\vaultcmd.exe"}
  l_45_3["uxtheme.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\atbroker.exe;%system32%\\cloudnotifications.exe;%system32%\\cttune.exe;%system32%\\displayswitch.exe;%system32%\\ehstorauthn.exe;%system32%\\filehistory.exe;%system32%\\gamepanel.exe;%system32%\\isoburn.exe;%system32%\\mblctr.exe;%system32%\\mmc.exe;%system32%\\msdt.exe;%system32%\\msra.exe;%system32%\\musnotifyicon.exe;%system32%\\passwordonwakesettingflyout.exe;%system32%\\quickassist.exe;%system32%\\recoverydrive.exe;%system32%\\sdclt.exe;%system32%\\sethc.exe;%system32%\\sndvol.exe;%system32%\\snippingtool.exe;%system32%\\taskmgr.exe;%system32%\\wfs.exe;%system32%\\wiaacmgr.exe;%system32%\\wiawow64.exe;%system32%\\wmpdmc.exe;%programfiles%\\keepass password safe 2\\keepass.exe"}
  l_45_3["uxinit.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\winlogon.exe"}
  l_45_3["utildll.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\change.exe;%system32%\\chglogon.exe;%system32%\\chgport.exe;%system32%\\query.exe;%system32%\\quser.exe;%system32%\\qprocess.exe;%system32%\\qwinsta.exe;%system32%\\reset.exe;%system32%\\rwinsta.exe;%system32%\\tscon.exe;%system32%\\tskill.exe"}
  l_45_3["userenv.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\appidpolicyconverter.exe;%system32%\\appvclient.exe;%system32%\\appvshnotify.exe;%system32%\\bdeuisrv.exe;%system32%\\colorcpl.exe;%system32%\\customshellhost.exe;%system32%\\dccw.exe;%system32%\\deviceenroller.exe;%system32%\\dmomacpmo.exe;%system32%\\dsregcmd.exe;%system32%\\efsui.exe;%system32%\\gpupdate.exe;%system32%\\mdmappinstaller.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\microsoftedgebchost.exe;%system32%\\microsoftedgecp.exe;%system32%\\microsoftedgesh.exe;%system32%\\mrt.exe;%system32%\\msra.exe;%system32%\\musnotification.exe;%system32%\\musnotificationux.exe;%system32%\\netsh.exe;%system32%\\omadmclient.exe;%system32%\\proquota.exe;%system32%\\rekeywiz.exe;%system32%\\runexehelper.exe;%system32%\\securityhealthservice.exe;%system32%\\settingsynchost.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\tttracer.exe;%system32%\\utcdecoderhost.exe;%system32%\\vaultcmd.exe;%system32%\\workfolders.exe;%system32%\\wpcmon.exe"}
  l_45_3["urlmon.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bytecodegenerator.exe;%system32%\\ie4uinit.exe;%system32%\\ldifde.exe;%system32%\\presentationhost.exe;%system32%\\write.exe"}
  l_45_3["upshared.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\musnotification.exe;%system32%\\musnotificationux.exe;%system32%\\musnotifyicon.exe"}
  l_45_3["updatepolicy.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mousocoreworker.exe;%system32%\\musnotification.exe;%system32%\\musnotificationux.exe;%system32%\\usoclient.exe;%system32%\\usocoreworker.exe"}
  l_45_3["unattend.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\recoverydrive.exe"}
  l_45_3["umpdc.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\deviceenroller.exe;%system32%\\dmcertinst.exe;%system32%\\iesettingsync.exe;%system32%\\mousocoreworker.exe;%system32%\\netevtfwdr.exe;%system32%\\omadmclient.exe;%system32%\\settingsynchost.exe;%system32%\\usocoreworker.exe;%system32%\\wifitask.exe;%system32%\\runtimebroker.exe"}
  l_45_3["uiribbon.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wordpad.exe"}
  l_45_3["uireng.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\psr.exe"}
  l_45_3["uiautomationcore.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\gamepanel.exe;%system32%\\magnify.exe"}
  l_45_3["uianimation.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cloudnotifications.exe;%system32%\\gamepanel.exe"}
  l_45_3["twinui.appcore.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\calc.exe"}
  l_45_3["twinapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dataexchangehost.exe;%system32%\\rasphone.exe;%system32%\\rdpclip.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe;%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe"}
  l_45_3["twext.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\compmgmtlauncher.exe"}
  l_45_3["ttdrecord.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\tttracer.exe"}
  l_45_3["tsworkspace.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wkspbroker.exe"}
  l_45_3["tquery.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\searchfilterhost.exe;%system32%\\searchprotocolhost.exe"}
  l_45_3["tpmcoreprovisioning.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\tpmtool.exe"}
  l_45_3["timesync.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\systemsettingsadminflows.exe"}
  l_45_3["textshaping.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%programfiles%\\windows kits\\10\\debuggers\\x64\\logger.exe;%programfiles%\\windows kits\\10\\debuggers\\x64\\logviewer.exe"}
  l_45_3["tdh.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\plasrv.exe"}
  l_45_3["tbs.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\resetengine.exe;%system32%\\sgrmbroker.exe;%system32%\\systemreset.exe;%system32%\\tpmtool.exe"}
  l_45_3["tapi32.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dialer.exe;%system32%\\fxssvc.exe;%system32%\\tcmsetup.exe"}
  l_45_3["systemsettingsthresholdadminflowui.dl"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\systemsettingsadminflows.exe"}
  l_45_3["sxshared.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\defrag.exe;%system32%\\dfrgui.exe"}
  l_45_3["structuredquery.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\control.exe;%system32%\\explorer.exe;%system32%\\notepad.exe"}
  l_45_3["sti.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%programfiles%\\windows photo viewer\\imagingdevices.exe"}
  l_45_3["staterepository.core.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\applytrustoffline.exe;%system32%\\lpremove.exe;%system32%\\systemsettingsadminflows.exe"}
  l_45_3["ssshim.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\sfc.exe"}
  l_45_3["sspicli.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\at.exe;%system32%\\bitsadmin.exe;%system32%\\bootcfg.exe;%system32%\\calc.exe;%system32%\\certreq.exe;%system32%\\certutil.exe;%system32%\\computerdefaults.exe;%system32%\\credentialenrollmentmanager.exe;%system32%\\customshellhost.exe;%system32%\\deviceenroller.exe;%system32%\\dialer.exe;%system32%\\driverquery.exe;%system32%\\dsregcmd.exe;%system32%\\edpcleanup.exe;%system32%\\eduprintprov.exe;%system32%\\eventcreate.exe;%system32%\\fodhelper.exe;%system32%\\ftp.exe;%system32%\\getmac.exe;%system32%\\gpresult.exe;%system32%\\iesettingsync.exe;%system32%\\klist.exe;%system32%\\ksetup.exe;%system32%\\ldp.exe;%system32%\\logman.exe;%system32%\\mdeserver.exe;%system32%\\msdt.exe;%system32%\\mshta.exe;%system32%\\msra.exe;%system32%\\mstsc.exe;%system32%\\mtstocom.exe;%system32%\\muiunattend.exe;%system32%\\netdom.exe;%system32%\\netsh.exe;%system32%\\openfiles.exe;%system32%\\perfmon.exe;%system32%\\pinenrollmentbroker.exe;%system32%\\presentationsettings.exe;%system32%\\psr.exe;%system32%\\quickassist.exe;%system32%\\rdpsa.exe;%system32%\\rpcping.exe;%system32%\\runas.exe;%system32%\\sdclt.exe;%system32%\\setx.exe;%system32%\\shutdown.exe;%system32%\\systeminfo.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\takeown.exe;%system32%\\taskkill.exe;%system32%\\tasklist.exe;%system32%\\waitfor.exe;%system32%\\whoami.exe;%system32%\\wkspbroker.exe;%system32%\\wlrmdr.exe;%system32%\\compmgmtlauncher.exe;%system32%\\rasphone.exe"}
  l_45_3["ssp_isv.exe_rsaenh.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\rmactivate"}
  l_45_3["ssp.exe_rsaenh.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\rmactivate"}
  l_45_3["srvcli.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\change.exe;%system32%\\chglogon.exe;%system32%\\chgport.exe;%system32%\\dcdiag.exe;%system32%\\dsdbutil.exe;%system32%\\driverquery.exe;%system32%\\eventcreate.exe;%system32%\\getmac.exe;%system32%\\gpresult.exe;%system32%\\ksetup.exe;%system32%\\net.exe;%system32%\\net1.exe;%system32%\\netdom.exe;%system32%\\ntdsutil.exe;%system32%\\openfiles.exe;%system32%\\query.exe;%system32%\\quser.exe;%system32%\\qwinsta.exe;%system32%\\reset.exe;%system32%\\rwinsta.exe;%system32%\\shrpubw.exe;%system32%\\spaceagent.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\taskkill.exe;%system32%\\tasklist.exe;%system32%\\tscon.exe;%system32%\\tskill.exe;%system32%\\waitfor.exe;%system32%\\wbengine.exe"}
  l_45_3["srpapi.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\appidpolicyconverter.exe;%system32%\\mshta.exe;%system32%\\rdpclip.exe"}
  l_45_3["srmtrace.dll"], l_45_4 = l_45_4, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dirquota.exe;%system32%\\filescrn.exe;%system32%\\storrept.exe"}
  l_45_4 = "srcore.dl"
  local l_45_5 = {}
  l_45_5.ExpectedLocation = "%system32%"
  l_45_5.VulnerableApps = "%system32%\\rstrui.exe;%system32%\\srtasks.exe"
  l_45_3[l_45_4] = l_45_5
  l_45_4 = "srclient.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\srtasks.exe;%system32%\\tiworker.exe"}
  l_45_4 = "sppcext.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\phoneactivate.exe"}
  l_45_4 = "sppc.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\msinfo32.exe;%system32%\\netsh.exe;%system32%\\packageinspector.exe;%system32%\\slui.exe"}
  l_45_4 = "spp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\rstrui.exe;%system32%\\sdclt.exe;%system32%\\srtasks.exe;%system32%\\wbengine.exe"}
  l_45_4 = "spectrumsyncclient.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\spectrum.exe"}
  l_45_4 = "snmpapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\arp.exe;%system32%\\netstat.exe"}
  l_45_4 = "slc.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\msinfo32.exe;%system32%\\netsh.exe;%system32%\\packageinspector.exe;%system32%\\phoneactivate.exe;%system32%\\slui.exe"}
  l_45_4 = "shellchromeapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "shell32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\control.exe;%system32%\\dpiscaling.exe;%system32%\\mobsync.exe;%system32%\\mstsc.exe;%system32%\\notepad.exe;%system32%\\presentationsettings.exe;%system32%\\shellappruntime.exe;%system32%\\wallpaperhost.exe"}
  l_45_4 = "sensapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%programfiles%\\minecraft launcher\\minecraftlauncher.exe"}
  l_45_4 = "security.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\telnet.exe"}
  l_45_4 = "secur32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\appvclient.exe;%system32%\\calc.exe;%system32%\\certreq.exe;%system32%\\certutil.exe;%system32%\\computerdefaults.exe;%system32%\\dfsrdiag.exe;%system32%\\dsregcmd.exe;%system32%\\dsrm.exe;%system32%\\fodhelper.exe;%system32%\\gpresult.exe;%system32%\\klist.exe;%system32%\\msdt.exe;%system32%\\repadmin.exe;%system32%\\consent.exe;%system32%\\compmgmtlauncher.exe;%localappdata%\\microsoft\\onedrive\\%version%\\microsoft.sharepoint.exe"}
  l_45_4 = "schedcli.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\at.exe"}
  l_45_4 = "scecli.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\convert.exe;%system32%\\secedit.exe"}
  l_45_4 = "scansetting.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wiaacmgr.exe;%system32%\\wiawow64.exe"}
  l_45_4 = "sas.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\quickassist.exe"}
  l_45_4 = "sapi_onecore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\devicecensus.exe"}
  l_45_4 = "samlib.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dpapimig.exe;%system32%\\dsmgmt.exe;%system32%\\easinvoker.exe;%system32%\\netplwiz.exe;%system32%\\ntdsutil.exe"}
  l_45_4 = "samcli.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certutil.exe;%system32%\\change.exe;%system32%\\chglogon.exe;%system32%\\chgport.exe;%system32%\\credwiz.exe;%system32%\\dcdiag.exe;%system32%\\deviceenroller.exe;%system32%\\dpapimig.exe;%system32%\\easinvoker.exe;%system32%\\net.exe;%system32%\\net1.exe;%system32%\\netdom.exe;%system32%\\netplwiz.exe;%system32%\\query.exe;%system32%\\quser.exe;%system32%\\qwinsta.exe;%system32%\\raserver.exe;%system32%\\reset.exe;%system32%\\rwinsta.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\tscon.exe;%system32%\\tskill.exe;%system32%\\wpcmon.exe"}
  l_45_4 = "rtworkq.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mdeserver.exe;%system32%\\mfpmp.exe"}
  l_45_4 = "rtutils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dialer.exe;%system32%\\nethost.exe;%system32%\\rasautou.exe;%system32%\\rasdial.exe;%system32%\\rasphone.exe"}
  l_45_4 = "rsaenh.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\compmgmtlauncher.exe;%system32%\\disksnapshot.exe;%system32%\\filehistory.exe;%system32%\\licensingdiag.exe;%system32%\\lpksetup.exe;%system32%\\microsoft.uev.synccontroller.exe;%system32%\\phoneactivate.exe;%system32%\\powershell.exe;%system32%\\rmactivate.exe;%system32%\\scriptrunner.exe;%system32%\\sppextcomobj.exe;%system32%\\stordiag.exe;%system32%\\tzsync.exe;%system32%\\uevappmonitor.exe;%system32%\\useraccountcontrolsettings.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\mozilla firefox\\firefox.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe;%appdata%\\zoom\\bin\\zoom.exe;%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msoadfsb.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\namecontrolserver.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\onenote.exe"}
  l_45_4 = "rpcnsh.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "rmclient.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe;%system32%\\runtimebroker.exe"}
  l_45_4 = "rjvplatform.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%\\systemresetplatform;%syswow64%\\systemresetplatform", VulnerableApps = "%system32%\\systemresetplatform\\systemresetplatform.exe"}
  l_45_4 = "resutils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dfsdiag.exe;%system32%\\msdtc.exe"}
  l_45_4 = "resetengine.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\resetengine.exe;%system32%\\systemreset.exe"}
  l_45_4 = "reseteng.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\bootim.exe"}
  l_45_4 = "regapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\change.exe;%system32%\\chglogon.exe;%system32%\\query.exe;%system32%\\reset.exe"}
  l_45_4 = "reagent.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\reagentc.exe;%system32%\\recdisc.exe;%system32%\\recoverydrive.exe;%system32%\\relpost.exe;%system32%\\resetengine.exe;%system32%\\sdclt.exe;%system32%\\systemreset.exe"}
  l_45_4 = "rasmontr.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "rasman.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cmdl32.exe;%system32%\\nethost.exe;%system32%\\netsh.exe;%system32%\\rasautou.exe;%system32%\\rasdial.exe"}
  l_45_4 = "rasgcw.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\rasphone.exe"}
  l_45_4 = "rasdlg.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\rasautou.exe"}
  l_45_4 = "rasapi32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cmdl32.exe;%system32%\\nethost.exe;%system32%\\netsh.exe;%system32%\\rasdial.exe"}
  l_45_4 = "radcui.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wkspbroker.exe"}
  l_45_4 = "puiapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\printui.exe"}
  l_45_4 = "prvdmofcomp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\register-cimprovider.exe"}
  l_45_4 = "proximityservicepal.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\proximityuxhost.exe"}
  l_45_4 = "proximitycommon.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\proximityuxhost.exe"}
  l_45_4 = "propsys.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\calc.exe;%system32%\\colorcpl.exe;%system32%\\compmgmtlauncher.exe;%system32%\\computerdefaults.exe;%system32%\\customshellhost.exe;%system32%\\dpiscaling.exe;%system32%\\dsregcmd.exe;%system32%\\dxpserver.exe;%system32%\\fodhelper.exe;%system32%\\fondue.exe;%system32%\\fxssvc.exe;%system32%\\fxsunatd.exe;%system32%\\mobsync.exe;%system32%\\mspaint.exe;%system32%\\netplwiz.exe;%system32%\\optionalfeatures.exe;%system32%\\pinenrollmentbroker.exe;%system32%\\printbrmui.exe;%system32%\\printui.exe;%system32%\\proximityuxhost.exe;%system32%\\quickassist.exe;%system32%\\rdpclip.exe;%system32%\\resmon.exe;%system32%\\sdclt.exe;%system32%\\settingsynchost.exe;%system32%\\slui.exe;%system32%\\synchost.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\wfs.exe;%system32%\\wkspbroker.exe;%system32%\\workfolders.exe;%system32%\\wpnpinst.exe;%system32%\\write.exe;%system32%\\certreq.exe;%system32%\\cleanmgr.exe;%system32%\\control.exe;%system32%\\ddodiag.exe;%system32%\\dfrgui.exe;%system32%\\explorer.exe;%system32%\\fxscover.exe;%system32%\\licensingdiag.exe;%system32%\\msdt.exe;%system32%\\notepad.exe;%system32%\\powershell.exe;%system32%\\presentationsettings.exe;%system32%\\tabcal.exe;%system32%\\verifier.exe;%programfiles%\\google\\chrome\\application\\chrome.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\mozilla firefox\\firefox.exe;%appdata%\\zoom\\bin\\zoom.exe;%programfiles%\\windowsapps\\microsoftteams%version%\\msteams.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\graph.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msoev.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msotd.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\onenote.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe"}
  l_45_4 = "profapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\edpcleanup.exe;%system32%\\immersivetpmvscmgrsvr.exe;%system32%\\manage-bde.exe;%system32%\\mousocoreworker.exe;%system32%\\omadmclient.exe;%system32%\\provtool.exe;%system32%\\rmttpmvscmgrsvr.exe;%system32%\\tpmvscmgrsvr.exe;%system32%\\usocoreworker.exe;%system32%\\wwahost.exe;%system32%\\write.exe;%programfiles%\\microsoft deployment toolkit\\bin\\microsoft.bdd.catalog35.exe"}
  l_45_4 = "prntvpt.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\printfilterpipelinesvc.exe"}
  l_45_4 = "printui.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\printui.exe"}
  l_45_4 = "powrprof.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\fsquirt.exe;%system32%\\msinfo32.exe;%system32%\\printfilterpipelinesvc.exe;%system32%\\sfc.exe"}
  l_45_4 = "polstore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "policymanager.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\displayswitch.exe;%system32%\\easpolicymanagerbrokerhost.exe;%system32%\\edpcleanup.exe;%system32%\\eduprintprov.exe;%system32%\\hvsievaluator.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\omadmclient.exe;%system32%\\settingsynchost.exe;%system32%\\workfolders.exe"}
  l_45_4 = "pnrpnsp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ftp.exe;%system32%\\hostname.exe;%system32%\\stordiag.exe"}
  l_45_4 = "playsndsrv.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\sethc.exe"}
  l_45_4 = "pla.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\logman.exe"}
  l_45_4 = "pkeyhelper.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\sppsvc.exe"}
  l_45_4 = "peerdistsh.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "pdh.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\plasrv.exe;%system32%\\relog.exe;%system32%\\taskmgr.exe;%system32%\\tracerpt.exe;%system32%\\typeperf.exe;%system32%\\logman.exe"}
  l_45_4 = "pcaui.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\pcaui.exe;%system32%\\pcalua.exe"}
  l_45_4 = "p9np.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\msdt.exe;%system32%\\notepad.exe;%system32%\\powershell.exe;%system32%\\stordiag.exe;%system32%\\tabcal.exe;%system32%\\verifier.exe;%system32%\\workfolders.exe;%system32%\\write.exe"}
  l_45_4 = "p2pnetsh.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "p2p.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "osuninst.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\convert.exe;%system32%\\vds.exe"}
  l_45_4 = "osksupport.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\osk.exe"}
  l_45_4 = "osbaseln.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\fondue.exe;%system32%\\optionalfeatures.exe"}
  l_45_4 = "opcservices.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\proximityuxhost.exe"}
  l_45_4 = "onex.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "omadmapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\deviceenroller.exe;%system32%\\dmcertinst.exe;%system32%\\dmcfghost.exe;%system32%\\dmomacpmo.exe;%system32%\\hvsievaluator.exe;%system32%\\mdmagent.exe;%system32%\\mdmappinstaller.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\omadmclient.exe;%system32%\\omadmrpc.exe;%system32%\\usocoreworker.exe"}
  l_45_4 = "oleacc.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\cttune.exe;%system32%\\devicepairingwizard.exe;%system32%\\easeofaccessdialog.exe;%system32%\\fsquirt.exe;%system32%\\magnify.exe;%system32%\\optionalfeatures.exe;%system32%\\osk.exe;%system32%\\psr.exe;%system32%\\sethc.exe;%system32%\\snippingtool.exe;%system32%\\utilman.exe;%system32%\\wmpdmc.exe"}
  l_45_4 = "oci.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "ntshrui.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\compmgmtlauncher.exe;%system32%\\notepad.exe"}
  l_45_4 = "ntmarta.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cacls.exe;%programfiles%\\google\\chrome\\application\\chrome.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\microsoft\\edgewebview\\application\\%version%\\msedgewebview2.exe"}
  l_45_4 = "ntlmshared.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\at.exe"}
  l_45_4 = "ntlanman.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\msdt.exe;%system32%\\notepad.exe;%system32%\\powershell.exe;%system32%\\stordiag.exe;%system32%\\tabcal.exe;%system32%\\verifier.exe;%system32%\\workfolders.exe;%system32%\\write.exe"}
  l_45_4 = "ntdsapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certutil.exe;%system32%\\cipher.exe;%system32%\\dcdiag.exe;%system32%\\dfsrdiag.exe;%system32%\\dnscmd.exe;%system32%\\dsacls.exe;%system32%\\dsadd.exe;%system32%\\dsdbutil.exe;%system32%\\dsget.exe;%system32%\\dsmgmt.exe;%system32%\\dsquery.exe;%system32%\\gpresult.exe;%system32%\\licmgr.exe;%system32%\\netdom.exe;%system32%\\nltest.exe;%system32%\\ntdsutil.exe;%system32%\\rendom.exe;%system32%\\repadmin.exe;%system32%\\setspn.exe;%system32%\\w32tm.exe"}
  l_45_4 = "nshwfp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "nshipsec.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "nshhttp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "npmproxy.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\apphostregistrationverifier.exe;%system32%\\devicecensus.exe;%system32%\\directxdatabaseupdater.exe;%system32%\\fxscover.exe;%system32%\\microsoft.uev.synccontroller.exe;%system32%\\rdpclip.exe;%system32%\\wordpad.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe;%programfiles%\\microsoft office\\root\\office%version%\\clview.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\cnfnot32.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\excelcnv.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\graph.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msoia.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msosrec.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msqry32.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\namecontrolserver.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\onenote.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\protocolhandler.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\scanpst.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\sdxhelper.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\setlang.exe"}
  l_45_4 = "nlansp_c.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ftp.exe;%system32%\\hostname.exe;%system32%\\stordiag.exe"}
  l_45_4 = "nlaapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "ninput.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\multidigimon.exe;%system32%\\tabcal.exe"}
  l_45_4 = "newdev.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\infdefaultinstall.exe;%system32%\\pnpunattend.exe;%system32%\\systemsettingsadminflows.exe"}
  l_45_4 = "networkexplorer.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\notepad.exe"}
  l_45_4 = "netutils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\at.exe;%system32%\\certutil.exe;%system32%\\change.exe;%system32%\\chglogon.exe;%system32%\\chgport.exe;%system32%\\credwiz.exe;%system32%\\csvde.exe;%system32%\\dcdiag.exe;%system32%\\devicecensus.exe;%system32%\\deviceenroller.exe;%system32%\\djoin.exe;%system32%\\dpapimig.exe;%system32%\\driverquery.exe;%system32%\\dsacls.exe;%system32%\\dsdbutil.exe;%system32%\\dsmgmt.exe;%system32%\\dsregcmd.exe;%system32%\\easinvoker.exe;%system32%\\edpcleanup.exe;%system32%\\efsui.exe;%system32%\\eventcreate.exe;%system32%\\getmac.exe;%system32%\\gpfixup.exe;%system32%\\gpresult.exe;%system32%\\ie4uinit.exe;%system32%\\klist.exe;%system32%\\ksetup.exe;%system32%\\ldifde.exe;%system32%\\mshta.exe;%system32%\\mstsc.exe;%system32%\\net.exe;%system32%\\net1.exe;%system32%\\netdom.exe;%system32%\\netplwiz.exe;%system32%\\nltest.exe;%system32%\\ntdsutil.exe;%system32%\\openfiles.exe;%system32%\\query.exe;%system32%\\quser.exe;%system32%\\qwinsta.exe;%system32%\\raserver.exe;%system32%\\redircmp.exe;%system32%\\redirusr.exe;%system32%\\rekeywiz.exe;%system32%\\rendom.exe;%system32%\\repadmin.exe;%system32%\\reset.exe;%system32%\\runas.exe;%system32%\\rwinsta.exe;%system32%\\setspn.exe;%system32%\\shrpubw.exe;%system32%\\spaceagent.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\taskkill.exe;%system32%\\tasklist.exe;%system32%\\tscon.exe;%system32%\\tskill.exe;%system32%\\w32tm.exe;%system32%\\waitfor.exe;%system32%\\wbengine.exe;%system32%\\whoami.exe"}
  l_45_4 = "nettrace.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "netshell.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe;%system32%\\rasphone.exe"}
  l_45_4 = "netsetupapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\rasphone.exe"}
  l_45_4 = "netprovfw.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\djoin.exe"}
  l_45_4 = "netprofm.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\fxscover.exe;%system32%\\rdpclip.exe;%system32%\\wordpad.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\mozilla firefox\\firefox.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe;%programfiles%\\windowsapps\\microsoftteams%version%\\msteams.exe;%programfiles%\\microsoft office\\root\\office%version%\\clview.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\cnfnot32.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\excelcnv.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\graph.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msoia.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msosrec.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msqry32.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\namecontrolserver.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\onenote.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\protocolhandler.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\scanpst.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\sdxhelper.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\setlang.exe"}
  l_45_4 = "netplwiz.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netplwiz.exe"}
  l_45_4 = "netjoin.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netdom.exe"}
  l_45_4 = "netiohlp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "netid.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\systempropertiesadvanced.exe"}
  l_45_4 = "netapi32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\appvclient.exe;%system32%\\bootcfg.exe;%system32%\\certutil.exe;%system32%\\dcdiag.exe;%system32%\\dfscmd.exe;%system32%\\dfsdiag.exe;%system32%\\dfsrdiag.exe;%system32%\\dfsutil.exe;%system32%\\dnscmd.exe;%system32%\\dsadd.exe;%system32%\\dsget.exe;%system32%\\dsquery.exe;%system32%\\ie4uinit.exe;%system32%\\mstsc.exe;%system32%\\qappsrv.exe;%system32%\\spaceagent.exe;%system32%\\wbengine.exe"}
  l_45_4 = "ndfapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\msra.exe;%system32%\\netsh.exe;%system32%\\dpiscaling.exe;%system32%\\slui.exe"}
  l_45_4 = "ncrypt.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\certutil.exe;%system32%\\clipup.exe;%system32%\\dmcertinst.exe;%system32%\\dnscmd.exe;%system32%\\dsregcmd.exe;%system32%\\sgrmbroker.exe;%system32%\\filehistory.exe"}
  l_45_4 = "napinsp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ftp.exe;%system32%\\hostname.exe;%system32%\\stordiag.exe"}
  l_45_4 = "mtxclu.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\msdtc.exe"}
  l_45_4 = "msxml3.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wordpad.exe"}
  l_45_4 = "mswsock.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\alg.exe;%system32%\\finger.exe;%system32%\\fsquirt.exe;%system32%\\nbtstat.exe;%system32%\\curl.exe;%system32%\\devicecensus.exe;%system32%\\ftp.exe;%system32%\\hostname.exe;%system32%\\nslookup.exe;%system32%\\rpcping.exe;%system32%\\stordiag.exe;%programfiles%\\google\\chrome\\application\\chrome.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\mozilla firefox\\firefox.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe;%appdata%\\zoom\\bin\\zoom.exe;%programfiles%\\windowsapps\\microsoftteams%version%\\msteams.exe;%programfiles%\\microsoft\\edgewebview\\application\\%version%\\msedgewebview2.exe;%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\onenote.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\scanpst.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\sdxhelper.exe"}
  l_45_4 = "mswb7.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\control.exe;%system32%\\explorer.exe"}
  l_45_4 = "msvcr100.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%programfiles%\\java\\jre%version%\\bin\\javacpl.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe"}
  l_45_4 = "msvcp110_win.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\agentactivationruntimestarter.exe;%system32%\\appidpolicyconverter.exe;%system32%\\dmcertinst.exe;%system32%\\dmomacpmo.exe;%system32%\\locationnotificationwindows.exe;%system32%\\mdmagent.exe;%system32%\\mdmappinstaller.exe;%system32%\\omadmclient.exe;%system32%\\provlaunch.exe;%system32%\\provtool.exe;%system32%\\windowsactiondialog.exe"}
  l_45_4 = "msutb.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ctfmon.exe"}
  l_45_4 = "mstracer.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "msiso.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\browserexport.exe"}
  l_45_4 = "msi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dxpserver.exe;%system32%\\fondue.exe;%system32%\\mdmappinstaller.exe;%system32%\\msiexec.exe;%system32%\\optionalfeatures.exe;%system32%\\packageinspector.exe"}
  l_45_4 = "msftedit.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\charmap.exe;%system32%\\mspaint.exe;%system32%\\searchindexer.exe;%system32%\\searchprotocolhost.exe"}
  l_45_4 = "msedgeupdate.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\microsoft\\edgeupdate\\%version%;%programfiles%\\microsoft\\temp\\%version%", VulnerableApps = "%programfiles%\\microsoft\\edgeupdate\\microsoftedgeupdate.exe"}
  l_45_4 = "msdtctm.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\msdtc.exe"}
  l_45_4 = "msdrm.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\gamepanel.exe;%system32%\\psr.exe;%system32%\\rmactivate.exe;%system32%\\rmactivate_isv.exe;%system32%\\snippingtool.exe"}
  l_45_4 = "msctfmonitor.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\credwiz.exe;%system32%\\ctfmon.exe"}
  l_45_4 = "msctf.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\conhost.exe;%system32%\\filehistory.exe;%system32%\\mstsc.exe;%system32%\\wordpad.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe;%programfiles%\\microsoft\\edgewebview\\application\\%version%\\msedgewebview2.exe;%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe"}
  l_45_4 = "mscorsvc.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%windir%\\microsoft.net\\framework\\v%version%;%windir%\\microsoft.net\\framework64\\v%version%", VulnerableApps = "%windir%\\microsoft.net\\framework\\v%version%\\mscorsvw.exe;%windir%\\winsxs\\amd64_netfx4-ngentask_exe_%version%\\ngentask.exe"}
  l_45_4 = "mscoree.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\aitstatic.exe;%system32%\\presentationhost.exe;%windir%\\microsoft.net\\framework\\v%version%\\applaunch.exe"}
  l_45_4 = "mscms.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\colorcpl.exe;%system32%\\dccw.exe"}
  l_45_4 = "msasn1.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "winbox64.exe;winbox.exe"}
  l_45_4 = "msacm32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\osk.exe"}
  l_45_4 = "mrmcorer.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mcbuilder.exe"}
  l_45_4 = "mpsvc.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programdata%\\microsoft\\windows defender\\platform\\%version%", VulnerableApps = "%programdata%\\microsoft\\windows defender\\platform\\%version%\\msmpeng.exe"}
  l_45_4 = "mprapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\rasautou.exe"}
  l_45_4 = "mpr.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootcfg.exe;%system32%\\dcdiag.exe;%system32%\\dfsrdiag.exe;%system32%\\driverquery.exe;%system32%\\dsmgmt.exe;%system32%\\eventcreate.exe;%system32%\\getmac.exe;%system32%\\gpresult.exe;%system32%\\iesettingsync.exe;%system32%\\net.exe;%system32%\\ntdsutil.exe;%system32%\\openfiles.exe;%system32%\\pnpunattend.exe;%system32%\\rdpclip.exe;%system32%\\rekeywiz.exe;%system32%\\repadmin.exe;%system32%\\sdclt.exe;%system32%\\setupugc.exe;%system32%\\systeminfo.exe;%system32%\\taskkill.exe;%system32%\\waitfor.exe;%system32%\\filehistory.exe"}
  l_45_4 = "mpclient.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\windows defender;%programdata%\\microsoft\\windows defender\\platform\\%version%", VulnerableApps = "%programfiles%\\windows defender\\mpcmdrun.exe;%programfiles%\\windows defender\\nissrv.exe"}
  l_45_4 = "mobilenetworking.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mbaeparsertask.exe;%system32%\\netsh.exe"}
  l_45_4 = "mmdevapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\audiodg.exe;%system32%\\osk.exe;%system32%\\certreq.exe;%system32%\\devicecensus.exe;%system32%\\mblctr.exe;%system32%\\notepad.exe;%system32%\\presentationsettings.exe;%system32%\\sndvol.exe"}
  l_45_4 = "mlang.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\calc.exe;%system32%\\computerdefaults.exe;%system32%\\fodhelper.exe;%system32%\\ie4uinit.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe"}
  l_45_4 = "miutils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\register-cimprovider.exe;%system32%\\winrs.exe;%system32%\\wsmanhttpconfig.exe;%system32%\\wsmprovhost.exe"}
  l_45_4 = "mintdh.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\applytrustoffline.exe;%system32%\\netsh.exe;%system32%\\pktmon.exe;%system32%\\plasrv.exe"}
  l_45_4 = "midimap.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\osk.exe"}
  l_45_4 = "microsoft.ui.xaml.xamltypeinfo.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "mi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\winrs.exe;%system32%\\wsmanhttpconfig.exe;%system32%\\wsmprovhost.exe"}
  l_45_4 = "mfplat.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mdeserver.exe;%system32%\\mfpmp.exe"}
  l_45_4 = "mfcore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mfpmp.exe"}
  l_45_4 = "mfc42u.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\devicepairingwizard.exe;%system32%\\dirquota.exe;%system32%\\eudcedit.exe;%system32%\\filescrn.exe;%system32%\\ldp.exe;%system32%\\msconfig.exe;%system32%\\msinfo32.exe;%system32%\\mspaint.exe;%system32%\\nlbmgr.exe;%system32%\\shrpubw.exe;%system32%\\storrept.exe;%system32%\\verifiergui.exe;%system32%\\wfs.exe"}
  l_45_4 = "mdmdiagnostics.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\mdmdiagnosticstool.exe"}
  l_45_4 = "mbaexmlparser.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\mbaeparsertask.exe"}
  l_45_4 = "mapistub.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\fixmapi.exe"}
  l_45_4 = "maintenanceui.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\mschedexe.exe"}
  l_45_4 = "magnification.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\magnify.exe"}
  l_45_4 = "lrwizdll.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\licmgr.exe"}
  l_45_4 = "lpksetupproxyserv.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\lpksetup.exe"}
  l_45_4 = "logoncontroller.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\logonui.exe"}
  l_45_4 = "logoncli.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certutil.exe;%system32%\\change.exe;%system32%\\chglogon.exe;%system32%\\chgport.exe;%system32%\\csvde.exe;%system32%\\devicecensus.exe;%system32%\\djoin.exe;%system32%\\dsacls.exe;%system32%\\dsmgmt.exe;%system32%\\dsregcmd.exe;%system32%\\efsui.exe;%system32%\\gpfixup.exe;%system32%\\gpresult.exe;%system32%\\klist.exe;%system32%\\ksetup.exe;%system32%\\ldifde.exe;%system32%\\net1.exe;%system32%\\nltest.exe;%system32%\\netdom.exe;%system32%\\ntdsutil.exe;%system32%\\query.exe;%system32%\\quser.exe;%system32%\\qwinsta.exe;%system32%\\redircmp.exe;%system32%\\redirusr.exe;%system32%\\rekeywiz.exe;%system32%\\rendom.exe;%system32%\\repadmin.exe;%system32%\\reset.exe;%system32%\\rwinsta.exe;%system32%\\setspn.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\tscon.exe;%system32%\\tskill.exe;%system32%\\w32tm.exe"}
  l_45_4 = "lockhostingframework.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\lockapphost.exe"}
  l_45_4 = "loadperf.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\unlodctr.exe"}
  l_45_4 = "linkinfo.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe"}
  l_45_4 = "licensingdiagspp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\licensingdiag.exe;by changing %windir%"}
  l_45_4 = "licensemanagerapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\wsreset.exe"}
  l_45_4 = "ktmw32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ktmutil.exe;%system32%\\msdtc.exe;%system32%\\mstsc.exe;%system32%\\netsh.exe;%system32%\\rstrui.exe;%system32%\\srtasks.exe;%system32%\\wkspbroker.exe"}
  l_45_4 = "ksuser.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mfpmp.exe;%system32%\\osk.exe"}
  l_45_4 = "kdstub.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\hvax64.exe;%system32%\\hvix64.exe"}
  l_45_4 = "joinutil.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\djoin.exe"}
  l_45_4 = "iumsdk.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\bioiso.exe;%system32%\\fsiso.exe;%system32%\\ngciso.exe"}
  l_45_4 = "iumbase.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\bioiso.exe;%system32%\\fsiso.exe;%system32%\\ngciso.exe"}
  l_45_4 = "isv.exe_rsaenh.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\rmactivate"}
  l_45_4 = "iscsium.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\iscsicli.exe"}
  l_45_4 = "iscsiexe.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\iscsicpl.exe"}
  l_45_4 = "iscsidsc.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\iscsicli.exe"}
  l_45_4 = "iri.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\deviceenroller.exe;%system32%\\dmcertinst.exe;%system32%\\dmcfghost.exe;%system32%\\dmomacpmo.exe;%system32%\\hvsievaluator.exe;%system32%\\mdmappinstaller.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\omadmclient.exe;%system32%\\usocoreworker.exe"}
  l_45_4 = "iphlpapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\arp.exe;%system32%\\colorcpl.exe;%system32%\\datausagelivetiletask.exe;%system32%\\dcdiag.exe;%system32%\\devicecensus.exe;%system32%\\dnscacheugc.exe;%system32%\\fxscover.exe;%system32%\\fxssvc.exe;%system32%\\fxsunatd.exe;%system32%\\ipconfig.exe;%system32%\\mousocoreworker.exe;%system32%\\msra.exe;%system32%\\mstsc.exe;%system32%\\nbtstat.exe;%system32%\\net.exe;%system32%\\netbtugc.exe;%system32%\\netiougc.exe;%system32%\\netsh.exe;%system32%\\netstat.exe;%system32%\\omadmclient.exe;%system32%\\pathping.exe;%system32%\\printbrmui.exe;%system32%\\printui.exe;%system32%\\rdpclip.exe;%system32%\\route.exe;%system32%\\tracert.exe;%system32%\\w32tm.exe;%system32%\\wfs.exe;%system32%\\wifitask.exe;%system32%\\wpnpinst.exe;%programfiles%\\minecraft launcher\\minecraftlauncher.exe;%programfiles%\\microsoft deployment toolkit\\bin\\microsoft.bdd.catalog35.exe;%localappdata%\\microsoft\\onedrive\\onedrive.exe;%localappdata%\\microsoft\\onedrive\\onedrivestandaloneupdater.exe;%localappdata%\\microsoft\\teams\\current\\teams.exe;%system32%\\dpiscaling.exe;%system32%\\rasphone.exe;%system32%\\slui.exe"}
  l_45_4 = "inproclogger.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\easpolicymanagerbrokerhost.exe"}
  l_45_4 = "ifsutil.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\convert.exe;%system32%\\fsavailux.exe;%system32%\\label.exe;%system32%\\recover.exe;%system32%\\xcopy.exe"}
  l_45_4 = "ifmon.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "iertutil.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\browserexport.exe;%system32%\\cipher.exe;%system32%\\iesettingsync.exe;%system32%\\launchwinapp.exe;%system32%\\microsoftedgebchost.exe;%system32%\\microsoftedgecp.exe;%system32%\\microsoftedgedevtools.exe;%system32%\\microsoftedgesh.exe;%system32%\\wwahost.exe"}
  l_45_4 = "iernonce.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%syswow64%\\runonce.exe"}
  l_45_4 = "iedkcs32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ie4uinit.exe"}
  l_45_4 = "ieadvpack.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ie4uinit.exe"}
  l_45_4 = "idstore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\devicecensus.exe;%system32%\\shellappruntime.exe"}
  l_45_4 = "icmp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\nlbmgr.exe"}
  l_45_4 = "httpapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe;%system32%\\wifitask.exe;%system32%\\wsmanhttpconfig.exe"}
  l_45_4 = "hnetmon.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "hid.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\psr.exe;%system32%\\tabcal.exe;%programfiles%\\logitech\\setpointp\\ldevice"}
  l_45_4 = "gpapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\gpapi.exe"}
  l_45_4 = "getuname.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\charmap.exe"}
  l_45_4 = "fxstiff.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%system32%\\driverstore\\filerepository\\prnms002.inf_%version%\\amd64", VulnerableApps = "%system32%\\fxssvc.exe"}
  l_45_4 = "fxsst.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%windir%\\explorer.exe"}
  l_45_4 = "fxsapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%system32%\\driverstore\\filerepository\\prnms002.inf_%version%\\amd64;%syswow64%", VulnerableApps = "%system32%\\fxsunatd.exe"}
  l_45_4 = "fwpuclnt.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\checknetisolation.exe;%system32%\\netsh.exe;%system32%\\stordiag.exe"}
  l_45_4 = "fwpolicyiomgr.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "fwcfg.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "fwbase.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\checknetisolation.exe;%system32%\\edpcleanup.exe;%system32%\\lpremove.exe;%system32%\\netsh.exe;%system32%\\securityhealthservice.exe;%system32%\\systemsettingsadminflows.exe"}
  l_45_4 = "fvewiz.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\bitlockerwizard.exe;%system32%\\bitlockerwizardelev.exe"}
  l_45_4 = "fveskybackup.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\bitlockerdeviceencryption.exe"}
  l_45_4 = "fveapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\baaupdate.exe;%system32%\\bdechangepin.exe;%system32%\\fvenotify.exe;%system32%\\fveprompt.exe;%system32%\\resetengine.exe;%system32%\\systemreset.exe"}
  l_45_4 = "framedynos.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dfsrdiag.exe;%system32%\\driverquery.exe;%system32%\\getmac.exe;%system32%\\openfiles.exe;%system32%\\taskkill.exe"}
  l_45_4 = "fltlib.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\agentservice.exe;%system32%\\bootim.exe;%system32%\\compmgmtlauncher.exe;%system32%\\dpiscaling.exe;%system32%\\dfsrdiag.exe;%system32%\\fltmc.exe;%system32%\\psr.exe;%system32%\\resmon.exe;%system32%\\sdclt.exe;%system32%\\slui.exe;%system32%\\vssvc.exe;%system32%\\wbengine.exe;%system32%\\workfolders.exe;%system32%\\write.exe"}
  l_45_4 = "flightsettings.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\devicecensus.exe"}
  l_45_4 = "firewallapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\checknetisolation.exe;%system32%\\edpcleanup.exe;%system32%\\lpremove.exe;%system32%\\netsh.exe;%system32%\\securityhealthservice.exe;%system32%\\systemsettingsadminflows.exe"}
  l_45_4 = "fhsvcctl.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\fhmanagew.exe"}
  l_45_4 = "fhcfg.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\filehistory.exe"}
  l_45_4 = "feclient.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cipher.exe;%system32%\\efsui.exe;%system32%\\rekeywiz.exe"}
  l_45_4 = "fddevquery.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ddodiag.exe"}
  l_45_4 = "faultrep.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\werfault.exe;%system32%\\werfaultsecure.exe"}
  l_45_4 = "fastprox.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%\\wbem;%syswow64%\\wbem", VulnerableApps = "%system32%\\cttune.exe;%system32%\\devicecensus.exe;%system32%\\driverquery.exe;%system32%\\getmac.exe;%system32%\\licensingdiag.exe;%system32%\\msinfo32.exe;%system32%\\stordiag.exe;%system32%\\systeminfo.exe;%system32%\\tasklist.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\microsoft office\\root\\office%version%\\excelcnv.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\msaccess.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\onenote.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\outlook.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\scanpst.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\winword.exe"}
  l_45_4 = "explorerframe.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\control.exe;%system32%\\explorer.exe;%system32%\\filehistory.exe;%system32%\\mstsc.exe;%system32%\\notepad.exe;%programfiles%\\google\\chrome\\application\\chrome.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\mozilla firefox\\firefox.exe;%programfiles%\\microsoft office\\root\\office%version%\\winword.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe"}
  l_45_4 = "execmodelproxy.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\calc.exe"}
  l_45_4 = "esent.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dfsrdiag.exe;%system32%\\dsdbutil.exe;%system32%\\esentutl.exe;%system32%\\tieringengineservice.exe;%system32%\\ntdsutil.exe"}
  l_45_4 = "efsutil.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cipher.exe;%system32%\\efsui.exe;%system32%\\rekeywiz.exe;%system32%\\filehistory.exe"}
  l_45_4 = "efsadu.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\efsui.exe;%system32%\\rekeywiz.exe"}
  l_45_4 = "edputil.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\calc.exe;%system32%\\compmgmtlauncher.exe;%system32%\\computerdefaults.exe;%system32%\\dpiscaling.exe;%system32%\\fodhelper.exe;%system32%\\mobsync.exe;%system32%\\resmon.exe;%system32%\\sdclt.exe;%system32%\\slui.exe;%system32%\\workfolders.exe;%system32%\\write.exe"}
  l_45_4 = "edgeiso.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\microsoftedgebchost.exe;%system32%\\microsoftedgecp.exe;%system32%\\microsoftedgedevtools.exe;%system32%\\microsoftedgesh.exe"}
  l_45_4 = "eappprxy.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "eappcfg.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe;%system32%\\rasphone.exe"}
  l_45_4 = "dynamoapi.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\mdmdiagnosticstool.exe"}
  l_45_4 = "dxva2.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dccw.exe;%system32%\\dispdiag.exe"}
  l_45_4 = "dxgi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\applicationframehost.exe;%system32%\\dataexchangehost.exe;%system32%\\dwm.exe;%system32%\\dxgiadaptercache.exe;%system32%\\gamepanel.exe;%system32%\\mdeserver.exe;%system32%\\quickassist.exe;%system32%\\systemreset.exe;%system32%\\taskmgr.exe;%system32%\\vsgraphicsremoteengine.exe;%system32%\\winsat.exe"}
  l_45_4 = "dxcore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\taskmgr.exe"}
  l_45_4 = "dwrite.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cttune.exe;%system32%\\dataexchangehost.exe;%system32%\\gamepanel.exe"}
  l_45_4 = "dwmcore.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\dwm.exe"}
  l_45_4 = "dwmapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\devicepairingwizard.exe;%system32%\\displayswitch.exe;%system32%\\dxpserver.exe;%system32%\\fsquirt.exe;%system32%\\gamepanel.exe;%system32%\\lockscreencontentserver.exe;%system32%\\mblctr.exe;%system32%\\osk.exe;%system32%\\proximityuxhost.exe;%system32%\\rdpclip.exe;%system32%\\rdpshell.exe;%system32%\\rdvghelper.exe;%system32%\\sndvol.exe;%system32%\\snippingtool.exe;%system32%\\wmpdmc.exe"}
  l_45_4 = "dusmapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\datausagelivetiletask.exe"}
  l_45_4 = "duser.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bdeunlock.exe;%system32%\\displayswitch.exe;%system32%\\easeofaccessdialog.exe;%system32%\\lockscreencontentserver.exe;%system32%\\mmc.exe;%system32%\\msdt.exe;%system32%\\osk.exe;%system32%\\rekeywiz.exe;%system32%\\sessionmsg.exe;%system32%\\taskmgr.exe;%system32%\\utilman.exe"}
  l_45_4 = "dui70.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bdeunlock.exe;%system32%\\camerasettings.exe;%system32%\\certreq.exe;%system32%\\dmnotificationbroker.exe;%system32%\\dpapimig.exe;%system32%\\licensingui.exe;%system32%\\optionalfeatures.exe;%system32%\\osk.exe;%system32%\\passwordonwakesettingflyout.exe;%system32%\\phoneactivate.exe;%system32%\\proximityuxhost.exe;%system32%\\sessionmsg.exe;%system32%\\sethc.exe;%system32%\\sysreseterr.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\systemsettingsremovedevice.exe;%system32%\\utilman.exe;%system32%\\windowsactiondialog.exe;%system32%\\wlrmdr.exe;%system32%\\rasphone.exe"}
  l_45_4 = "dsrole.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certutil.exe;%system32%\\cipher.exe;%system32%\\csvde.exe;%system32%\\dcdiag.exe;%system32%\\dsdbutil.exe;%system32%\\efsui.exe;%system32%\\gpfixup.exe;%system32%\\net1.exe;%system32%\\netdom.exe;%system32%\\netplwiz.exe;%system32%\\ntdsutil.exe;%system32%\\rekeywiz.exe;%system32%\\repadmin.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\winrs.exe;%system32%\\wsmanhttpconfig.exe;%system32%\\wsmprovhost.exe;%system32%\\filehistory.exe"}
  l_45_4 = "dsreg.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bitlockerdeviceencryption.exe;%system32%\\dsregcmd.exe"}
  l_45_4 = "dsprop.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dsquery.exe"}
  l_45_4 = "dsparse.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dcdiag.exe;%system32%\\dfsrdiag.exe;%system32%\\dmcertinst.exe;%system32%\\netdom.exe;%system32%\\rendom.exe"}
  l_45_4 = "dsclient.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dmcfghost.exe;%system32%\\dmomacpmo.exe;%system32%\\dstokenclean.exe"}
  l_45_4 = "drvstore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\infdefaultinstall.exe;%system32%\\securityhealthservice.exe;hvciscan_amd64.exe"}
  l_45_4 = "drprov.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\msdt.exe;%system32%\\notepad.exe;%system32%\\powershell.exe;%system32%\\stordiag.exe;%system32%\\tabcal.exe;%system32%\\verifier.exe;%system32%\\workfolders.exe;%system32%\\write.exe"}
  l_45_4 = "dpx.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\lpksetup.exe;%system32%\\wusa.exe"}
  l_45_4 = "dot3cfg.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "dot3api.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "dnsapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\checknetisolation.exe;%system32%\\dcdiag.exe;%system32%\\dnscmd.exe;%system32%\\edpcleanup.exe;%system32%\\ipconfig.exe;%system32%\\lpremove.exe;%system32%\\msdtc.exe;%system32%\\netdom.exe;%system32%\\netsh.exe;%system32%\\nslookup.exe;%system32%\\rendom.exe;%system32%\\repadmin.exe;%system32%\\securityhealthservice.exe;%system32%\\setupugc.exe;%system32%\\sihclient.exe;%system32%\\spoolsv.exe;%system32%\\sppextcomobj.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\tieringengineservice.exe;%system32%\\wbengine.exe;%system32%\\wkspbroker.exe"}
  l_45_4 = "dmxmlhelputils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dmcfghost.exe;%system32%\\omadmclient.exe"}
  l_45_4 = "dmpushproxy.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dmcfghost.exe;%system32%\\omadmrpc.exe"}
  l_45_4 = "dmprocessxmlfiltered.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dmomacpmo.exe"}
  l_45_4 = "dmoleaututils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\omadmclient.exe;%system32%\\usocoreworker.exe"}
  l_45_4 = "dmiso8601utils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mdmdiagnosticstool.exe;%system32%\\mousocoreworker.exe;%system32%\\omadmclient.exe;%system32%\\usocoreworker.exe"}
  l_45_4 = "dmenterprisediagnostics.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\deviceenroller.exe;%system32%\\omadmclient.exe"}
  l_45_4 = "dmenrollengine.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\deviceenroller.exe;%system32%\\dmomacpmo.exe;%system32%\\mdmagent.exe;%system32%\\mdmappinstaller.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\omadmclient.exe;%system32%\\workfolders.exe"}
  l_45_4 = "dmcommandlineutils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\provtool.exe"}
  l_45_4 = "dmcmnutils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\deviceenroller.exe;%system32%\\dmcertinst.exe;%system32%\\dmcfghost.exe;%system32%\\dmnotificationbroker.exe;%system32%\\dmomacpmo.exe;%system32%\\edpcleanup.exe;%system32%\\hvsievaluator.exe;%system32%\\mdmappinstaller.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\mousocoreworker.exe;%system32%\\musnotificationux.exe;%system32%\\musnotifyicon.exe;%system32%\\omadmclient.exe;%system32%\\upgraderesultsui.exe;%system32%\\usocoreworker.exe"}
  l_45_4 = "dmcfgutils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\omadmclient.exe"}
  l_45_4 = "dismcore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%\\dism;%syswow64%\\dism", VulnerableApps = "%system32%\\dism.exe"}
  l_45_4 = "dismapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\deploymentcsphelper.exe;%system32%\\directxdatabaseupdater.exe;%system32%\\hvsievaluator.exe;%system32%\\resetengine.exe;%system32%\\systemreset.exe;%system32%\\systemsettingsadminflows.exe"}
  l_45_4 = "directmanipulation.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;%programfiles%\\microsoft office\\root\\office%version%\\excelcnv.exe"}
  l_45_4 = "dhcpcsvc6.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ipconfig.exe;%system32%\\netsh.exe"}
  l_45_4 = "dhcpcsvc.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\ipconfig.exe;%system32%\\netiougc.exe;%system32%\\netsh.exe"}
  l_45_4 = "dhcpcmonitor.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "devrtl.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\drvinst.exe;%system32%\\pnpunattend.exe;%system32%\\systemsettingsadminflows.exe;%system32%\\wowreg32.exe"}
  l_45_4 = "devobj.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bthudtask.exe;%system32%\\chkdsk.exe;%system32%\\chkntfs.exe;%system32%\\deviceenroller.exe;%system32%\\dispdiag.exe;%system32%\\dmomacpmo.exe;%system32%\\drvinst.exe;%system32%\\fsavailux.exe;%system32%\\fsquirt.exe;%system32%\\immersivetpmvscmgrsvr.exe;%system32%\\iscsicli.exe;%system32%\\label.exe;%system32%\\mdmappinstaller.exe;%system32%\\mdmdiagnosticstool.exe;%system32%\\omadmclient.exe;%system32%\\osk.exe;%system32%\\pnputil.exe;%system32%\\rdpclip.exe;%system32%\\recover.exe;%system32%\\rmttpmvscmgrsvr.exe;%system32%\\tabcal.exe;%system32%\\vsgraphicsdesktopengine.exe;%system32%\\vssvc.exe;%system32%\\workfolders.exe"}
  l_45_4 = "devicepairing.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\devicepairingwizard.exe"}
  l_45_4 = "devicecredential.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\devicecredentialdeployment.exe"}
  l_45_4 = "deviceassociation.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\eduprintprov.exe;%system32%\\proximityuxhost.exe"}
  l_45_4 = "desktopshellext.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\sihost.exe"}
  l_45_4 = "defragproxy.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dfrgui.exe"}
  l_45_4 = "dcomp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dataexchangehost.exe;%system32%\\gamepanel.exe;%system32%\\quickassist.exe"}
  l_45_4 = "dcntel.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\devicecensus.exe"}
  l_45_4 = "dbgmodel.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%;%programfiles%\\windows kits\\10\\debuggers\\%version%", VulnerableApps = "%programfiles%\\windows kits\\10\\debuggers\\%version%\\ntsd.exe"}
  l_45_4 = "dbghelp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\windows kits\\10\\debuggers\\arm;%programfiles%\\windows kits\\10\\debuggers\\arm\\srcsrv;%programfiles%\\windows kits\\10\\debuggers\\arm64;%programfiles%\\windows kits\\10\\debuggers\\arm64\\srcsrv;%programfiles%\\windows kits\\10\\debuggers\\x64;%programfiles%\\windows kits\\10\\debuggers\\x64\\srcsrv;%programfiles%\\windows kits\\10\\debuggers\\x86;%programfiles%\\windows kits\\10\\debuggers\\x86\\srcsrv;%programfiles%\\cisco systems\\cisco jabber;%programfiles%\\microsoft office\\root\\office%version%;%programfiles%\\microsoft office\\root\\vfs\\programfilesx86\\microsoft analysis services\\as oledb\\140;%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\dxcap.exe;%system32%\\taskkill.exe;%system32%\\tasklist.exe;%system32%\\tracerpt.exe;%system32%\\werfault.exe;%system32%\\bdehdcfg.exe;by changing %windir%;%system32%\\deploymentcsphelper.exe;by changing %windir%;%system32%\\djoin.exe;by changing %windir%;%system32%\\dnscacheugc.exe;by changing %windir%;%system32%\\ieunatt.exe;by changing %windir%;%system32%\\muiunattend.exe;by changing %windir%;%system32%\\netbtugc.exe;by changing %windir%;%system32%\\netiougc.exe;by changing %windir%;%system32%\\pnpunattend.exe;by changing %windir%;%system32%\\reagentc.exe;by changing %windir%;%system32%\\setupugc.exe;by changing %windir%"}
  l_45_4 = "dbgcore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\windows kits\\10\\debuggers\\arm;%programfiles%\\windows kits\\10\\debuggers\\arm\\srcsrv;%programfiles%\\windows kits\\10\\debuggers\\arm64;%programfiles%\\windows kits\\10\\debuggers\\arm64\\srcsrv;%programfiles%\\windows kits\\10\\debuggers\\x64;%programfiles%\\windows kits\\10\\debuggers\\x64\\srcsrv;%programfiles%\\windows kits\\10\\debuggers\\x86;%programfiles%\\windows kits\\10\\debuggers\\x86\\srcsrv;%programfiles%\\microsoft office\\root\\office%version%;%system32%;%syswow64%", VulnerableApps = "%system32%\\deploymentcsphelper.exe;%system32%\\djoin.exe;%system32%\\dnscacheugc.exe;%system32%\\ieunatt.exe;%system32%\\muiunattend.exe;%system32%\\netbtugc.exe;%system32%\\netiougc.exe;%system32%\\pnpunattend.exe;%system32%\\setupugc.exe;%system32%\\systemreset.exe;%system32%\\werfault.exe;%system32%\\werfaultsecure.exe"}
  l_45_4 = "davclnt.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\msdt.exe;%system32%\\notepad.exe;%system32%\\powershell.exe;%system32%\\stordiag.exe;%system32%\\tabcal.exe;%system32%\\verifier.exe;%system32%\\workfolders.exe;%system32%\\write.exe"}
  l_45_4 = "dataexchange.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\charmap.exe;%system32%\\notepad.exe;%system32%\\wordpad.exe;%programfiles%\\google\\chrome\\application\\chrome.exe;%programfiles%\\microsoft\\edge\\application\\msedge.exe;%programfiles%\\mozilla firefox\\firefox.exe;%programfiles%\\microsoft office\\root\\office%version%\\powerpnt.exe;%programfiles%\\microsoft\\edgewebview\\application\\%version%\\msedgewebview2.exe;%programfiles%\\microsoft office\\root\\office%version%\\excel.exe;preconditions%programfiles%\\microsoft office\\root\\office%version%\\mspub.exe"}
  l_45_4 = "d3dx9_43.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%localappdata%\\temp\\hpdiags\\0699814c-9c5f-46ad-8c9d-a1c61a163f2b\\d3dim9.exe"}
  l_45_4 = "d3dcompiler_47.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\windows kits\\10\\bin\\%version%\\x64;%programfiles%\\windows kits\\10\\bin\\%version%\\x86;%programfiles%\\windows kits\\10\\redist\\d3d\\x64;%programfiles%\\windows kits\\10\\redist\\d3d\\x86%programfiles%\\wireshark;%programfiles%\\logioptionsplus;%programfiles%\\cisco systems\\cisco jabber;%programfiles%\\microsoft\\edge\\application\\%version%;%programfiles%\\microsoft\\edgewebview\\application\\%version%;%programfiles%\\microsoft\\edgecore\\application\\%version%;%programfiles%\\google\\chrome\\application\\%version%;%programfiles%\\island\\island\\application\\%version%;%programfiles%\\zoom\\bin;%appdata%\\zoom\\bin;%localappdata%\\microsoft\\teams\\stage;%localappdata%\\programs\\microsoft vs code;%system32%;%syswow64%", VulnerableApps = "%system32%\\dwm.exe"}
  l_45_4 = "d3d9.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\magnify.exe"}
  l_45_4 = "d3d12.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dxgiadaptercache.exe;%system32%\\taskmgr.exe"}
  l_45_4 = "d3d11.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dataexchangehost.exe;%system32%\\dwm.exe;%system32%\\dxcap.exe;%system32%\\dxgiadaptercache.exe;%system32%\\gamepanel.exe;%system32%\\mdeserver.exe;%system32%\\quickassist.exe;%system32%\\systemreset.exe;%system32%\\taskmgr.exe;%system32%\\vsgraphicsdesktopengine.exe;%system32%\\vsgraphicsremoteengine.exe;%system32%\\winsat.exe;%programfiles%\\steam\\steamapps\\common\\wallpaper_engine\\wallpaper32.exe"}
  l_45_4 = "d3d10warp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\slidetoshutdown.exe;%system32%\\systemreset.exe"}
  l_45_4 = "d3d10core.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\winsat.exe"}
  l_45_4 = "d3d10_1core.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\winsat.exe"}
  l_45_4 = "d3d10_1.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\winsat.exe"}
  l_45_4 = "d3d10.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\winsat.exe"}
  l_45_4 = "d2d1.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dataexchangehost.exe;%system32%\\dwm.exe;%system32%\\eoaexperiences.exe;%system32%\\gamepanel.exe;%system32%\\quickassist.exe;%system32%\\vsgraphicsdesktopengine.exe;%system32%\\vsgraphicsremoteengine.exe"}
  l_45_4 = "cscui.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\compmgmtlauncher.exe;%system32%\\explorer.exe;%system32%\\notepad.exe"}
  l_45_4 = "cscobj.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\compmgmtlauncher.exe;%system32%\\notepad.exe"}
  l_45_4 = "cscapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\microsoft.uev.cscunpintool.exe"}
  l_45_4 = "cryptxml.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\clipup.exe;%system32%\\sppsvc.exe"}
  l_45_4 = "cryptui.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certutil.exe;%system32%\\efsui.exe;%system32%\\mstsc.exe;%system32%\\rekeywiz.exe"}
  l_45_4 = "cryptsp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bcdedit.exe;%system32%\\disksnapshot.exe;%system32%\\genvalobj.exe;%system32%\\omadmclient.exe;%system32%\\rmactivate.exe;%system32%\\rmactivate_isv.exe;%system32%\\rmactivate_ssp.exe;%system32%\\rmactivate_ssp_isv.exe;%system32%\\werfault.exe"}
  l_45_4 = "cryptnet.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%programfiles%\\microsoft deployment toolkit\\bin\\microsoft.bdd.catalog35.exe"}
  l_45_4 = "cryptdll.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\at.exe;%system32%\\netdom.exe"}
  l_45_4 = "cryptbase.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\alg.exe;%system32%\\calc.exe;%system32%\\compmgmtlauncher.exe;%system32%\\computerdefaults.exe;%system32%\\disksnapshot.exe;%system32%\\dpiscaling.exe;%system32%\\efsui.exe;%system32%\\filehistory.exe;%system32%\\fodhelper.exe;%system32%\\ie4uinit.exe;%system32%\\lpksetup.exe;%system32%\\mfpmp.exe;%system32%\\mshta.exe;%system32%\\mstsc.exe;%system32%\\net1.exe;%system32%\\netplwiz.exe;%system32%\\netsh.exe;%system32%\\presentationhost.exe;%system32%\\quickassist.exe;%system32%\\rdpclip.exe;%system32%\\rekeywiz.exe;%system32%\\resmon.exe;%system32%\\rmactivate.exe;%system32%\\rmactivate_ssp_isv.exe;%system32%\\sdclt.exe;%system32%\\slui.exe;%system32%\\sppextcomobj.exe;%system32%\\stordiag.exe;%system32%\\tzsync.exe;%system32%\\uevappmonitor.exe;%system32%\\useraccountcontrolsettings.exe;%system32%\\workfolders.exe;%system32%\\write.exe;%system32%\\wscadminui.exe;%programfiles%\\minecraft launcher\\minecraftlauncher.exe;%programfiles%\\microsoft deployment toolkit\\bin\\microsoft.bdd.catalog35.exe;winbox64.exe"}
  l_45_4 = "credui.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\efsui.exe;%system32%\\fxssvc.exe;%system32%\\gpfixup.exe;%system32%\\licmgr.exe;%system32%\\mstsc.exe;%system32%\\netdom.exe;%system32%\\nlbmgr.exe;%system32%\\perfmon.exe;%system32%\\rekeywiz.exe;%system32%\\rpcping.exe;%system32%\\runas.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\taskmgr.exe;%system32%\\wbadmin.exe;%system32%\\wfs.exe;%system32%\\wkspbroker.exe;%system32%\\rasphone.exe"}
  l_45_4 = "coreuicomponents.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dwm.exe"}
  l_45_4 = "coremessaging.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dwm.exe;%system32%\\sihost.exe"}
  l_45_4 = "coredplus.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\omadmclient.exe"}
  l_45_4 = "connect.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\rasphone.exe"}
  l_45_4 = "configmanager2.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\hvsievaluator.exe"}
  l_45_4 = "comdlg32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\notepad.exe"}
  l_45_4 = "colorui.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\colorcpl.exe"}
  l_45_4 = "coloradapterclient.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\colorcpl.exe;%system32%\\dccw.exe"}
  l_45_4 = "cmutil.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cmstp.exe"}
  l_45_4 = "cmpbk32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\cmdl32.exe"}
  l_45_4 = "clusapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dfsrdiag.exe;%system32%\\msdtc.exe;%system32%\\tieringengineservice.exe;%system32%\\wbengine.exe"}
  l_45_4 = "clipc.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\licensingdiag.exe"}
  l_45_4 = "cldapi.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\compmgmtlauncher.exe;%system32%\\dpiscaling.exe;%system32%\\psr.exe;%system32%\\resmon.exe;%system32%\\sdclt.exe;%system32%\\slui.exe;%system32%\\workfolders.exe;%system32%\\write.exe"}
  l_45_4 = "cfgmgr32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\write.exe"}
  l_45_4 = "certenroll.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certenrollctrl.exe;%system32%\\dmcertinst.exe"}
  l_45_4 = "certcli.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\certreq.exe;%system32%\\certutil.exe;%system32%\\repadmin.exe"}
  l_45_4 = "cdpsgshims.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "cabview.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\notepad.exe"}
  l_45_4 = "cabinet.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\certutil.exe;%system32%\\cmdl32.exe;%system32%\\expand.exe;%system32%\\extrac32.exe;%system32%\\iesettingsync.exe;%system32%\\licensingdiag.exe;%system32%\\makecab.exe;%system32%\\msdt.exe;%system32%\\musnotification.exe;%system32%\\musnotificationux.exe;%system32%\\netsh.exe;%system32%\\plasrv.exe;%system32%\\pnputil.exe;%system32%\\reagentc.exe;%system32%\\recdisc.exe;%system32%\\relpost.exe;%system32%\\resetengine.exe;%system32%\\sdclt.exe;%system32%\\sihclient.exe;%system32%\\systemreset.exe;%system32%\\usocoreworker.exe;%system32%\\wextract.exe;%system32%\\wimserv.exe;%system32%\\wpnpinst.exe;%system32%\\logman.exe"}
  l_45_4 = "bootux.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\bootim.exe"}
  l_45_4 = "bootmenuux.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\bootim.exe"}
  l_45_4 = "bderepair.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%", VulnerableApps = "%system32%\\repair-bde.exe"}
  l_45_4 = "bcrypt.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\shellappruntime.exe;%system32%\\wordpad.exe"}
  l_45_4 = "bcp47mrm.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mcbuilder.exe"}
  l_45_4 = "bcp47langs.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\lpremove.exe;%system32%\\systemsettingsadminflows.exe"}
  l_45_4 = "bcd.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\bootim.exe;%system32%\\cidiag.exe;%system32%\\genvalobj.exe;%system32%\\mdsched.exe;%system32%\\msconfig.exe;%system32%\\recdisc.exe;%system32%\\recoverydrive.exe;%system32%\\resetengine.exe;%system32%\\rstrui.exe;%system32%\\sdclt.exe;%system32%\\srtasks.exe;%system32%\\systempropertiesadvanced.exe;%system32%\\systempropertiescomputername.exe;%system32%\\systempropertiesdataexecutionprevention.exe;%system32%\\systempropertieshardware.exe;%system32%\\systempropertiesprotection.exe;%system32%\\systempropertiesremote.exe;%system32%\\systemreset.exe;%system32%\\vds.exe;%system32%\\vdsldr.exe;%system32%\\vssvc.exe;%system32%\\wbengine.exe"}
  l_45_4 = "batmeter.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\mblctr.exe"}
  l_45_4 = "avrt.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\osk.exe"}
  l_45_4 = "authz.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\easinvoker.exe;%system32%\\vssvc.exe;%system32%\\whoami.exe"}
  l_45_4 = "authfwcfg.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\netsh.exe"}
  l_45_4 = "auditpolcore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\auditpol.exe"}
  l_45_4 = "audioses.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\osk.exe"}
  l_45_4 = "atl.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\dsquery.exe;%system32%\\filescrn.exe;%system32%\\msconfig.exe;%system32%\\msdt.exe;%system32%\\msinfo32.exe;%system32%\\perfmon.exe;%system32%\\quickassist.exe;%system32%\\storrept.exe;%system32%\\vds.exe;%system32%\\vdsldr.exe;%system32%\\vssadmin.exe;%system32%\\wfs.exe"}
  l_45_4 = "archiveint.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\tar.exe"}
  l_45_4 = "appxdeploymentclient.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\lpremove.exe;%system32%\\systemsettingsadminflows.exe"}
  l_45_4 = "appxalluserstore.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\lpremove.exe"}
  l_45_4 = "appwiz.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "appvpolicy.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%programfiles%\\common files\\microsoft shared\\clicktorun", VulnerableApps = "%system32%\\appvclient.exe"}
  l_45_4 = "applicationframe.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\applicationframehost.exe"}
  l_45_4 = "apphelp.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\compmgmtlauncher.exe;%system32%\\sdbinst.exe;%windir%\\explorer.exe"}
  l_45_4 = "aepic.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\psr.exe"}
  l_45_4 = "adsldpc.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\agentservice.exe;%system32%\\netsh.exe;%system32%\\sppextcomobj.exe"}
  l_45_4 = "activeds.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\applysettingstemplatecatalog.exe;%system32%\\agentservice.exe;%system32%\\dsadd.exe;%system32%\\dsget.exe;%system32%\\dsmod.exe;%system32%\\dsrm.exe;%system32%\\gpfixup.exe"}
  l_45_4 = "aclui.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\shrpubw.exe;%programfiles%\\windows kits\\10\\bin\\%version%\\x86\\oleview.exe"}
  l_45_4 = "zlibwapi.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\ds clock", VulnerableApps = "%programfiles%\\ds clock\\dsclock.exe"}
  l_45_4 = "atl71.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\common files\\thunder network\\tp\\%version%", VulnerableApps = "%programfiles%\\common files\\thunder network\\tp\\%version%\\xlbugreport.exe"}
  l_45_4 = "x32bridge.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "wxmsw313u_aui_vc_custom.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\audacity", VulnerableApps = "%programfiles%\\audacity\\audacity.exe"}
  l_45_4 = "libwsutil.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\wireshark", VulnerableApps = "%programfiles%\\wireshark\\mergecap.exe"}
  l_45_4 = "libglib-2.0-0.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\wireshark", VulnerableApps = "%programfiles%\\wireshark\\mergecap.exe"}
  l_45_4 = "avutil.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\vso\\convertx\\7;%programfiles%\\vso\\convertxtodvd;%programfiles%\\common files\\oracle\\java\\javapath", VulnerableApps = "%programfiles%\\vso\\convertx\\7\\convertxtodvd.exe"}
  l_45_4 = "vmtools.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\vmware\\vmware tools;%programfiles%\\vmware\\vmware workstation;%programfiles%\\vmware\\vmware player", VulnerableApps = "%programfiles%\\vmware\\vmware tools\\rvmsetup.exe"}
  l_45_4 = "shfolder.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%system32%;%syswow64%", VulnerableApps = "%system32%\\vmnat.exe"}
  l_45_4 = "glib-2.0.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\vmware\\vmware tools;%programfiles%\\vmware\\vmware workstation;%programfiles%\\vmware\\vmware player", VulnerableApps = "%programfiles%\\vmware\\vmware tools\\vmwarexferlogs.exe"}
  l_45_4 = "libvlccore.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\videolan\\vlc", VulnerableApps = "%programfiles%\\videolan\\vlc\\vlc.exe"}
  l_45_4 = "libvlc.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\videolan\\vlc", VulnerableApps = "%programfiles%\\videolan\\vlc\\vlc.exe"}
  l_45_4 = "vivaldi_elf.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%localappdata%\\vivaldi\\application;%localappdata%\\vivaldi\\application\\%version%", VulnerableApps = "%localappdata%\\vivaldi\\application\\vivaldi.exe"}
  l_45_4 = "vntfxf32.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\venta\\ventafax & voice", VulnerableApps = "%programfiles%\\venta\\ventafax & voice\\spoololk.exe"}
  l_45_4 = "vstdlib_s64.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\steam", VulnerableApps = "%programfiles%\\steam\\steamerrorreporter64.exe"}
  l_45_4 = "unityplayer.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%localappdata%\\temp\\%version%\\windows", VulnerableApps = "kingdomtwocrowns.exe"}
  l_45_4 = "utiluniclient.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "tmtap.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "tmdbglog.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\trend micro\\titanium", VulnerableApps = "ptwatchdog.exe"}
  l_45_4 = "tosbtkbd.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\toshiba\\bluetooth toshiba stack", VulnerableApps = "%programfiles%\\toshiba\\bluetooth toshiba stack\\tosbtkbd.exe"}
  l_45_4 = "cc3260mt.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\tivo\\desktop", VulnerableApps = "%programfiles%\\tivo\\desktop\\tivoserver.exe"}
  l_45_4 = "tpsvc.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\vmware\\vmware tools;%programfiles%\\common files\\thinprint", VulnerableApps = "tpautoconnect.exe"}
  l_45_4 = "mfcu100u.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\techsmith\\camtasia studio 8", VulnerableApps = "%programfiles%\\techsmith\\camtasia studio 8\\cammenumaker.exe"}
  l_45_4 = "madhcnet32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\multimedia\\k-lite codec pack\\filters\\madvr;%programfiles%\\k-lite codec pack\\filters\\madvr", VulnerableApps = "%programfiles%\\k-lite codec pack\\filters\\madvr\\madhcctrl.exe"}
  l_45_4 = "shellsel.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "rastls.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\symantec\\network connected devices auto setup;%system32%", VulnerableApps = "%programfiles%\\symantec\\network connected devices auto setup\\rastlsc.exe"}
  l_45_4 = "ldvpocx.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "safestore32.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\sophos\\sophos anti-virus", VulnerableApps = "%programfiles%\\sophos\\sophos anti-virus\\ssr32.exe"}
  l_45_4 = "sqlite.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\adobe\\acrobat reader dc\\reader;%programfiles%\\adobe\\acrobat dc\\acrobat", VulnerableApps = "%programfiles%\\adobe\\acrobat reader dc\\reader\\acrobroker.exe"}
  l_45_4 = "smadhook32c.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\smadav", VulnerableApps = "%programfiles%\\smadav\\smadhook.exe"}
  l_45_4 = "epnsm.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\epson software\\document capture server", VulnerableApps = "%programfiles%\\epson software\\document capture server\\eeventmanager.exe"}
  l_45_4 = "flutter_gpu_texture_renderer_plugin.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%localappdata%\\rustdesk", VulnerableApps = "%localappdata%\\rustdesk\\rustdesk.exe"}
  l_45_4 = "rzlog4cpp_logger.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%localappdata%\\razer\\ingameengine\\cache\\rzfpsapplet", VulnerableApps = "%localappdata%\\razer\\ingameengine\\cache\\rzfpsapplet\\rzcefrenderprocess.exe"}
  l_45_4 = "asfbncor.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\replay media splitter", VulnerableApps = "%programfiles%\\replay media splitter\\replaymediasplitter.exe"}
  l_45_4 = "qtgui4.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\audacity;%programfiles%\\aomei\\aomei backupper\\%version%", VulnerableApps = "%programfiles%\\audacity\\crashreporter.exe;%programfiles%\\aomei\\aomei backupper\\%version%\\shortcuttaskagent.exe"}
  l_45_4 = "qt5core.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\electronic arts\\ea desktop\\ea desktop;%programfiles%\\microsoft onedrive\\%version%;%localappdata%\\microsoft\\onedrive\\%version%;%programfiles%\\dropbox\\client\\%version%;%programfiles%\\logioptionsplus", VulnerableApps = "%programfiles%\\electronic arts\\ea desktop\\ea desktop\\easteamproxy.exe"}
  l_45_4 = "keyscramblerie.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\keyscrambler", VulnerableApps = "%programfiles%\\keyscrambler\\keyscrambler.exe"}
  l_45_4 = "python39.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\python39%localappdata%\\temp\\%version%;%programfiles%\\microsoft visual studio\\2022\\community\\common7\\ide\\commonextensions\\microsoft\\vc\\securityissueanalysis\\python;%userprofile%\\anaconda3", VulnerableApps = "python39.exe"}
  l_45_4 = "python311.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\python311;%localappdata%\\programs\\python\\python311", VulnerableApps = "pythonw.exe"}
  l_45_4 = "python310.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\python310;%localappdata%\\temp\\%version%;%programfiles%\\dwagent\\runtime;%userprofile%\\anaconda3", VulnerableApps = "pythonw.exe;dwagent.exe"}
  l_45_4 = "libeay32.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\pspad editor", VulnerableApps = "%programfiles%\\pspad editor\\pspad.exe"}
  l_45_4 = "winutils.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\palo alto networks\\traps", VulnerableApps = "%programfiles%\\palo alto networks\\traps\\cydump.exe"}
  l_45_4 = "vboxrt.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\oracle\\virtualbox", VulnerableApps = "%programfiles%\\oracle\\virtualbox\\vboxsvc.exe"}
  l_45_4 = "qtcorevbox4.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\oracle\\virtualbox", VulnerableApps = "%programfiles%\\oracle\\virtualbox\\vboxtestogl.exe"}
  l_45_4 = "launcher.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\sql developer\\ide\\bin", VulnerableApps = "%programfiles%\\sql developer\\sqldeveloper.exe"}
  l_45_4 = "opera_elf.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%localappdata%\\programs\\opera\\%version%", VulnerableApps = "%localappdata%\\programs\\opera\\%version%\\opera.exe"}
  l_45_4 = "nvsmartmax.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\nvidia corporation\\display", VulnerableApps = "%programfiles%\\nvidia corporation\\display\\nvsmartex.exe"}
  l_45_4 = "libcef.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\nvidia corporation\\nvidia geforce experience", VulnerableApps = "program files (x86)\\nvidia corporation\\nvidia geforce experience\\nvida share.exe"}
  l_45_4 = "providers.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "mimetools.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\notepad++\\plugins;%programfiles%\\notepad++\\plugins\\mimetools", VulnerableApps = "%programfiles%\\notepad++\\notepad++.exe"}
  l_45_4 = "mozglue.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\seamonkey;%programfiles%\\mozilla firefox;%programfiles%\\mozilla thunderbird", VulnerableApps = "%programfiles%\\seamonkey\\seamonkey.exe"}
  l_45_4 = "libxfont-1.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\mobatek\\mobaxterm personal edition;%programfiles%\\mobatek\\mobaxterm", VulnerableApps = "%programfiles%\\mobatek\\mobaxterm personal edition\\mobaxterm.exe;%programfiles%\\mobatek\\mobaxterm\\mobaxterm.exe"}
  l_45_4 = "tutil32.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\pde", VulnerableApps = "%programfiles%\\pde\\pde.exe"}
  l_45_4 = "mediainfo_i386.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\mediainfo", VulnerableApps = "%programfiles%\\mediainfo\\mediainfo.exe"}
  l_45_4 = "vsodscpl.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\mcafee\\virusscan enterprise", VulnerableApps = "scncfg32.exe"}
  l_45_4 = "siteadv.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\siteadvisor\\%version%", VulnerableApps = "sideadv.exe"}
  l_45_4 = "mcutil.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\mcafee inc.\\mcafee total protection 2009", VulnerableApps = "mcoemcpy.exe"}
  l_45_4 = "lockdown.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\mcafee\\virusscan enterprise", VulnerableApps = "mfeann.exe"}
  l_45_4 = "ashldres.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\mcafee.com\\vso", VulnerableApps = "mcvsshld.exe"}
  l_45_4 = "facesdk.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\luxand\\facesdk\\bin\\win64", VulnerableApps = "%programfiles%\\luxand\\facesdk\\bin\\win64\\facialfeaturedemo.exe"}
  l_45_4 = "lmiguardiandll.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\logmein;%programfiles%\\logmein\\x86;%programfiles%\\logmein\\x64", VulnerableApps = "lmiguardiansvc.exe"}
  l_45_4 = "tts.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\soundpad", VulnerableApps = "%programfiles%\\soundpad\\soundpad.exe"}
  l_45_4 = "quickdeskband.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "commfunc.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\lenovo\\communications utility", VulnerableApps = "cammute.exe"}
  l_45_4 = "krpt.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\kingsoft\\wps office\\%version%\\office6", VulnerableApps = "%programfiles%\\kingsoft\\wps office\\%version%\\office6\\wpp.exe"}
  l_45_4 = "webui.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\itop screen recorder", VulnerableApps = "%programfiles%\\itop screen recorder\\iscrpaint.exe"}
  l_45_4 = "rtl120.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\dualsafe password manager", VulnerableApps = "%programfiles%\\dualsafe password manager\\dpminit.exe"}
  l_45_4 = "common.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\iroot", VulnerableApps = "%programfiles%\\iroot\\romasterconnection.exe"}
  l_45_4 = "register.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\iobit\\driver booster\\%version%", VulnerableApps = "%programfiles%\\iobit\\driver booster\\%version%\\driverbooster.exe"}
  l_45_4 = "skinutils.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\icqlite", VulnerableApps = "%programfiles%\\icqlite\\icqlite.exe"}
  l_45_4 = "liteskinutils.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\icqlite", VulnerableApps = "%programfiles%\\icqlite\\icqlite.exe"}
  l_45_4 = "hpqhvsei.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\hp", VulnerableApps = "hpqhvind.exe"}
  l_45_4 = "hpcustpartui.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\hp", VulnerableApps = "hpcustparticui.exe"}
  l_45_4 = "iepdf32.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\handy viewer", VulnerableApps = "%programfiles%\\handy viewer\\hv.exe"}
  l_45_4 = "chrome_frame_helper.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%localappdata%\\google\\chrome\\application;%programfiles%\\google\\chrome\\application", VulnerableApps = "chrome_frame_helper.exe"}
  l_45_4 = "badata_x64.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\true burner", VulnerableApps = "%programfiles%\\true burner\\trueburner.exe"}
  l_45_4 = "avkkid.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\g data\\totalsecurity\\avkkid", VulnerableApps = "%programfiles%\\g data\\totalsecurity\\avkkid\\avkkid.exe"}
  l_45_4 = "fnp_act_installer.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\installshield\\%version%\\system", VulnerableApps = "%programfiles%\\installshield\\%version%\\system\\tsconfig.exe;%programfiles%\\installshield\\%version%\\system\\isdbg.exe"}
  l_45_4 = "qrt.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\f-secure\\anti-virus", VulnerableApps = "qrtfix.exe"}
  l_45_4 = "eacore.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\electronic arts\\ea desktop\\ea desktop", VulnerableApps = "%programfiles%\\electronic arts\\ea desktop\\ea desktop\\eacoreserver.exe"}
  l_45_4 = "goopdate.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\dropbox\\update;%programfiles%\\dropbox\\update\\%version%;%localappdata%\\dropboxupdate\\update", VulnerableApps = "dropboxupdate.exe;dropboxcrashhandler.exe"}
  l_45_4 = "ci.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\digiarty\\winx blu-ray decrypter;%system32%", VulnerableApps = "%programfiles%\\digiarty\\winx blu-ray decrypter\\winx blu-ray decrypter.exe"}
  l_45_4 = "vftrace.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\cyberark\\endpoint privilege manager\\agent\\x32;%programfiles%\\cyberark\\endpoint privilege manager\\agent\\x64;%programfiles%\\cyberark\\endpoint privilege manager\\agent", VulnerableApps = "vf_host.exe"}
  l_45_4 = "libcurl.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\notepad++\\updater;%programfiles%\\windowsapps\\msteams_%version%;%programfiles%\\coolmuster\\coolmuster pdf creator pro\\%version%\\bin", VulnerableApps = "%programfiles%\\notepad++\\updater\\gup.exe;%programfiles%\\coolmuster\\coolmuster pdf creator pro\\%version%\\bin\\coolmuster pdf creator pro.exe"}
  l_45_4 = "classicexplorer32.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\classic shell;%programfiles%\\open-shell", VulnerableApps = "classicexplorersettings.exe"}
  l_45_4 = "wcldll.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\cisco systems\\cisco jabber;%programfiles%\\webex\\applications;%programfiles%\\webex\\plugins", VulnerableApps = "%programfiles%\\webex\\applications\\ptinst.exe"}
  l_45_4 = "ciscosparklauncher.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%localappdata%\\ciscosparklauncher", VulnerableApps = "ciscocollabhost.exe"}
  l_45_4 = "mfc140u.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\checkmal\\appcheck", VulnerableApps = "%programfiles%\\checkmal\\appcheck\\appcheck.exe"}
  l_45_4 = "avupdate.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\confer\\scanner\\upd.exe", VulnerableApps = "%programfiles%\\confer\\scanner\\upd.exe"}
  l_45_4 = "relay.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "calibre-launcher.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\calibre2", VulnerableApps = "calibre.exe"}
  l_45_4 = "bugsplat64.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\nitro\\pdf pro\\%programfiles%\\nitro\\pro", VulnerableApps = "bugsplathd64.exe"}
  l_45_4 = "log.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\bitdefender antivirus free", VulnerableApps = "%programfiles%\\bitdefender antivirus free\\bdreinit.exe"}
  l_45_4 = "basicnetutils.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%localappdata%\\temp\\%version%\\application2;%programfiles%\\baidu\\baidupinyin\\%version%", VulnerableApps = "%localappdata%\\temp\\%version%\\application2\\xlgameupdate.exe"}
  l_45_4 = "wsc.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\avast software\\avast", VulnerableApps = "wsc_proxy.exe"}
  l_45_4 = "dal_keepalives.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\audinate\\shared files", VulnerableApps = "%programfiles%\\audinate\\shared files\\mdnsresponder.exe"}
  l_45_4 = "vender.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\asus\\gpu tweakii;%programfiles%\\asus\\vga com\\%version%", VulnerableApps = "%programfiles%\\asus\\gpu tweakii\\asusgpufanservice.exe"}
  l_45_4 = "asus_wmi.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\asus\\axsp\\%version%", VulnerableApps = "%programfiles%\\asus\\axsp\\%version%\\atkexcomsvc.exe"}
  l_45_4 = "asio.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\asus\\axsp\\%version%", VulnerableApps = "%programfiles%\\asus\\axsp\\4.02.12\\atkexcomsvc.exe"}
  l_45_4 = "corefoundation.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\common files\\apple\\apple application support;%system32%", VulnerableApps = "%programfiles%\\itunes\\ituneshelper.exe;%programfiles%\\quicktime\\quicktimeplayer.exe"}
  l_45_4 = "duilib_u.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\anyviewer", VulnerableApps = "splashwin.exe"}
  l_45_4 = "avdevice-54.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\anymp4 studio\\anymp4 blu-ray creator", VulnerableApps = "%programfiles%\\anymp4 studio\\anymp4 blu-ray creator\\anymp4 blu-ray creator.exe"}
  l_45_4 = "amindpdfcore.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\geekerpdf\\geekerpdf", VulnerableApps = "%programfiles%\\geekerpdf\\geekerpdf\\geekerpdf.exe"}
  l_45_4 = "cc32290mt.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\ahnenblatt4\\ahnenblatt4.exe", VulnerableApps = "%programfiles%\\ahnenblatt4\\ahnenblatt4.exe"}
  l_45_4 = "vcomp100.dll"
  l_45_3[l_45_4], l_45_5 = l_45_5, {}
  l_45_4 = "acrodistdll.dl"
  l_45_3[l_45_4], l_45_5 = l_45_5, {ExpectedLocation = "%programfiles%\\adobe\\acrobat %version%\\acrobat", VulnerableApps = "%programfiles%\\adobe\\acrobat %version%\\acrobat\\acrodist.exe"}
  l_45_4 = false
  l_45_5 = false
  local l_45_6 = false
  local l_45_7 = l_45_3[l_45_0]
  if not l_45_7 then
    return l_45_4
  end
  l_45_4 = true
  l_45_1 = (string.lower)(l_45_1)
  local l_45_8 = l_45_7.ExpectedLocation
  for l_45_12 in (string.gmatch)(l_45_8, "([^;]+)") do
    local l_45_13, l_45_14 = pcall(mp.ContextualExpandEnvironmentVariables, l_45_12)
    if l_45_13 and (string.find)(l_45_14, l_45_1, 1, true) then
      do
        do
          l_45_14 = true
          do break end
          -- DECOMPILER ERROR at PC3090: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC3090: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC3090: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  l_45_2 = (string.lower)(l_45_2)
  if (string.find)(l_45_7.VulnerableApps, l_45_2, 1, true) then
    l_45_6 = true
  end
  return l_45_4, l_45_5, l_45_6
end

FiletimeToDaysElapsed = function(l_46_0)
  -- function num : 0_45
  if type(l_46_0) ~= "number" then
    return -1
  end
  l_46_0 = l_46_0 / 10000000 - 11644473600
  local l_46_1 = (MpCommon.GetCurrentTimeT)()
  if l_46_1 <= l_46_0 then
    return -1
  end
  return (l_46_1 - (l_46_0)) / 60 * 144
end


