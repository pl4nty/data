-- Threat: !InfrastructureShared
-- Name: ScriptLuaLib
-- Type: 1

function Infrastructure_CryptoSearcher(l_1_0)
  local l_1_1 = mp.getfilesize()
  
  if 250000 < l_1_1 then
    return false
  end
  local l_1_2 = l_1_0 - 8192
  local l_1_3 = 0
  if l_1_2 > l_1_3 then
    l_1_3 = l_1_2
  end
  local l_1_4 = l_1_1 - l_1_3
  local l_1_5 = 16384
  if l_1_4 < 16384 then
    l_1_5 = l_1_4
  end
  mp.readprotection(false)
  local l_1_6 = mp.readfile(l_1_3, l_1_5)
  local l_1_7 = -1
  local l_1_8 = -1
  local l_1_9 = {
    ["'"] = true,
    ["\""] = true,
    [">"] = true,
    ["<"] = true,
    [" "] = true,
    ["\t"] = true
  }
  local l_1_10 = {}
  local l_1_11 = "MpInternal_researchdata="
  local l_1_12 = string.gmatch(l_1_6, "([%\"%'%>%. ])([013baADLm]%w+)(%W)")
  local l_1_13 = false
  for l_1_14, l_1_15, l_1_16 in l_1_12, nil, nil do
    local l_1_17 = ""
    local l_1_18 = ""
    local l_1_19 = ""
    if l_1_9[l_1_14] == true and l_1_9[l_1_16] == true then
      local l_1_20 = string.len(l_1_15)
      if 25 < l_1_20 and l_1_10[l_1_15] == nil then
        l_1_10[l_1_15] = 1
        local l_1_21 = l_1_15:sub(1, 1)
        local l_1_22 = l_1_15:sub(1, 2)
        local l_1_23 = l_1_15:sub(1, 3)
        local l_1_24 = l_1_15:sub(1, 4)
        local l_1_25 = l_1_15:sub(1, 5)
        if (l_1_21 == "1" or l_1_21 == "3" or l_1_23 == "bc1") and 25 < l_1_20 and l_1_20 < 79 then
          l_1_17 = l_1_15
          l_1_18 = "btc"
          l_1_19 = "00000001"
        elseif l_1_22 == "0x" and l_1_20 == 42 then
          l_1_17 = l_1_15
          l_1_18 = "eth"
          l_1_19 = "00000002"
          if l_1_6:find("send SHIB", 1, true) ~= nil then
            l_1_18 = "shib"
            l_1_19 = "00000006"
          end
          if l_1_6:find("send BNB", 1, true) ~= nil then
            l_1_18 = "bnb"
            l_1_19 = "00000007"
          end
        elseif (l_1_21 == "L" or l_1_21 == "M" or l_1_24 == "ltc1") and 25 < l_1_20 and l_1_20 < 36 then
          l_1_17 = l_1_15
          l_1_18 = "ltc"
          l_1_19 = "00000003"
        elseif (l_1_23 == "Ae2" or l_1_25 == "addr1" or l_1_25 == "DdzFF") and 25 < l_1_20 and l_1_20 < 200 then
          l_1_17 = l_1_15
          l_1_18 = "ada"
          l_1_19 = "00000004"
        elseif l_1_21 == "D" and 25 < l_1_20 and l_1_20 < 36 and string.match(l_1_22, "D[0-1A-Z]") ~= nil then
          l_1_17 = l_1_15
          l_1_18 = "doge"
          l_1_19 = "00000005"
        end
      end
      if l_1_17 ~= "" and l_1_18 ~= "" and l_1_19 ~= "" then
        l_1_13 = true
        if l_1_11 == "MpInternal_researchdata=" then
          l_1_11 = l_1_11 .. l_1_18 .. "=" .. l_1_17
        else
          l_1_11 = l_1_11 .. "," .. l_1_18 .. "=" .. l_1_17
        end
        if l_1_7 < 0 and l_1_8 < 0 then
          local l_1_26, l_1_27 = string.find(l_1_6, l_1_17, 1, true)
          if l_1_26 ~= nil then
            l_1_7 = l_1_3 + l_1_26 - 1
            l_1_8 = l_1_5 - l_1_26 + 1
          end
        end
      end
    end
  end
  if l_1_13 == false then
    return false
  else
    mp.set_mpattribute(l_1_11)
    if -1 < l_1_7 and 0 < l_1_8 then
      mp.vfo_add_filechunk(l_1_7, l_1_8, "[CryptoSearcher]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    end
  end
  return true
end

function LoadMatchedDataInBuffer()
  local l_2_0
  local l_2_1 = mp.GetBruteMatchData()
  if l_2_1.is_header then
    l_2_0 = tostring(headerpage):sub(l_2_1.match_offset, l_2_1.match_offset + mp.HEADERPAGE_SZ)
  else
    l_2_0 = tostring(footerpage):sub(l_2_1.match_offset, l_2_1.match_offset + mp.FOOTERPAGE_SZ)
  end
  l_2_0 = string.lower(l_2_0)
  return l_2_0
end

function GetPatternOccurenceCount(l_3_0, l_3_1)
  local l_3_2 = 0
  for l_3_3 in string.gmatch(l_3_0, l_3_1) do
    l_3_2 = l_3_2 + 1
  end
  return l_3_2
end

function IsPathExcludedXplatML(l_4_0)
  if l_4_0 == nil or l_4_0 == "" then
    return false
  end
  local l_4_1 = string.lower(l_4_0)
  local l_4_2 = {
    "/var/opt/microsoft/mdatp/"
  }
  local l_4_3 = {
    "%.deb$",
    "%.iso$",
    "%.rpm$",
    "%.img$"
  }
  local l_4_4 = {}
  local l_4_5 = {}
  local l_4_6 = {
    "/library/application support/microsoft/defender"
  }
  local l_4_7 = {
    "/private/tmp/[^/]+/scripts/com.microsoft.wdav[^/]+/postinstall",
    "/library/installersandboxes/.*/scripts/com.microsoft.teams",
    "/volumes/[^/]+/backups.backupdb/",
    "/private/var/folders/.*/t/com.microsoft.intunemdmagent/",
    "/volumes/.timemachine/[^/]+%.backup",
    "%.iso$"
  }
  local l_4_8 = {
    "/library/application support/microsoft/teamsupdaterdaemon/pkgs"
  }
  local l_4_9 = {}
  
  function IsPathExcluded(l_5_0, l_5_1, l_5_2, l_5_3, l_5_4)
    if l_5_0 == nil or l_5_0 == "" then
      return false
    end
    for l_5_5, l_5_6 in ipairs(l_5_3) do
      if l_5_0:sub(1, #l_5_6) == l_5_6 then
        return true
      end
    end
    for l_5_7, l_5_8 in ipairs(l_5_4) do
      if l_5_0:find(l_5_8, -1 * #l_5_8, true) then
        return true
      end
    end
    for l_5_9, l_5_10 in ipairs(l_5_1) do
      if l_5_0:find(l_5_10, 1, true) then
        return true
      end
    end
    for l_5_11, l_5_12 in ipairs(l_5_2) do
      if l_5_0:find(l_5_12, 1, false) then
        return true
      end
    end
  end
  
  local l_4_10 = versioning.GetPlatform()
  if l_4_10 == 7 then
    if IsPathExcluded(l_4_1, l_4_6, l_4_7, l_4_8, l_4_9) then
      return true
    end
  elseif l_4_10 == 8 and IsPathExcluded(l_4_1, l_4_2, l_4_3, l_4_4, l_4_5) then
    return true
  end
  return false
end
