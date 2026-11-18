-- Threat: !InfrastructureShared
-- Name: !#RtpLogSkipMac
-- Type: 26

local function l_0_0(l_1_0, l_1_1)
  return l_1_1 ~= nil and l_1_0 ~= nil and #l_1_0 >= #l_1_1 and string.find(l_1_0, l_1_1, 1, true)
end

local function l_0_1(l_2_0, l_2_1)
  return l_2_1 ~= nil and l_2_0 ~= nil and #l_2_0 >= #l_2_1 and string.sub(l_2_0, 1, string.len(l_2_1)) == l_2_1
end

local function l_0_2(l_3_0, l_3_1)
  return l_3_1 ~= nil and l_3_0 ~= nil and #l_3_0 >= #l_3_1 and (l_3_1 == "" or string.sub(l_3_0, -string.len(l_3_1)) == l_3_1)
end

local function l_0_3(l_4_0, l_4_1)
  return l_4_1 ~= nil and l_4_0 ~= nil and #l_4_0 == #l_4_1 and l_4_0 == l_4_1
end

local l_0_4 = skip.get_contextdata(skip.CONTEXT_DATA_PROCESSNAME)
local l_0_5 = skip.get_contextdata(skip.CONTEXT_DATA_FILEPATH)
local l_0_6 = skip.get_contextdata(skip.CONTEXT_DATA_PROCESSDEVICEPATH)
local l_0_7 = skip.get_contextdata(skip.CONTEXT_DATA_FILENAME)
if l_0_3(l_0_4, "mdbulkimport") and l_0_1(l_0_6, "/System/Library/Frameworks/CoreServices.framework") then
  return 1
end
if l_0_3(l_0_4, "Google Chrome") and l_0_3(l_0_6, "/Applications/Google Chrome.app/Contents/MacOS") then
  if l_0_2(l_0_5, "/Library/Caches/Google/Chrome/Default/Code Cache/js") then
    return 1
  elseif l_0_2(l_0_7, ".ldb") or l_0_2(l_0_7, ".pak") or l_0_2(l_0_7, ".db") or l_0_2(l_0_7, ".log") or l_0_2(l_0_7, ".tflite") or l_0_2(l_0_7, ".leveldb") then
    return 1
  end
  return 0
end
if l_0_1(l_0_4, "Google Chrome Helper") and (l_0_2(l_0_6, "/Helpers/Google Chrome Helper.app/Contents/MacOS") or l_0_2(l_0_6, "/Helpers/Google Chrome Helper (Renderer).app/Contents/MacOS")) then
  if l_0_2(l_0_5, "/Library/Caches/Google/Chrome/Default/Cache/Cache_Data") then
    return 1
  elseif l_0_2(l_0_7, ".ldb") or l_0_2(l_0_7, ".pak") or l_0_2(l_0_7, ".db") or l_0_2(l_0_7, ".log") or l_0_2(l_0_7, ".tflite") or l_0_2(l_0_7, ".leveldb") then
    return 1
  end
  return 0
end
if l_0_3(l_0_4, "hg.real") then
  if l_0_0(l_0_5, "/fbsource") then
    return 1
  end
  return 0
end
if l_0_1(l_0_6, "/Applications/Parallels Desktop.app/Contents/MacOS") then
  if l_0_2(l_0_7, ".log") then
    return 1
  end
  return 0
end
if l_0_3(l_0_4, "Microsoft PowerPoint") then
  if l_0_1(l_0_7, "login.keychain-db") and l_0_2(l_0_5, "/Library/Keychains") then
    return 1
  end
  return 0
end
if l_0_3(l_0_4, "Microsoft Outlook") and l_0_3(l_0_6, "/Applications/Microsoft Outlook.app/Contents/MacOS") then
  if l_0_1(l_0_7, "login.keychain-db") and l_0_2(l_0_5, "/Library/Keychains") then
    return 1
  end
  return 0
end
if l_0_3(l_0_4, "Microsoft Teams Helper") and l_0_3(l_0_6, "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper.app/Contents/MacOS") then
  if l_0_2(l_0_5, "/Library/Application Support/Microsoft/Teams/Cache") then
    return 1
  end
  return 0
end
if l_0_3(l_0_4, "Teams") and l_0_3(l_0_6, "/Applications/Microsoft Teams.app/Contents/MacOS") then
  if l_0_3(l_0_7, "json") and l_0_2(l_0_5, "Library/Application Support/Microsoft/Teams") then
    return 1
  end
  if l_0_1(l_0_7, "login.keychain-db") and l_0_2(l_0_5, "/Library/Keychains") then
    return 1
  end
  return 0
end
if l_0_3(l_0_4, "Microsoft Word") and l_0_3(l_0_6, "/Applications/Microsoft Word.app/Contents/MacOS") then
  if l_0_1(l_0_7, "login.keychain-db") and l_0_2(l_0_5, "/Library/Keychains") then
    return 1
  end
  return 0
end
if l_0_3(l_0_4, "Microsoft Excel") and l_0_3(l_0_6, "/Applications/Microsoft Excel.app/Contents/MacOS") then
  if l_0_1(l_0_7, "login.keychain-db") and l_0_2(l_0_5, "/Library/Keychains") then
    return 1
  end
  return 0
end
if l_0_3(l_0_4, "Microsoft OneNote") and l_0_3(l_0_6, "/Applications/Microsoft OneNote.app/Contents/MacOS") then
  if l_0_1(l_0_7, "login.keychain-db") and l_0_2(l_0_5, "/Library/Keychains") then
    return 1
  end
  return 0
end
return 0
