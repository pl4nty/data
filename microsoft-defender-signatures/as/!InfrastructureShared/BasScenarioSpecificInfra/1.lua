-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\BasScenarioSpecificInfra\1.luac 

-- params : ...
-- function num : 0
IsBasFileEncryptExt = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil or l_1_0 == "" or type(l_1_0) ~= "string" then
    return false
  end
  local l_1_1 = {}
  l_1_1[".oops"] = true
  l_1_1[".locky"] = true
  l_1_1[".amnesia"] = true
  l_1_1[".arena"] = true
  l_1_1[".locked"] = true
  l_1_1[".exo"] = true
  l_1_1[".tron"] = true
  l_1_1[".wamarlocked"] = true
  l_1_1[".obfuscated"] = true
  l_1_1[".bitkangoroo"] = true
  l_1_1[".gollum"] = true
  l_1_1[".hainhc"] = true
  l_1_1[".bworm"] = true
  l_1_1[".xf4g-vbrt-3v78"] = true
  l_1_1[".cerber"] = true
  l_1_1[".chip"] = true
  l_1_1[".clop"] = true
  l_1_1[".crazy"] = true
  l_1_1[".crypt12"] = true
  l_1_1[".cryptolocker"] = true
  l_1_1[".dcrtr"] = true
  l_1_1[".defender"] = true
  l_1_1[".deria"] = true
  l_1_1[".dmr64"] = true
  l_1_1[".cry"] = true
  l_1_1[".crypt888"] = true
  l_1_1[".flyper"] = true
  l_1_1[".frog"] = true
  l_1_1[".frs"] = true
  l_1_1[".ftcode"] = true
  l_1_1[".crab"] = true
  l_1_1[".garrantydecrypt"] = true
  l_1_1[".ghost"] = true
  l_1_1[".godra"] = true
  l_1_1[".yc5pdbhp"] = true
  l_1_1[".crypted"] = true
  l_1_1[".havoccrypt"] = true
  l_1_1[".hilda!"] = true
  l_1_1[".horros"] = true
  l_1_1[".encry"] = true
  l_1_1[".jaff"] = true
  l_1_1[".james"] = true
  l_1_1[".fun"] = true
  l_1_1[".josep"] = true
  l_1_1[".jnec"] = true
  l_1_1[".ipygh"] = true
  l_1_1[".killrabbit"] = true
  l_1_1[".litra"] = true
  l_1_1[".trevinomason1@mail.com.vsunit"] = true
  l_1_1[".lockify"] = true
  l_1_1[".losers"] = true
  l_1_1[".jkhnhu"] = true
  l_1_1[".mamo434376"] = true
  l_1_1[".hcked"] = true
  l_1_1[".matrix"] = true
  l_1_1[".encrypted"] = true
  l_1_1[".bomber"] = true
  l_1_1[".crptd"] = true
  l_1_1[".se"] = true
  l_1_1[".lotr"] = true
  l_1_1[".nm4"] = true
  l_1_1[".nsmf"] = true
  l_1_1[".ohno!"] = true
  l_1_1[".osiris"] = true
  l_1_1[".protected"] = true
  l_1_1[".oxr"] = true
  l_1_1[".dng"] = true
  l_1_1[".pewcrypt"] = true
  l_1_1[".phobos"] = true
  l_1_1[".sad"] = true
  l_1_1[".sage"] = true
  l_1_1[".salsa222"] = true
  l_1_1[".satan"] = true
  l_1_1[".saturn"] = true
  l_1_1[".satyr"] = true
  l_1_1[".artemy"] = true
  l_1_1[".diskdoctor"] = true
  l_1_1[".[jackie7@asia.com]"] = true
  l_1_1[".shrug"] = true
  l_1_1[".shutupanddance"] = true
  l_1_1[".skystars"] = true
  l_1_1[".sysdown"] = true
  l_1_1[".xcri"] = true
  l_1_1[".thanatos"] = true
  l_1_1[".locked-"] = true
  l_1_1[".crrrt"] = true
  l_1_1[".via"] = true
  l_1_1[".qtyu8vh5wdxf6oswam5nua==obck"] = true
  l_1_1[".waffle"] = true
  l_1_1[".wndie"] = true
  l_1_1[".wsmile"] = true
  l_1_1[".whycry"] = true
  l_1_1[".[cho.dambler@yandex.com]"] = true
  l_1_1[".xort"] = true
  l_1_1[".zorro"] = true
  l_1_1[".files-frozen-need-to-make-payment-for-decryptor-or-all-your-files-will-be-permanenlty-deleted"] = true
  l_1_1[".mailto[sevenoneone@cock.li].b6d27"] = true
  l_1_1[".ryk"] = true
  if l_1_1[l_1_0] == true then
    return true
  end
  return false
end

IsBasFileNoisyEncryptExt = function(l_2_0)
  -- function num : 0_1
  if l_2_0 == nil or l_2_0 == "" or type(l_2_0) ~= "string" then
    return false
  end
  local l_2_1 = {}
  l_2_1[".enc"] = true
  l_2_1[".code"] = true
  l_2_1[".aes"] = true
  if l_2_1[l_2_0] == true then
    return true
  end
  return false
end

IsBasToolFilenameContext = function(l_3_0, l_3_1)
  -- function num : 0_2
  if l_3_0 == nil or type(l_3_0) ~= "string" then
    return 
  end
  l_3_0 = (string.lower)(l_3_0)
  do
    local l_3_2 = {}
    l_3_2["sbsimulation_sb_%d+_bs_%d+_gold%.exe$"] = "safebreach"
    l_3_2["sbsimulation_sb_%d+_bs_%d+_red%.exe$"] = "safebreach"
    l_3_2["sbsimulation_sb_%d+_bs_%d+_local%.exe$"] = "safebreach"
    l_3_2["sbsimulation_sb_%d+_bs_%d+_green%.exe$"] = "safebreach"
    l_3_2["picus.simulator.exe"] = "picus"
    for l_3_6,l_3_7 in pairs(l_3_2) do
      if l_3_0:match(l_3_6) then
        if l_3_1 ~= nil then
          l_3_1 = (string.lower)(l_3_1)
          return l_3_7 == l_3_1, l_3_7
        else
          return true, l_3_7
        end
      end
    end
    do return false, nil end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

BasToolTrackProcess = function(l_4_0, l_4_1, l_4_2, l_4_3)
  -- function num : 0_3
  if l_4_0 == nil then
    return 
  end
  if l_4_3 == nil then
    l_4_3 = 1
  end
  local l_4_4 = "BasToolTracking"
  l_4_0 = GetRealPidForScenario(l_4_0)
  local l_4_5 = "bas-" .. l_4_0
  if l_4_1 ~= nil then
    l_4_1 = (string.lower)(l_4_1)
    AppendToRollingQueueNamespaced(l_4_5, l_4_4, l_4_1)
  else
    l_4_1 = "any"
  end
  AppendToRollingQueueNamespaced(l_4_5, l_4_4, "any")
  pcall(MpCommon.BmTriggerSig, l_4_0, l_4_4, l_4_1)
  if l_4_2 ~= nil and type(l_4_2) == "string" then
    l_4_2 = (string.lower)(l_4_2)
    AppendToRollingQueueNamespaced(l_4_5, l_4_4, l_4_2, l_4_3)
    pcall(MpCommon.BmTriggerSig, l_4_0, "BasToolTrackingContext", l_4_2)
  end
  return 
end

IsBasToolProcessForPpid = function(l_5_0, l_5_1, l_5_2)
  -- function num : 0_4
  if l_5_0 == nil then
    return 
  end
  local l_5_3 = "BasToolTracking"
  l_5_0 = GetRealPidForScenario(l_5_0)
  local l_5_4 = "bas-" .. l_5_0
  if l_5_1 ~= nil then
    l_5_1 = (string.lower)(l_5_1)
  else
    l_5_1 = "any"
  end
  local l_5_5, l_5_6 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_5_4, l_5_3, l_5_1)
  if l_5_5 and l_5_6 ~= nil and l_5_6 >= 1 then
    if l_5_2 == nil then
      return true
    end
    if l_5_2 ~= nil then
      l_5_2 = (string.lower)(l_5_2)
      local l_5_7, l_5_8 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_5_4, l_5_3, l_5_2)
      if l_5_7 and l_5_8 ~= nil and l_5_8 >= 1 then
        return true
      end
    end
  end
  do
    return false
  end
end

IsBasToolProcessFoundInParents = function(l_6_0, l_6_1, l_6_2, l_6_3)
  -- function num : 0_5
  if l_6_0 == nil then
    return 
  end
  if l_6_2 == nil then
    l_6_2 = 1
  end
  if type(l_6_2) ~= "number" or l_6_2 > 15 then
    return 
  end
  if l_6_2 <= 0 then
    return false
  end
  local l_6_4 = l_6_0
  l_6_0 = GetRealPidForScenario(l_6_0)
  local l_6_5 = false
  if (string.lower)(l_6_4) == "cmdhstr" then
    l_6_5 = IsBasToolProcessForPpid(l_6_0, l_6_1, l_6_3)
    if l_6_5 then
      return l_6_5
    end
  end
  local l_6_6 = (mp.GetParentProcInfo)(l_6_0)
  if l_6_6 ~= nil and l_6_6.ppid ~= nil then
    l_6_5 = IsBasToolProcessForPpid(l_6_6.ppid, l_6_1, l_6_3)
    if l_6_5 then
      return l_6_5
    else
      local l_6_7 = IsBasToolProcessFoundInParents
      local l_6_8 = l_6_6.ppid
      local l_6_9 = l_6_1
      local l_6_10 = l_6_2 - 1
      do
        local l_6_11 = l_6_3
        do return l_6_7(l_6_8, l_6_9, l_6_10, l_6_11) end
        -- DECOMPILER ERROR at PC65: Confused about usage of register R8 for local variables in 'ReleaseLocals'

        do return false end
        -- DECOMPILER ERROR at PC67: Confused about usage of register R7 for local variables in 'ReleaseLocals'

      end
    end
  end
end

BasToolTrackFile = function(l_7_0, l_7_1, l_7_2, l_7_3)
  -- function num : 0_6
  if l_7_0 == nil then
    return 
  end
  if l_7_3 == nil then
    l_7_3 = 1
  end
  local l_7_4 = normalize_path(l_7_0)
  local l_7_5 = "BasToolTracking"
  if l_7_1 ~= nil then
    l_7_1 = (string.lower)(l_7_1)
    AppendToRollingQueueNamespaced(l_7_4, l_7_5, l_7_1)
  else
    l_7_1 = "any"
  end
  AppendToRollingQueueNamespaced(l_7_4, l_7_5, "any")
  if l_7_2 ~= nil and type(l_7_2) == "string" then
    l_7_2 = (string.lower)(l_7_2)
    AppendToRollingQueueNamespaced(l_7_4, l_7_5, l_7_2, l_7_3)
  end
  return 
end

IsBasToolTrackedFile = function(l_8_0, l_8_1, l_8_2)
  -- function num : 0_7
  if l_8_0 == nil then
    return 
  end
  local l_8_3 = normalize_path(l_8_0)
  local l_8_4 = "BasToolTracking"
  if l_8_1 ~= nil then
    l_8_1 = (string.lower)(l_8_1)
  else
    l_8_1 = "any"
  end
  local l_8_5, l_8_6 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_8_0, l_8_4, l_8_1)
  if l_8_5 and l_8_6 ~= nil and l_8_6 >= 1 then
    if l_8_2 == nil then
      return true
    end
    if l_8_2 ~= nil then
      l_8_2 = (string.lower)(l_8_2)
      local l_8_7, l_8_8 = pcall(MpCommon.RollingQueueCountValuesForKeyNamespaced, l_8_0, l_8_4, l_8_2)
      if l_8_7 and l_8_8 ~= nil and l_8_8 >= 1 then
        return true
      end
    end
  end
  do
    return false
  end
end


