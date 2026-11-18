-- Threat: !InfrastructureShared
-- Name: 2db3fee0733c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = bm_AddRelatedFileFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if mp.IsKnownFriendlyFile(l_0_3, false, false) == false then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
