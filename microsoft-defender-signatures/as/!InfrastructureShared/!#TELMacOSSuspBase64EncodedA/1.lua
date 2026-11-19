-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspBase64Encoded.A
-- Type: 13
-- MpAttributes: (HSTR:MacOS/SuspBase64Encoded)

if mp.getfilesize() > 52428800 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = l_0_0 .. "/" .. l_0_1
if string.find(l_0_0, "/bin", 1, true) == 1 or string.find(l_0_0, "/.git/modules/", 1, true) or string.find(l_0_0, "/.git/hooks/", 1, true) or string.find(l_0_0, "/sbin", 1, true) == 1 or string.find(l_0_0, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_0, "/private/var/folders/", 1, true) == 1 or string.find(l_0_0, "/usr/", 1, true) == 1 and not string.find(l_0_0, "/usr/local/", 1, true) == 1 or string.find(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
if l_0_2 then
  MpCommon.BmTriggerSig(l_0_2, "BM_DefenseEvasion_EmbeddedPayload", l_0_3)
end
return mp.INFECTED
