-- Threat: !InfrastructureShared
-- Name: 208b3be37ffbb
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[10].utf8p1))
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
return mp.INFECTED
