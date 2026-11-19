-- Threat: !InfrastructureShared
-- Name: 100b3b2c1253e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2:lower()
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2:lower()
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = {
  "regsvr32.*%:?%.?%.?\\",
  "rundll32.*\\.*"
}
if not contains(l_0_0, l_0_2, false) then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  bm.add_related_string("proc_cmdline", l_0_0, bm.RelatedStringBMReport)
end
l_0_1 = extractDllForRegproc(l_0_0)
if l_0_1 then
  l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_1)
  if sysio.IsFileExists(l_0_1) then
    bm.add_threat_file(l_0_1)
  end
end
return mp.INFECTED
