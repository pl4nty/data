-- Threat: !InfrastructureShared
-- Name: !#ALF:MacOS/SuspExecutable.X
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & ((BM_MACOS_CORE_FILE_TYPE | BM_XAR_ARCHIVE_FILE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen) | BM_SH_FILE | BM_PY_FILE | Lua:PYExt | Possible_PythonCode))

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "/bin/", 1, true) == 1 or string.find(l_0_0, "/system/", 1, true) == 1 or string.find(l_0_0, "/sbin/", 1, true) == 1 or string.find(l_0_0, "/library/apple/", 1, true) == 1 or string.find(l_0_0, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_0, "/usr/", 1, true) == 1 and not string.find(l_0_0, "/usr/local/", 1, true) == 1 or string.find(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
if string.find(l_0_0, "empyre", 1, true) or string.find(l_0_0, "metasploit", 1, true) or string.find(l_0_0, "edr_attack", 1, true) then
  local l_0_2 = {
    "ransomware",
    "coinminer",
    "dylibhijack",
    "cronjob",
    "trojan",
    "backdoor",
    "mettle",
    "phish",
    "meterpreter",
    "exploit",
    "payload"
  }
  for l_0_3, l_0_4 in pairs(l_0_2) do
    if l_0_4 ~= nil and string.find(l_0_1, l_0_4, 1, true) then
      mp.set_mpattribute("BM_SuspFilename")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
