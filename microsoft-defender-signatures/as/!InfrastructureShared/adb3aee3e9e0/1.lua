-- Threat: !InfrastructureShared
-- Name: adb3aee3e9e0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2:lower()
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2:lower()
end
if not l_0_0 then
  return mp.CLEAN
end
if contains(l_0_0, {
  ".dll",
  ".ocx",
  ".cpl",
  ".xla",
  ".xlam",
  ".xll",
  ".vsto",
  ".olb",
  "--no-sandbox",
  "zebra_default.dat",
  "program files",
  "sogoutsf.ime",
  ".ax",
  ".wll",
  "setupinfobjectinstallaction",
  "openas_rundll",
  ".pdf",
  "shellexec_rundll",
  "\\windows\\installer\\",
  ".wcx",
  ".wsc",
  ".exe",
  "printui"
}) then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  bm.add_related_string("proc_cmdline", l_0_0, bm.RelatedStringBMReport)
end
l_0_1 = extractDllForRegproc(l_0_0)
if l_0_1 then
  l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
  if sysio.IsFileExists(l_0_1) then
    local l_0_2 = sysio.GetFileLastWriteTime(l_0_1)
    if sysio.GetLastResult().Success and l_0_2 ~= 0 then
      l_0_2 = l_0_2 / 10000000 - 11644473600
      local l_0_3 = MpCommon.GetCurrentTimeT()
      if l_0_2 > l_0_3 or 3600 < l_0_3 - l_0_2 then
        bm.add_related_file(l_0_1)
        if mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
          bm.add_threat_file(l_0_1)
        end
      end
    end
  end
end
return mp.INFECTED
