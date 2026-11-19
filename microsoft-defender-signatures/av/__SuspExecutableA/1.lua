-- Threat: \xd8\xe1SuspExecutable.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & ((BM_MACOS_CORE_FILE_TYPE | BM_SH_FILE | BM_PY_FILE | Possible_PythonCode))

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE or l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, "/bin/", 1, true) == 1 or string.find(l_0_1, "/system/", 1, true) == 1 or string.find(l_0_1, "/sbin/", 1, true) == 1 or string.find(l_0_1, "/library/apple/", 1, true) == 1 or string.find(l_0_1, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_1, "/usr/", 1, true) == 1 and not string.find(l_0_1, "/usr/local/", 1, true) == 1 or string.find(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
if string.find(l_0_1, "empyre", 1, true) or string.find(l_0_1, "metasploit", 1, true) or string.find(l_0_1, "edr_attack", 1, true) then
  local l_0_3 = {
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
  for l_0_4, l_0_5 in pairs(l_0_3) do
    if l_0_5 ~= nil and string.find(l_0_2, l_0_5, 1, true) then
      mp.set_mpattribute("BM_SuspFilename")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
