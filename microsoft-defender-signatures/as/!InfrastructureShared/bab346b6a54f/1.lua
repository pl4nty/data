-- Threat: !InfrastructureShared
-- Name: bab346b6a54f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  "MpNewlyCreatedHint_2h"
}
local l_0_2 = bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 43, l_0_1)
if l_0_2 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
