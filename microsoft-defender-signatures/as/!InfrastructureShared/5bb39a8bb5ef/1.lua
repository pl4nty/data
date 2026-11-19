-- Threat: !InfrastructureShared
-- Name: 5bb39a8bb5ef
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2:lower()
end
local l_0_1 = {
  "winword.exe",
  "excel.exe",
  "powerpnt.exe",
  "mspub.exe"
}
if not IsProcNameInParentProcessTree("BM", l_0_1) then
  return mp.CLEAN
end
if contains(l_0_0, "process.*call.*create", false) and contains(l_0_0, {
  " powershell",
  " mshta javascript:",
  " regsvr32",
  " rundll32",
  " mshta",
  " certutil"
}) then
  bm.add_related_string("proc_cmdline", l_0_0, bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
