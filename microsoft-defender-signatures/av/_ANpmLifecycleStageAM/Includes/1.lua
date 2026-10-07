-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_ANpmLifecycleStageAM\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if isnull(l_0_0) or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
if (string.find)(l_0_0, "->", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(MpCommon.PathToWin32Path, l_0_0)
if not l_0_1 or isnull(l_0_2) or type(l_0_2) ~= "string" then
  set_research_data("SC_NpmLifecycle_Error", "LocalPathUnavailable", false)
  return mp.CLEAN
end
l_0_2 = (string.gsub)((string.lower)(l_0_2), "\\", "/")
if isnull((string.match)(l_0_2, "^%a:/")) then
  return mp.CLEAN
end
if not (string.find)(l_0_2, "/node_modules/", 1, true) then
  return mp.CLEAN
end
local l_0_3 = function(l_1_0, l_1_1)
  -- function num : 0_0
  if isnull(l_1_0) or type(l_1_0) ~= "string" or #l_1_0 > 8192 then
    return false
  end
  local l_1_2, l_1_3 = pcall(MpCommon.CommandLineToArgv, l_1_0)
  if not l_1_2 or isnull(l_1_3) or type(l_1_3) ~= "table" or #l_1_3 > 128 then
    set_research_data("SC_NpmLifecycle_Error", "ArgumentParseFailed", false)
    return false
  end
  for l_1_7,l_1_8 in ipairs(l_1_3) do
    if type(l_1_8) ~= "string" then
      set_research_data("SC_NpmLifecycle_Error", "InvalidArgumentType", false)
      return false
    end
  end
  for l_1_12,l_1_13 in ipairs(l_1_3) do
    local l_1_14 = l_1_3[l_1_12 - 1]
    if l_1_12 == 1 or l_1_14 == "&&" or l_1_14 == "||" or l_1_14 == ";" then
      local l_1_15 = (string.gsub)((string.lower)(l_1_13), "\\", "/")
      l_1_15 = (string.match)(l_1_15, "([^/]+)$")
      if l_1_15 == "node" or l_1_15 == "node.exe" then
        local l_1_16 = l_1_12 + 1
        while 1 do
          if l_1_3[l_1_16] == "--no-warnings" or l_1_3[l_1_16] == "--enable-source-maps" then
            l_1_16 = l_1_16 + 1
            -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
        if l_1_3[l_1_16] == "--" then
          l_1_16 = l_1_16 + 1
        end
        local l_1_17 = l_1_3[l_1_16]
        if not isnull(l_1_17) then
          l_1_17 = (string.gsub)((string.lower)(l_1_17), "\\", "/")
          if (string.sub)(l_1_17, 1, 1) ~= "/" and not (string.find)(l_1_17, ":", 1, true) then
            local l_1_18 = {}
            local l_1_19 = true
            for l_1_23 in (string.gmatch)(l_1_17, "[^/]+") do
              if l_1_23 == ".." then
                if isnull(l_1_18) then
                  l_1_19 = false
                else
                  ;
                  (table.remove)(l_1_18)
                end
              else
                if l_1_23 ~= "." then
                  l_1_18[#l_1_18 + 1] = l_1_23
                end
              end
            end
            if l_1_19 and (table.concat)(l_1_18, "/") == l_1_1 then
              return true
            end
          end
        end
      end
    end
  end
  return false
end

local l_0_4 = (string.match)(l_0_2, "^(.*)/[^/]+$")
local l_0_5 = false
local l_0_6 = false
while 1 do
  while 1 do
    -- DECOMPILER ERROR at PC116: Confused about usage of register: R7 in 'UnsetPending'

    if not isnull(l_0_4) and not l_0_6 and 0 < 8 and (string.find)(l_0_4, "/node_modules/", 1, true) then
      local l_0_7, l_0_25, l_0_26 = 0 + 1
      l_0_25 = string
      l_0_25 = l_0_25.gsub
      l_0_26 = l_0_4
      l_0_26 = l_0_26 .. "/package.json"
      l_0_25 = l_0_25(l_0_26, "/", "\\")
      local l_0_8 = nil
      l_0_26 = pcall
      l_0_8 = sysio
      l_0_8 = l_0_8.IsFileExists
      l_0_26 = l_0_26(l_0_8, l_0_25)
      local l_0_9, l_0_10 = nil
      if l_0_26 then
        l_0_9 = type
        l_0_10 = 
        l_0_9 = l_0_9(l_0_10)
      end
      if l_0_9 ~= "boolean" then
        l_0_9 = set_research_data
        l_0_10 = "SC_NpmLifecycle_Error"
        l_0_9(l_0_10, "ManifestLookupFailed", false)
        l_0_9 = mp
        l_0_9 = l_0_9.CLEAN
        return l_0_9
      end
      if l_0_8 then
        l_0_6 = true
        l_0_9 = pcall
        l_0_10 = sysio
        l_0_10 = l_0_10.GetFileSize
        l_0_9 = l_0_9(l_0_10, l_0_25)
        local l_0_11, l_0_12 = nil
        if l_0_9 then
          l_0_11 = isnull
          l_0_12 = 
          l_0_11 = l_0_11(l_0_12)
          if not l_0_11 then
            l_0_11 = type
            l_0_12 = 
            l_0_11 = l_0_11(l_0_12)
          end
        end
        if l_0_11 ~= "number" or l_0_10 ~= l_0_10 or l_0_10 < 2 or l_0_10 > 65536 then
          l_0_11 = set_research_data
          l_0_12 = "SC_NpmLifecycle_Error"
          l_0_11(l_0_12, "ManifestSizeUnavailableOrOversize", false)
          l_0_11 = mp
          l_0_11 = l_0_11.CLEAN
          return l_0_11
        end
        l_0_11 = pcall
        l_0_12 = sysio
        l_0_12 = l_0_12.ReadFile
        l_0_11 = l_0_11(l_0_12, l_0_25, 0, R17_PC185)
        local l_0_13, l_0_14 = nil
        if l_0_11 then
          l_0_13 = isnull
          l_0_14 = 
          l_0_13 = l_0_13(l_0_14)
          if not l_0_13 then
            l_0_13 = type
            l_0_14 = 
            l_0_13 = l_0_13(l_0_14)
            if l_0_13 == "string" then
              l_0_13 = #l_0_12
            end
          end
        end
        if l_0_13 ~= l_0_10 then
          l_0_13 = set_research_data
          l_0_14 = "SC_NpmLifecycle_Error"
          R17_PC185 = "IncompleteManifestRead"
          l_0_13(l_0_14, R17_PC185, false)
          l_0_13 = mp
          l_0_13 = l_0_13.CLEAN
          return l_0_13
        end
        l_0_13 = pcall
        l_0_14 = MpCommon
        l_0_14 = l_0_14.JsonDeserialize
        R17_PC185 = 
        l_0_13 = l_0_13(l_0_14, R17_PC185)
        local l_0_15, l_0_16 = nil
        if l_0_13 then
          l_0_15 = type
          l_0_16 = 
          l_0_15 = l_0_15(l_0_16)
        end
        if l_0_15 ~= "table" then
          l_0_15 = set_research_data
          l_0_16 = "SC_NpmLifecycle_Error"
          l_0_15(l_0_16, "InvalidManifestObject", false)
          l_0_15 = mp
          l_0_15 = l_0_15.CLEAN
          return l_0_15
        end
        l_0_15 = isnull
        l_0_16 = 
        l_0_15 = l_0_15(l_0_16)
        if l_0_15 then
          l_0_15 = mp
          l_0_15 = l_0_15.CLEAN
          return l_0_15
        end
        l_0_15 = l_0_14.scripts
        local l_0_17 = nil
        l_0_16 = isnull
        l_0_17 = l_0_15
        l_0_16 = l_0_16(l_0_17)
        if not l_0_16 then
          l_0_16 = type
          l_0_17 = l_0_15
          l_0_16 = l_0_16(l_0_17)
        end
        if l_0_16 ~= "table" then
          l_0_16 = mp
          l_0_16 = l_0_16.CLEAN
          return l_0_16
        end
        l_0_16 = string
        l_0_16 = l_0_16.sub
        l_0_17 = l_0_2
        l_0_16 = l_0_16(l_0_17, #l_0_4 + 2)
        local l_0_18 = nil
        local l_0_19 = nil
        l_0_18 = "preinstall"
        l_0_19 = "install"
        l_0_18 = ipairs
        l_0_19, l_0_17 = l_0_17, {l_0_18, l_0_19, "postinstall", "prepare"}
        l_0_18 = l_0_18(l_0_19)
        for l_0_23,l_0_24 in l_0_18 do
          local l_0_23, l_0_24 = nil
          l_0_23 = l_0_3
          l_0_24 = l_0_15[l_0_22]
          l_0_23 = l_0_23(l_0_24, l_0_16)
          if l_0_23 then
            l_0_5 = true
          end
        end
        -- DECOMPILER ERROR at PC276: Confused about usage of register R21 for local variables in 'ReleaseLocals'

        -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

        -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
  l_0_9 = string
  l_0_9 = l_0_9.match
  l_0_10 = l_0_4
  l_0_11 = "^(.*)/[^/]+$"
  l_0_9 = l_0_9(l_0_10, l_0_11)
  l_0_4 = l_0_9
  -- DECOMPILER ERROR at PC283: Confused about usage of register R20 for local variables in 'ReleaseLocals'

end
if not l_0_5 then
  l_0_25 = mp
  l_0_25 = l_0_25.CLEAN
  return l_0_25
end
l_0_25 = set_research_data
l_0_26 = "SC_NpmLifecycle"
l_0_8 = "EncodedStageIsLifecycleEntry"
l_0_9 = false
l_0_25(l_0_26, l_0_8, l_0_9)
l_0_25 = mp
l_0_25 = l_0_25.set_mpattribute
l_0_26 = "Lua:NpmLifecycleStage.AM"
l_0_25(l_0_26)
l_0_25 = mp
l_0_25 = l_0_25.INFECTED
return l_0_25

