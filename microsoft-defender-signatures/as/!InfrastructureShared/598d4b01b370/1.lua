-- Threat: !InfrastructureShared
-- Name: 598d4b01b370
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "/bin/", 1, true) == 1 or string.find(l_0_0, "/system/", 1, true) == 1 or string.find(l_0_0, "/sbin/", 1, true) == 1 or string.find(l_0_0, "/library/apple/", 1, true) == 1 or string.find(l_0_0, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_0, "/usr/", 1, true) == 1 and not string.find(l_0_0, "/usr/local/", 1, true) == 1 or string.find(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
if mp.get_mpattribute("macho_mh_dylib") then
  return mp.INFECTED
end
return mp.CLEAN
