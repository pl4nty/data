local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_SCANREASON
  L0_1 = L0_1(L1_1)
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 4) then
    goto lbl_38
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_38::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "->"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L0_1
  L4_1 = 0
  L5_1 = L1_1 - 1
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L0_1 = L2_1
  if L0_1 ~= nil then
    L2_1 = #L0_1
    if not (L2_1 < 4) then
      goto lbl_62
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
::lbl_62::
L2_1 = #L0_1
if 20 < L2_1 then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L0_1
  L4_1 = "([^\\%.]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = 0
  L6_1 = #L2_1
  L6_1 = 14 + L6_1
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L4_1 = "~1."
  L5_1 = L2_1
  L0_1 = L3_1 .. L4_1 .. L5_1
end
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = "T1547.009:persistence_target"
L7_1 = "T1547.001:persistence_target"
L8_1 = "T1547.009:LnkFileInStartup_target"
L9_1 = "T1547.009:"
L10_1 = L0_1
L9_1 = L9_1 .. L10_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L4_1["Lua:TopLevelFile.A!FileInStartup"] = L5_1
L5_1 = {}
L6_1 = "T1204.001:execution_target"
L7_1 = "T1204.001:LnkFileInDesktop_target"
L8_1 = "T1204.001:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:TopLevelFile.A!FileInUserDesktop"] = L5_1
L5_1 = {}
L6_1 = "T1204.001:execution_target"
L7_1 = "T1204.001:LnkFileInTemp_target"
L8_1 = "T1204.001:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:TopLevelFile.A!FileInAppDataLocalTemp"] = L5_1
L5_1 = {}
L6_1 = "T1204.001:execution_target"
L7_1 = "T1204.001:LnkFileInDownload_target"
L8_1 = "T1204.001:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:TopLevelFile.A!FileInUserDownloads"] = L5_1
L3_1["Lua:TopLevelFileExt.A!lnk"] = L4_1
L2_1["PACKED_WITH:[CMDEmbedded]"] = L3_1
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = "T1547.001:persistence_target"
L7_1 = "T1547.001:CmdFileInStartup_target"
L8_1 = "T1547.001:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:FileInStartupFolder"] = L5_1
L5_1 = {}
L6_1 = "T1059.003:execution_target"
L7_1 = "T1059.003:CmdFileInDesktop_target"
L8_1 = "T1059.003:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:FileInsideUserDesktopFolder"] = L5_1
L5_1 = {}
L6_1 = "T1059.003:execution_target"
L7_1 = "T1059.003:CmdFileInTemp_target"
L8_1 = "T1059.003:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:FileInsideAppDataLocalTempFolder"] = L5_1
L5_1 = {}
L6_1 = "T1059.003:execution_target"
L7_1 = "T1059.003:CmdFileInDownload_target"
L8_1 = "T1059.003:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:FileInsideUserDownloadFolder"] = L5_1
L3_1["Lua:CMDExt"] = L4_1
L4_1 = {}
L5_1 = {}
L6_1 = "T1547.001:persistence_target"
L7_1 = "T1547.001:BatFileInStartup_target"
L8_1 = "T1547.001:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:FileInStartupFolder"] = L5_1
L5_1 = {}
L6_1 = "T1059.003:execution_target"
L7_1 = "T1059.003:BatFileInDesktop_target"
L8_1 = "T1059.003:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:FileInsideUserDesktopFolder"] = L5_1
L5_1 = {}
L6_1 = "T1059.003:execution_target"
L7_1 = "T1059.003:BatFileInTemp_target"
L8_1 = "T1059.003:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:FileInsideAppDataLocalTempFolder"] = L5_1
L5_1 = {}
L6_1 = "T1059.003:execution_target"
L7_1 = "T1059.003:BatFileInDownload_target"
L8_1 = "T1059.003:"
L9_1 = L0_1
L8_1 = L8_1 .. L9_1
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L4_1["Lua:FileInsideUserDownloadFolder"] = L5_1
L3_1["Lua:BATExt"] = L4_1
L2_1["RPF:TopLevelFile"] = L3_1
L3_1 = nil
L4_1 = nil
L5_1 = pairs
L6_1 = L2_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = mp
  L10_1 = L10_1.get_mpattribute
  L11_1 = L8_1
  L10_1 = L10_1(L11_1)
  if L10_1 then
    L3_1 = L8_1
    L4_1 = L9_1
    break
  end
end
if L3_1 == nil or L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = nil
L6_1 = nil
L7_1 = nil
L8_1 = pairs
L9_1 = L4_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
for L11_1, L12_1 in L8_1, L9_1, L10_1 do
  L13_1 = mp
  L13_1 = L13_1.get_mpattribute
  L14_1 = L11_1
  L13_1 = L13_1(L14_1)
  if L13_1 then
    L13_1 = pairs
    L14_1 = L12_1
    L13_1, L14_1, L15_1 = L13_1(L14_1)
    for L16_1, L17_1 in L13_1, L14_1, L15_1 do
      L18_1 = mp
      L18_1 = L18_1.get_mpattribute
      L19_1 = L16_1
      L18_1 = L18_1(L19_1)
      if L18_1 then
        L5_1 = L17_1
        L6_1 = L11_1
        L7_1 = L16_1
        L18_1 = table
        L18_1 = L18_1.insert
        L19_1 = L5_1
        L20_1 = string
        L20_1 = L20_1.format
        L21_1 = "[%s]=%s"
        L22_1 = "Lua:CmdInFileContext.A!mpattribute"
        L23_1 = L11_1
        L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L20_1(L21_1, L22_1, L23_1)
        L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
        L18_1 = table
        L18_1 = L18_1.insert
        L19_1 = L5_1
        L20_1 = string
        L20_1 = L20_1.format
        L21_1 = "[%s]=%s"
        L22_1 = "Lua:CmdInFileContext.A!mpattribute"
        L23_1 = L16_1
        L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L20_1(L21_1, L22_1, L23_1)
        L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
        break
      end
    end
  end
end
if L5_1 == nil or L6_1 == nil or L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = tostring
L9_1 = headerpage
L8_1 = L8_1(L9_1)
if L8_1 ~= nil then
  L9_1 = #L8_1
  if not (L9_1 <= 2) then
    goto lbl_280
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_280::
L9_1 = string
L9_1 = L9_1.find
L10_1 = L8_1
L11_1 = "\000"
L12_1 = 1
L13_1 = true
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
L9_1 = L9_1 - 1
if L9_1 == nil or L9_1 <= 2 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = string
L10_1 = L10_1.lower
L11_1 = string
L11_1 = L11_1.sub
L12_1 = L8_1
L13_1 = 1
L14_1 = L9_1
L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L11_1(L12_1, L13_1, L14_1)
L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
if L3_1 == "RPF:TopLevelFile" and (L6_1 == "Lua:CMDExt" or L6_1 == "Lua:BATExt") then
  L11_1 = string
  L11_1 = L11_1.find
  L12_1 = L10_1
  L13_1 = "\n"
  L14_1 = 1
  L15_1 = true
  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
  if L11_1 ~= nil then
    L12_1 = string
    L12_1 = L12_1.gsub
    L13_1 = L10_1
    L14_1 = "\n"
    L15_1 = ""
    L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1)
    if 4 <= L13_1 then
      L14_1 = mp
      L14_1 = L14_1.CLEAN
      return L14_1
    end
    L14_1 = string
    L14_1 = L14_1.sub
    L15_1 = L12_1
    L16_1 = 1
    L17_1 = L11_1 - 1
    L14_1 = L14_1(L15_1, L16_1, L17_1)
    L10_1 = L14_1
    L14_1 = string
    L14_1 = L14_1.gsub
    L15_1 = L10_1
    L16_1 = "\r"
    L17_1 = ""
    L14_1 = L14_1(L15_1, L16_1, L17_1)
    L10_1 = L14_1
  end
end
L11_1 = mp
L11_1 = L11_1.getfilename
L12_1 = mp
L12_1 = L12_1.bitor
L13_1 = mp
L13_1 = L13_1.FILEPATH_QUERY_PATH
L14_1 = mp
L14_1 = L14_1.FILEPATH_QUERY_LOWERCASE
L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L12_1(L13_1, L14_1)
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
if L7_1 == "Lua:TopLevelFile.A!FileInStartup" or L7_1 == "Lua:FileInStartupFolder" then
  L12_1 = 3689015643
  L13_1 = {}
  L14_1 = "BM_MT1547.001:persistence"
  L13_1[1] = L14_1
  L14_1 = "BM_MT1547.001:StartupFileTarget.A"
  if L6_1 == "Lua:TopLevelFileExt.A!lnk" then
    L12_1 = 4230219827
    L14_1 = "BM_MT1547.009:StartupLnkFileTarget.A"
    L15_1 = table
    L15_1 = L15_1.insert
    L16_1 = L13_1
    L17_1 = "BM_MT1547.009:persistence"
    L15_1(L16_1, L17_1)
    L15_1 = table
    L15_1 = L15_1.insert
    L16_1 = L13_1
    L17_1 = "Lua:LnkFileInStartupWithSuspTarget"
    L15_1(L16_1, L17_1)
  elseif L6_1 == "Lua:CMDExt" then
    L12_1 = 4089264960
    L14_1 = "BM_MT1547.001:StartupCmdFileTarget.A"
    L15_1 = table
    L15_1 = L15_1.insert
    L16_1 = L13_1
    L17_1 = "Lua:CmdFileInStartupWithSuspTarget"
    L15_1(L16_1, L17_1)
  elseif L6_1 == "Lua:BATExt" then
    L12_1 = 3568621407
    L14_1 = "BM_MT1547.001:StartupBatFileTarget.A"
    L15_1 = table
    L15_1 = L15_1.insert
    L16_1 = L13_1
    L17_1 = "Lua:BatFileInStartupWithSuspTarget"
    L15_1(L16_1, L17_1)
  end
  L15_1 = mp
  L15_1 = L15_1.GetExecutablesFromCommandLine
  L16_1 = L10_1
  L15_1 = L15_1(L16_1)
  L16_1 = ipairs
  L17_1 = L15_1
  L16_1, L17_1, L18_1 = L16_1(L17_1)
  for L19_1, L20_1 in L16_1, L17_1, L18_1 do
    L21_1 = #L20_1
    if 3 < L21_1 then
      L21_1 = string
      L21_1 = L21_1.sub
      L22_1 = L20_1
      L23_1 = 1
      L24_1 = 3
      L21_1 = L21_1(L22_1, L23_1, L24_1)
      if L21_1 == "..\\" then
        L21_1 = expandRelativePath
        L22_1 = L20_1
        L23_1 = L11_1
        L21_1 = L21_1(L22_1, L23_1)
        L20_1 = L21_1
      end
    end
    L21_1 = mp
    L21_1 = L21_1.ContextualExpandEnvironmentVariables
    L22_1 = L20_1
    L21_1 = L21_1(L22_1)
    L20_1 = L21_1
    L21_1 = isLolbinFile
    L22_1 = L20_1
    L21_1 = L21_1(L22_1)
    if L21_1 == false then
      L21_1 = sysio
      L21_1 = L21_1.IsFileExists
      L22_1 = L20_1
      L21_1 = L21_1(L22_1)
      if L21_1 then
        L21_1 = checkFileLastWriteTime
        L22_1 = L20_1
        L23_1 = 21600
        L21_1 = L21_1(L22_1, L23_1)
        if L21_1 == false then
          L21_1 = mp
          L21_1 = L21_1.IsKnownFriendlyFile
          L22_1 = L20_1
          L23_1 = false
          L24_1 = false
          L21_1 = L21_1(L22_1, L23_1, L24_1)
          if L21_1 == false then
            L21_1 = TrackFileAndTechnique
            L22_1 = L20_1
            L23_1 = L5_1
            L21_1(L22_1, L23_1)
            L21_1 = TrackFileAndTechnique
            L22_1 = L20_1
            L23_1 = L14_1
            L21_1(L22_1, L23_1)
            L21_1 = ipairs
            L22_1 = L13_1
            L21_1, L22_1, L23_1 = L21_1(L22_1)
            for L24_1, L25_1 in L21_1, L22_1, L23_1 do
              L26_1 = mp
              L26_1 = L26_1.set_mpattribute
              L27_1 = L25_1
              L26_1(L27_1)
            end
            L21_1 = mp
            L21_1 = L21_1.ReportLowfi
            L22_1 = L20_1
            L23_1 = L12_1
            L21_1(L22_1, L23_1)
          end
        end
      end
    end
  end
end
if L7_1 == "Lua:TopLevelFile.A!FileInStartup" or L7_1 == "Lua:FileInStartupFolder" then
  L12_1 = string
  L12_1 = L12_1.sub
  L13_1 = L10_1
  L14_1 = 1
  L15_1 = 3
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  if L12_1 == "..\\" then
    L12_1 = expandRelativePath
    L13_1 = L10_1
    L14_1 = L11_1
    L12_1 = L12_1(L13_1, L14_1)
    L10_1 = L12_1
    if L10_1 == nil then
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
  end
end
L12_1 = getCustomStringHash
L13_1 = L10_1
L12_1 = L12_1(L13_1)
if L12_1 == nil then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = "CommandLineCustomHash:"
L14_1 = L12_1
L13_1 = L13_1 .. L14_1
L14_1 = mp
L14_1 = L14_1.getfilename
L14_1 = L14_1()
if L14_1 ~= nil then
  L15_1 = #L14_1
  if 3 < L15_1 then
    L15_1 = string
    L15_1 = L15_1.find
    L16_1 = L14_1
    L17_1 = "->"
    L18_1 = 1
    L19_1 = true
    L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
    if L15_1 ~= nil and 4 < L15_1 then
      L16_1 = string
      L16_1 = L16_1.sub
      L17_1 = L14_1
      L18_1 = 0
      L19_1 = L15_1 - 1
      L16_1 = L16_1(L17_1, L18_1, L19_1)
      L14_1 = L16_1
    end
    L16_1 = normalize_path
    L17_1 = L14_1
    L16_1 = L16_1(L17_1)
    L14_1 = L16_1
    L16_1 = string
    L16_1 = L16_1.format
    L17_1 = "[%s]=%s"
    L18_1 = "Lua:CmdInFileContext.A!file"
    L19_1 = L14_1
    L16_1 = L16_1(L17_1, L18_1, L19_1)
    L17_1 = table
    L17_1 = L17_1.insert
    L18_1 = L5_1
    L19_1 = L16_1
    L17_1(L18_1, L19_1)
  end
end
L15_1 = ipairs
L16_1 = L5_1
L15_1, L16_1, L17_1 = L15_1(L16_1)
for L18_1, L19_1 in L15_1, L16_1, L17_1 do
  L20_1 = MpCommon
  L20_1 = L20_1.QueryPersistContextNoPath
  L21_1 = L13_1
  L22_1 = L19_1
  L20_1 = L20_1(L21_1, L22_1)
  if not L20_1 then
    L20_1 = MpCommon
    L20_1 = L20_1.AppendPersistContextNoPath
    L21_1 = L13_1
    L22_1 = L19_1
    L23_1 = 0
    L20_1(L21_1, L22_1, L23_1)
  end
end
L15_1 = mp
L15_1 = L15_1.CLEAN
return L15_1
