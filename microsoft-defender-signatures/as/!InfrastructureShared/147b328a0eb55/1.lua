-- Threat: !InfrastructureShared
-- Name: 147b328a0eb55
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
local l_0_1 = "(?:rundll32|regsvr32)(?:.exe)?\\s+\\w:\\\\programdata\\\\[^\\\\]+\\.\\w{2,4}"
local l_0_2 = false
l_0_2, _ = MpCommon.StringRegExpSearch(l_0_1, l_0_0)
if l_0_2 then
  bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 2)
  return mp.INFECTED
end
return mp.CLEAN
