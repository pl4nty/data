-- Threat: !InfrastructureShared
-- Name: 90b38bb57221
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

bm.DisableSignature()
local l_0_0, l_0_1
if not isTamperProtectionOn() then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
end
if l_0_1 == nil then
  return mp.CLEAN
end
if not contains(l_0_1, {
  "add-mppreference",
  "set-mppreference"
}) then
  return mp.CLEAN
end
local l_0_2 = {
  "detect_host.exe",
  "powerclivmware"
}
if contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
local l_0_4 = GetFileName(l_0_3.image_path)
local l_0_5 = {"perl.exe", "python.exe"}
if contains(l_0_4, l_0_5) then
  return mp.CLEAN
end
if contains(l_0_1, {
  "add-mppreference",
  "set-mppreference"
}) and contains(l_0_1, {"-disable", "-exclusion"}) then
  bm.add_related_string("proc_cmdline", l_0_1, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_av")
  return mp.INFECTED
end
return mp.CLEAN
