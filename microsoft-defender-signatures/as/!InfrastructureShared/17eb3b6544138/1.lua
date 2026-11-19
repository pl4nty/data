-- Threat: !InfrastructureShared
-- Name: 17eb3b6544138
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local function l_0_0(l_1_0)
  local l_1_1 = {
    [".bat"] = true,
    
    [".cmd"] = true,
    [".ps1"] = true
  }
  if l_1_0.procInfo then
    if l_1_0.procInfo.cmdline then
      bm_AddRelatedFileFromCommandLine(l_1_0.procInfo.cmdline:lower(), l_1_1, nil, 1)
    end
    if l_1_0.procInfo.shellScripts then
      for l_1_2, l_1_3 in ipairs(l_1_0.procInfo.shellScripts) do
        if sysio.IsFileExists(l_1_3) then
          bm.add_related_file(l_1_3)
        end
      end
    end
  end
  if l_1_0.parents then
    for l_1_4, l_1_5 in ipairs(l_1_0.parents) do
      if l_1_5.cmdline then
        bm_AddRelatedFileFromCommandLine(l_1_5.cmdline:lower(), l_1_1, nil, 1)
      end
      if l_1_5.shellScripts then
        for l_1_6, l_1_7 in ipairs(l_1_5.shellScripts) do
          if sysio.IsFileExists(l_1_7) then
            bm.add_related_file(l_1_7)
          end
        end
      end
    end
  end
end

local function l_0_1(l_2_0, l_2_1)
  local l_2_2 = GetRollingQueue(l_2_1)
  if l_2_2 ~= nil and type(l_2_2) == "table" then
    local l_2_3 = l_2_0:lower()
    local l_2_4 = l_2_3:match("%.([^%.]+)$")
    for l_2_5 in pairs(l_2_2) do
      local l_2_6 = safeJsonDeserialize(l_2_2[l_2_5].key)
      if l_2_6 and l_2_6.type and l_2_6.event then
        local l_2_7 = l_2_6.event:lower()
        if string.find(l_2_6.type, "BM_Exclusion", 1, true) then
          do
            local l_2_8 = l_2_7:match("\\exclusions\\paths\\\\(.+)$") or l_2_7:match("\\exclusions\\processes\\\\(.+)$")
            if l_2_8 ~= nil then
              l_2_8 = MpCommon.ExpandEnvironmentVariables(l_2_8)
              l_2_8 = l_2_8:lower():gsub("%.", "%%."):gsub("?", "."):gsub("*", "[^\\]+")
              if l_2_3:match(l_2_8) then
                bm.add_related_string("Tampering_Events", l_2_2[l_2_5].key, bm.RelatedStringBMReport)
                l_0_0(l_2_6)
                return true
              end
            end
            local l_2_9 = l_2_7:match("\\exclusions\\extensions\\\\%W*(%w+)$")
            if l_2_9 ~= nil and l_2_4 == l_2_9:lower() then
              bm.add_related_string("Tampering_Events", l_2_2[l_2_5].key, bm.RelatedStringBMReport)
              l_0_0(l_2_6)
              return true
            end
          end
        elseif string.find(l_2_6.type, "AMSI_Exclusion", 1, true) then
          for l_2_10 in string.gmatch(l_2_7, "[^;]+") do
            local l_2_11 = l_2_10:match("path|(.+)$") or l_2_7:match("process|(.+)$")
            if l_2_11 ~= nil then
              l_2_11 = MpCommon.ExpandEnvironmentVariables(l_2_11)
              l_2_11 = l_2_11:lower():gsub("%.", "%%."):gsub("?", "."):gsub("*", "[^\\]+")
              if l_2_3:match(l_2_11) then
                bm.add_related_string("Tampering_Events", l_2_2[l_2_5].key, bm.RelatedStringBMReport)
                l_0_0(l_2_6)
                return true
              end
            end
            local l_2_12 = l_2_7:match("extension|%W*(%w+)$")
            if l_2_12 ~= nil and l_2_4 == l_2_12:lower() then
              bm.add_related_string("Tampering_Events", l_2_2[l_2_5].key, bm.RelatedStringBMReport)
              l_0_0(l_2_6)
              return true
            end
          end
        end
      end
    end
  end
  return false
end

local l_0_2 = bm.get_imagepath()
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = MpCommon.PathToWin32Path(l_0_2)
local l_0_3 = "TamperingTracking"
if l_0_1(l_0_2, l_0_3) then
  add_parents()
  return mp.INFECTED
end
local l_0_4 = reportSessionInformation()
if l_0_4.User and l_0_4.User.UserName then
  l_0_3 = l_0_3 .. "-" .. l_0_4.User.UserName
  if l_0_1(l_0_2, l_0_3) then
    add_parents()
    return mp.INFECTED
  end
end
return mp.CLEAN
