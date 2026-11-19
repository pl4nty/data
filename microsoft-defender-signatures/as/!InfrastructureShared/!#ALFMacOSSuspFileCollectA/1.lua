-- Threat: !InfrastructureShared
-- Name: !#ALF:MacOS/SuspFileCollect.A
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & ((BM_MACOS_CORE_FILE_TYPE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen) | BM_DMG_FILE | BM_SH_FILE | BM_PY_FILE | Possible_PythonCode))

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "9d61afa0-cfa4-4746-95af-dc897a6f6774" and l_0_0:lower() ~= "3df8d417-1b4f-4b75-b289-5c016058832c" and l_0_0:lower() ~= "73a99e52-c380-4b86-9d47-fe1cb231f222" then
  return mp.CLEAN
end
if mp.getfilesize() > 52428800 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_4 = {
  "conductor",
  "Install-osquery",
  "libcxx-build-info",
  "-allocator-preload",
  "libsan-conf",
  "osquery-bandwidth-monitor",
  "register-python-argcomplete",
  "rollout-smf",
  "shell_tools",
  "shellintegration",
  "spark-daemon",
  "reinstall_msedge_",
  "dirpatcher",
  "updater_qualification_app_"
}
for l_0_5, l_0_6 in pairs(l_0_4) do
  if l_0_6 ~= nil and string.find(l_0_3, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
if string.find(l_0_2, "/bin", 1, true) == 1 or string.find(l_0_2, "/system", 1, true) == 1 or string.find(l_0_2, "/library/apple/", 1, true) == 1 or string.find(l_0_2, "/library/installersandboxes/", 1, true) == 1 or string.find(l_0_2, "/library/systemextensions/", 1, true) == 1 or string.find(l_0_2, "/.git/modules/", 1, true) or string.find(l_0_2, "/.git/hooks/", 1, true) or string.find(l_0_2, "microsoft outlook.app/contents/sharedsupport/", 1, true) or string.find(l_0_2, "/t/.com.google.chrome.", 1, true) and string.find(l_0_2, "/google", 1, true) or string.find(l_0_2, "/usr/lib/google-cloud-sdk/", 1, true) or string.find(l_0_2, "/usr/lib64/google-cloud-sdk/", 1, true) or string.find(l_0_2, "iterm.app/contents/resources/", 1, true) or string.find(l_0_2, "/sbin", 1, true) == 1 or string.find(l_0_2, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_2, "/private/var/folders/", 1, true) == 1 or string.find(l_0_2, "/usr/", 1, true) == 1 and not string.find(l_0_2, "/usr/local/", 1, true) == 1 or string.find(l_0_2, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
if SuspMacPathsToMonitor(l_0_2 .. "/" .. l_0_3, true) then
  return mp.INFECTED
end
return mp.CLEAN
