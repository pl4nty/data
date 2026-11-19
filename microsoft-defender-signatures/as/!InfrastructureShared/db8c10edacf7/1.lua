-- Threat: !InfrastructureShared
-- Name: db8c10edacf7
-- Type: 21

if mp.get_mpattribute("BM_ELF_CORE_FILE") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = {
  ".iso",
  ".img",
  "/coredump",
  "/dev/core"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3, -1 * #l_0_3, true) then
    return mp.CLEAN
  end
end
local l_0_4 = {
  "/usr/local/hostguard/",
  "/coredump/",
  "/usr/local/wsssr_defence_agent/",
  "/bin/.core",
  ".iso-",
  ".img-",
  "/libsecmodel",
  "libsystem_info"
}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if string.find(l_0_0, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
