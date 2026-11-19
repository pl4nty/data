-- Threat: !InfrastructureShared
-- Name: 17fb31b3d7efc
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
local l_0_1 = MpCommon.GetPersistContextNoPath("lnkarg_sb")
if not l_0_1 then
  return mp.CLEAN
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
else
  return mp.CLEAN
end
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if contains(l_0_0, l_0_3) then
    return mp.INFECTED
  end
end
return mp.CLEAN
