-- Threat: !InfrastructureShared
-- Name: c0b35a970302
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if not isIEXfound(l_0_0) then
  return mp.CLEAN
end
if IsSuspPSModule(l_0_0) then
  bm.add_related_string("PShellLoader_SA_cmdline", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
