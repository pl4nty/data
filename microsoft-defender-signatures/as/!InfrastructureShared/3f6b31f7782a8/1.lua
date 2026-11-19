-- Threat: !InfrastructureShared
-- Name: 3f6b31f7782a8
-- Type: 21
-- Includes: BMLuaLib

bm.DisableSignature()
local l_0_0, l_0_1
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if not contains(l_0_1, "downloadstring") then
    return mp.CLEAN
  end
  l_0_0 = l_0_1
end
if not isIEXfound(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = {
  "raw.githubusercontent.com"
}
if contains(l_0_0, l_0_2) and IsSuspPSModule(l_0_0) then
  bm.add_related_string("PSPublicStager_c_cmdline", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
