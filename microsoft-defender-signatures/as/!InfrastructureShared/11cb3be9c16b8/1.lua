-- Threat: !InfrastructureShared
-- Name: 11cb3be9c16b8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = 30000000
local l_0_1 = bm.GetSignatureMatchDuration()
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED
