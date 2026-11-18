-- Threat: !InfrastructureShared
-- Name: BasScenarioSpecificInfra
-- Type: 1
-- Includes: TechniqueTracker, LuaFuncHelper, Path

function IsBasFileEncryptExt(l_1_0)
  if l_1_0 == nil or l_1_0 == "" or type(l_1_0) ~= "string" then
    return false
  end
  local l_1_1 = {
    [".oops"] = true,
    [".locky"] = true,
    [".amnesia"] = true,
    [".arena"] = true,
    [".locked"] = true,
    [".exo"] = true,
    [".tron"] = true,
    [".wamarlocked"] = true,
    [".obfuscated"] = true,
    [".bitkangoroo"] = true,
    [".gollum"] = true,
    [".hainhc"] = true,
    [".bworm"] = true,
    [".xf4g-vbrt-3v78"] = true,
    [".cerber"] = true,
    [".chip"] = true,
    [".clop"] = true,
    [".crazy"] = true,
    [".crypt12"] = true,
    [".cryptolocker"] = true,
    [".dcrtr"] = true,
    [".defender"] = true,
    [".deria"] = true,
    [".dmr64"] = true,
    [".cry"] = true,
    [".crypt888"] = true,
    [".flyper"] = true,
    [".frog"] = true,
    [".frs"] = true,
    [".ftcode"] = true,
    [".crab"] = true,
    [".garrantydecrypt"] = true,
    [".ghost"] = true,
    [".godra"] = true,
    [".yc5pdbhp"] = true,
    [".crypted"] = true,
    [".havoccrypt"] = true,
    [".hilda!"] = true,
    [".horros"] = true,
    [".encry"] = true,
    [".jaff"] = true,
    [".james"] = true,
    [".fun"] = true,
    [".josep"] = true,
    [".jnec"] = true,
    [".ipygh"] = true,
    [".killrabbit"] = true,
    [".litra"] = true,
    [".trevinomason1@mail.com.vsunit"] = true,
    [".lockify"] = true,
    [".losers"] = true,
    [".jkhnhu"] = true,
    [".mamo434376"] = true,
    [".hcked"] = true,
    [".encrypted"] = true,
    [".bomber"] = true,
    [".crptd"] = true,
    [".se"] = true,
    [".lotr"] = true,
    [".nm4"] = true,
    [".nsmf"] = true,
    [".ohno!"] = true,
    [".osiris"] = true,
    [".protected"] = true,
    [".oxr"] = true,
    [".pewcrypt"] = true,
    [".phobos"] = true,
    [".sad"] = true,
    [".sage"] = true,
    [".salsa222"] = true,
    [".satan"] = true,
    [".saturn"] = true,
    [".satyr"] = true,
    [".artemy"] = true,
    [".diskdoctor"] = true,
    [".[jackie7@asia.com]"] = true,
    [".shrug"] = true,
    [".shutupanddance"] = true,
    [".skystars"] = true,
    [".sysdown"] = true,
    [".xcri"] = true,
    [".thanatos"] = true,
    [".locked-"] = true,
    [".crrrt"] = true,
    [".via"] = true,
    [".qtyu8vh5wdxf6oswam5nua==obck"] = true,
    [".waffle"] = true,
    [".wndie"] = true,
    [".wsmile"] = true,
    [".whycry"] = true,
    [".[cho.dambler@yandex.com]"] = true,
    [".xort"] = true,
    [".zorro"] = true,
    [".files-frozen-need-to-make-payment-for-decryptor-or-all-your-files-will-be-permanenlty-deleted"] = true,
    [".mailto[sevenoneone@cock.li].b6d27"] = true,
    [".ryk"] = true,
    [".lockbit"] = true
  }
  if l_1_1[l_1_0] == true then
    return true
  end
  return false
end

function IsBasFileNoisyEncryptExt(l_2_0)
  if l_2_0 == nil or l_2_0 == "" or type(l_2_0) ~= "string" then
    return false
  end
  local l_2_1 = {
    [".enc"] = true,
    [".code"] = true,
    [".aes"] = true,
    [".dng"] = true,
    [".matrix"] = true
  }
  if l_2_1[l_2_0] == true then
    return true
  end
  return false
end

function IsBasToolFilenameContext(l_3_0, l_3_1)
  if l_3_0 == nil or type(l_3_0) ~= "string" then
    return
  end
  l_3_0 = string.lower(l_3_0)
  local l_3_2 = {
    ["sbsimulation_sb_%d+_bs_%d+_gold%.exe$"] = "safebreach",
    ["sbsimulation_sb_%d+_bs_%d+_red%.exe$"] = "safebreach",
    ["sbsimulation_sb_%d+_bs_%d+_local%.exe$"] = "safebreach",
    ["sbsimulation_sb_%d+_bs_%d+_green%.exe$"] = "safebreach",
    ["picus.simulator.exe"] = "picus"
  }
  for l_3_3, l_3_4 in pairs(l_3_2) do
    if l_3_0:match(l_3_3) then
      if l_3_1 ~= nil then
        l_3_1 = string.lower(l_3_1)
        return l_3_4 == l_3_1, l_3_4
      else
        return true, l_3_4
      end
    end
  end
  return false, nil
end

function IsBasToolLocationContext(l_4_0, l_4_1)
  if l_4_0 == nil or type(l_4_0) ~= "string" then
    return
  end
  l_4_0 = string.lower(l_4_0)
  local l_4_2 = {
    [":\\program files\\attackiq\\agent"] = "attackiq",
    [":\\program files\\cymulate\\agent"] = "cymulate",
    [":\\program files\\picus security\\picus simulation agent"] = "picus",
    [":\\program files\\safebreach\\safebreach endpoint simulator"] = "safebreach"
  }
  for l_4_3, l_4_4 in pairs(l_4_2) do
    if string.find(l_4_0, l_4_3, 1, true) or l_4_0:match(l_4_3) then
      if l_4_1 ~= nil then
        l_4_1 = string.lower(l_4_1)
        return l_4_4 == l_4_1, l_4_4
      else
        return true, l_4_4
      end
    end
  end
  return false, nil
end

function BasToolTrackProcess(l_5_0, l_5_1, l_5_2, l_5_3)
  if l_5_0 == nil then
    return
  end
  if l_5_3 == nil then
    l_5_3 = 1
  end
  local l_5_4 = "BasToolTracking"
  l_5_0 = GetRealPidForScenario(l_5_0)
  local l_5_5 = "bas-" .. l_5_0
  if l_5_1 ~= nil then
    l_5_1 = string.lower(l_5_1)
    AppendToRollingQueueNamespaced(l_5_5, l_5_4, l_5_1)
  else
    l_5_1 = "any"
  end
  AppendToRollingQueueNamespaced(l_5_5, l_5_4, "any")
  pcall(MpCommon.BmTriggerSig, l_5_0, l_5_4, l_5_1)
  if l_5_2 ~= nil and type(l_5_2) == "string" then
    l_5_2 = string.lower(l_5_2)
    AppendToRollingQueueNamespaced(l_5_5, l_5_4, l_5_2, l_5_3)
    pcall(MpCommon.BmTriggerSig, l_5_0, "BasToolTrackingContext", l_5_2)
  end
  return
end

function IsBasToolProcessForPpid(l_6_0, l_6_1, l_6_2)
  if l_6_0 == nil then
    return
  end
  local l_6_3 = "BasToolTracking"
  l_6_0 = GetRealPidForScenario(l_6_0)
  local l_6_4 = "bas-" .. l_6_0
  if l_6_1 ~= nil then
    l_6_1 = string.lower(l_6_1)
  else
    l_6_1 = "any"
  end
  local l_6_5, l_6_6 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_6_4, l_6_3, l_6_1)
  if l_6_5 and l_6_6 ~= nil and 1 <= l_6_6 then
    if l_6_2 == nil then
      return true
    end
    if l_6_2 ~= nil then
      l_6_2 = string.lower(l_6_2)
      local l_6_7, l_6_8 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_6_4, l_6_3, l_6_2)
      if l_6_7 and l_6_8 ~= nil and 1 <= l_6_8 then
        return true
      end
    end
  end
  return false
end

function IsBasToolProcessFoundInParents(l_7_0, l_7_1, l_7_2, l_7_3)
  if l_7_0 == nil then
    return
  end
  if l_7_2 == nil then
    l_7_2 = 1
  end
  if type(l_7_2) ~= "number" or 15 < l_7_2 then
    return
  end
  if l_7_2 <= 0 then
    return false
  end
  local l_7_4 = l_7_0
  l_7_0 = GetRealPidForScenario(l_7_0)
  local l_7_5 = false
  if string.lower(l_7_4) == "cmdhstr" then
    l_7_5 = IsBasToolProcessForPpid(l_7_0, l_7_1, l_7_3)
    if l_7_5 then
      return l_7_5
    end
  end
  local l_7_6 = mp.GetParentProcInfo(l_7_0)
  if l_7_6 ~= nil and l_7_6.ppid ~= nil then
    l_7_5 = IsBasToolProcessForPpid(l_7_6.ppid, l_7_1, l_7_3)
    if l_7_5 then
      return l_7_5
    else
      return IsBasToolProcessFoundInParents(l_7_6.ppid, l_7_1, l_7_2 - 1, l_7_3)
    end
  end
  return false
end

function BasToolTrackFile(l_8_0, l_8_1, l_8_2, l_8_3)
  if l_8_0 == nil then
    return
  end
  if l_8_3 == nil then
    l_8_3 = 1
  end
  local l_8_4 = normalize_path(l_8_0)
  local l_8_5 = "BasToolTracking"
  if l_8_1 ~= nil then
    l_8_1 = string.lower(l_8_1)
    AppendToRollingQueueNamespaced(l_8_4, l_8_5, l_8_1)
  else
    l_8_1 = "any"
  end
  AppendToRollingQueueNamespaced(l_8_4, l_8_5, "any")
  if l_8_2 ~= nil and type(l_8_2) == "string" then
    l_8_2 = string.lower(l_8_2)
    AppendToRollingQueueNamespaced(l_8_4, l_8_5, l_8_2, l_8_3)
  end
  return
end

function IsBasToolTrackedFile(l_9_0, l_9_1, l_9_2)
  if l_9_0 == nil then
    return
  end
  local l_9_3 = normalize_path(l_9_0)
  local l_9_4 = "BasToolTracking"
  if l_9_1 ~= nil then
    l_9_1 = string.lower(l_9_1)
  else
    l_9_1 = "any"
  end
  local l_9_5, l_9_6 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_9_0, l_9_4, l_9_1)
  if l_9_5 and l_9_6 ~= nil and 1 <= l_9_6 then
    if l_9_2 == nil then
      return true
    end
    if l_9_2 ~= nil then
      l_9_2 = string.lower(l_9_2)
      local l_9_7, l_9_8 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_9_0, l_9_4, l_9_2)
      if l_9_7 and l_9_8 ~= nil and 1 <= l_9_8 then
        return true
      end
    end
  end
  return false
end
