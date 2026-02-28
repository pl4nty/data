local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L1_1 = safeJsonDeserialize
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L2_1 = L1_1.type
    L3_1 = L1_1.event
    L4_1 = L1_1.weight
    L5_1 = L1_1.blocked
    L6_1 = L1_1.procInfo
    L7_1 = L1_1.parents
    L8_1 = {}
    L9_1 = {}
    L10_1 = {}
    L11_1 = contains
    L12_1 = L6_1.cmdline
    L13_1 = {}
    L14_1 = "netsvcs"
    L15_1 = "gpsvc"
    L13_1[1] = L14_1
    L13_1[2] = L15_1
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
    L11_1 = L6_1.friendly
    if not L11_1 then
      L11_1 = table
      L11_1 = L11_1.insert
      L12_1 = L10_1
      L13_1 = L6_1.pid
      L14_1 = ";"
      L15_1 = L6_1.imagePath
      L13_1 = L13_1 .. L14_1 .. L15_1
      L11_1(L12_1, L13_1)
      L11_1 = mp
      L11_1 = L11_1.ContextualExpandEnvironmentVariables
      L12_1 = L6_1.imagePath
      L11_1 = L11_1(L12_1)
      if L11_1 then
        L12_1 = mp
        L12_1 = L12_1.IsKnownFriendlyFile
        L13_1 = L11_1
        L14_1 = false
        L15_1 = true
        L12_1 = L12_1(L13_1, L14_1, L15_1)
        if L12_1 == false then
          L12_1 = table
          L12_1 = L12_1.insert
          L13_1 = L8_1
          L14_1 = L11_1
          L12_1(L13_1, L14_1)
        end
      end
    end
    L11_1 = L6_1.shellScripts
    if L11_1 then
      L11_1 = L6_1.shellScripts
      L12_1 = ipairs
      L13_1 = L11_1
      L12_1, L13_1, L14_1 = L12_1(L13_1)
      for L15_1, L16_1 in L12_1, L13_1, L14_1 do
        L17_1 = mp
        L17_1 = L17_1.ContextualExpandEnvironmentVariables
        L18_1 = L16_1
        L17_1 = L17_1(L18_1)
        if L17_1 then
          L18_1 = mp
          L18_1 = L18_1.IsKnownFriendlyFile
          L19_1 = L17_1
          L20_1 = false
          L21_1 = true
          L18_1 = L18_1(L19_1, L20_1, L21_1)
          if L18_1 == false then
            L18_1 = table
            L18_1 = L18_1.insert
            L19_1 = L8_1
            L20_1 = L17_1
            L18_1(L19_1, L20_1)
          end
        end
      end
    end
    L11_1 = L6_1.scriptInCmdline
    if L11_1 then
      L11_1 = L6_1.scriptInCmdline
      L12_1 = ipairs
      L13_1 = L11_1
      L12_1, L13_1, L14_1 = L12_1(L13_1)
      for L15_1, L16_1 in L12_1, L13_1, L14_1 do
        L17_1 = L16_1.age
        if L17_1 ~= 0 then
          L17_1 = L16_1.path
          L19_1 = L17_1
          L18_1 = L17_1.gsub
          L20_1 = "\\\\"
          L21_1 = "\\"
          L18_1 = L18_1(L19_1, L20_1, L21_1)
          L17_1 = L18_1
          L18_1 = mp
          L18_1 = L18_1.ContextualExpandEnvironmentVariables
          L19_1 = L17_1
          L18_1 = L18_1(L19_1)
          if L18_1 then
            L19_1 = mp
            L19_1 = L19_1.IsKnownFriendlyFile
            L20_1 = L18_1
            L21_1 = false
            L22_1 = true
            L19_1 = L19_1(L20_1, L21_1, L22_1)
            if L19_1 == false then
              L19_1 = table
              L19_1 = L19_1.insert
              L20_1 = L8_1
              L21_1 = L18_1
              L19_1(L20_1, L21_1)
            end
          end
        end
      end
    end
    L11_1 = ipairs
    L12_1 = L7_1
    L11_1, L12_1, L13_1 = L11_1(L12_1)
    for L14_1, L15_1 in L11_1, L12_1, L13_1 do
      L16_1 = contains
      L17_1 = L15_1.cmdline
      L18_1 = {}
      L19_1 = "netsvcs"
      L20_1 = "gpsvc"
      L18_1[1] = L19_1
      L18_1[2] = L20_1
      L16_1 = L16_1(L17_1, L18_1)
      if L16_1 then
        L16_1 = mp
        L16_1 = L16_1.CLEAN
        return L16_1
      end
      L16_1 = L15_1.friendly
      if not L16_1 then
        L16_1 = table
        L16_1 = L16_1.insert
        L17_1 = L10_1
        L18_1 = L15_1.ppid
        L19_1 = ";"
        L20_1 = L15_1.imagePath
        L18_1 = L18_1 .. L19_1 .. L20_1
        L16_1(L17_1, L18_1)
        L16_1 = mp
        L16_1 = L16_1.ContextualExpandEnvironmentVariables
        L17_1 = L15_1.imagePath
        L16_1 = L16_1(L17_1)
        if L16_1 then
          L17_1 = mp
          L17_1 = L17_1.IsKnownFriendlyFile
          L18_1 = L16_1
          L19_1 = false
          L20_1 = true
          L17_1 = L17_1(L18_1, L19_1, L20_1)
          if L17_1 == false then
            L17_1 = table
            L17_1 = L17_1.insert
            L18_1 = L8_1
            L19_1 = L16_1
            L17_1(L18_1, L19_1)
          end
        end
      end
      L16_1 = L15_1.shellScripts
      L17_1 = ipairs
      L18_1 = L16_1
      L17_1, L18_1, L19_1 = L17_1(L18_1)
      for L20_1, L21_1 in L17_1, L18_1, L19_1 do
        L22_1 = mp
        L22_1 = L22_1.ContextualExpandEnvironmentVariables
        L23_1 = L21_1
        L22_1 = L22_1(L23_1)
        if L22_1 then
          L23_1 = mp
          L23_1 = L23_1.IsKnownFriendlyFile
          L24_1 = L22_1
          L25_1 = false
          L26_1 = true
          L23_1 = L23_1(L24_1, L25_1, L26_1)
          if L23_1 == false then
            L23_1 = table
            L23_1 = L23_1.insert
            L24_1 = L8_1
            L25_1 = L22_1
            L23_1(L24_1, L25_1)
          end
        end
      end
      L17_1 = L15_1.scriptInCmdline
      if L17_1 then
        L17_1 = next
        L18_1 = L15_1.scriptInCmdline
        L17_1 = L17_1(L18_1)
        if L17_1 then
          L17_1 = L15_1.scriptInCmdline
          L18_1 = nil
          L19_1 = nil
          for L20_1, L21_1 in L17_1, L18_1, L19_1 do
            L22_1 = L21_1.age
            if L22_1 ~= 0 then
              L22_1 = L21_1.path
              L24_1 = L22_1
              L23_1 = L22_1.gsub
              L25_1 = "\\\\"
              L26_1 = "\\"
              L23_1 = L23_1(L24_1, L25_1, L26_1)
              L22_1 = L23_1
              L23_1 = mp
              L23_1 = L23_1.ContextualExpandEnvironmentVariables
              L24_1 = L22_1
              L23_1 = L23_1(L24_1)
              if L23_1 then
                L24_1 = mp
                L24_1 = L24_1.IsKnownFriendlyFile
                L25_1 = L23_1
                L26_1 = false
                L27_1 = true
                L24_1 = L24_1(L25_1, L26_1, L27_1)
                if L24_1 == false then
                  L24_1 = table
                  L24_1 = L24_1.insert
                  L25_1 = L8_1
                  L26_1 = L23_1
                  L24_1(L25_1, L26_1)
                end
              end
            end
          end
        end
      end
    end
    L11_1 = {}
    L11_1["cmd.exe"] = true
    L11_1["powershell.exe"] = true
    L11_1["wscript.exe.exe"] = true
    L12_1 = {}
    L13_1 = ipairs
    L14_1 = L8_1
    L13_1, L14_1, L15_1 = L13_1(L14_1)
    for L16_1, L17_1 in L13_1, L14_1, L15_1 do
      L18_1 = L17_1.match
      L19_1 = "([^\\]+)$"
      L18_1 = L18_1(L19_1)
      if L18_1 then
        L19_1 = L11_1[L18_1]
        if L19_1 then
          L19_1 = table
          L19_1 = L19_1.insert
          L20_1 = L12_1
          L21_1 = L17_1
          L19_1(L20_1, L21_1)
        end
      end
    end
    L8_1 = L12_1
    L13_1 = false
    L14_1 = 0
    if 30 <= L4_1 and L2_1 == "AMSI_Exclusion" then
      L16_1 = L3_1
      L15_1 = L3_1.gmatch
      L17_1 = "([^;]+)"
      L15_1, L16_1, L17_1 = L15_1(L16_1, L17_1)
      for L18_1 in L15_1, L16_1, L17_1 do
        L19_1 = MpCommon
        L19_1 = L19_1.StringRegExpSearch
        L20_1 = "(%userprofile%|%systemdrive%|%programdata%|%appdata%|%localappdata%|%windir%|%programfiles(x86)%|%programfiles%)$|(c:\\\\users\\\\.*\\\\(documents|downloads|pictures|music|videos))$|\\|\\.?(exe|dll|ps1|bat|cmd|sys)$|(\\w:(\\\\*)?\\*?%?$)"
        L21_1 = L18_1
        L19_1, L20_1 = L19_1(L20_1, L21_1)
        if L19_1 then
          L21_1 = table
          L21_1 = L21_1.insert
          L22_1 = L9_1
          L23_1 = L18_1
          L21_1(L22_1, L23_1)
          L14_1 = L14_1 + 1
        end
      end
      L13_1 = true
    end
    L15_1 = string
    L15_1 = L15_1.find
    L16_1 = L3_1
    L17_1 = "^trojan.*bulk"
    L15_1 = L15_1(L16_1, L17_1)
    if L15_1 and L2_1 == "AMSI" then
      L13_1 = true
      L14_1 = L14_1 + 1
      L15_1 = table
      L15_1 = L15_1.insert
      L16_1 = L9_1
      L17_1 = L3_1
      L15_1(L16_1, L17_1)
    end
    if 100 <= L4_1 then
      L15_1 = L6_1.avExcludedEntities
      if L15_1 then
        L15_1 = next
        L16_1 = L6_1.avExcludedEntities
        L15_1 = L15_1(L16_1)
        if L15_1 then
          L15_1 = L6_1.avExcludedEntities
          L16_1 = ipairs
          L17_1 = L8_1
          L16_1, L17_1, L18_1 = L16_1(L17_1)
          for L19_1, L20_1 in L16_1, L17_1, L18_1 do
            L21_1 = L15_1[L20_1]
            if L21_1 then
              L13_1 = true
              L21_1 = table
              L21_1 = L21_1.insert
              L22_1 = L9_1
              L23_1 = L20_1
              L21_1(L22_1, L23_1)
            end
          end
        end
      end
    end
    if not L13_1 then
      L15_1 = mp
      L15_1 = L15_1.CLEAN
      return L15_1
    end
    L15_1 = {}
    L15_1.Event = L0_1
    L15_1.FilesToRemediate = L8_1
    L15_1.ProcessesToRemediate = L10_1
    L15_1.ExclusionsToRevert = L9_1
    if (L2_1 == "AMSI" or L2_1 == "CMD") and L5_1 then
      L15_1.Reason = "BlockedTampering"
      L16_1 = bm
      L16_1 = L16_1.trigger_sig
      L17_1 = "Remediate_MassTampering_Q"
      L18_1 = safeJsonSerialize
      L19_1 = L15_1
      L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L18_1(L19_1)
      L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
      L16_1 = mp
      L16_1 = L16_1.CLEAN
      return L16_1
    end
    if 1 < L14_1 then
      L15_1.Reason = "MultipleSuspExclusions"
      L16_1 = bm
      L16_1 = L16_1.trigger_sig
      L17_1 = "Remediate_MassTampering_Z"
      L18_1 = safeJsonSerialize
      L19_1 = L15_1
      L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L18_1(L19_1)
      L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
      L16_1 = mp
      L16_1 = L16_1.CLEAN
      return L16_1
    end
    if 200 < L4_1 then
      L16_1 = next
      L17_1 = L8_1
      L16_1 = L16_1(L17_1)
      if L16_1 then
        L15_1.Reason = "HighScore_FileToRemediate"
        L16_1 = bm
        L16_1 = L16_1.trigger_sig
        L17_1 = "Remediate_MassTampering_W"
        L18_1 = safeJsonSerialize
        L19_1 = L15_1
        L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L18_1(L19_1)
        L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
        L16_1 = mp
        L16_1 = L16_1.CLEAN
        return L16_1
      end
    end
    L16_1 = bm
    L16_1 = L16_1.add_related_string
    L17_1 = "AdditionalInfo"
    L18_1 = safeJsonSerialize
    L19_1 = L15_1
    L18_1 = L18_1(L19_1)
    L19_1 = bm
    L19_1 = L19_1.RelatedStringBMReport
    L16_1(L17_1, L18_1, L19_1)
    L16_1 = mp
    L16_1 = L16_1.INFECTED
    return L16_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
