-- Threat: !InfrastructureShared
-- Name: 1d4b34bbf6b7a
-- Type: 21
-- Includes: BMLuaLib

reportRelatedBmHits()
addRelatedProcess()
local l_0_0 = bm.get_imagepath()
if l_0_0 ~= "" and l_0_0 ~= nil and check_common_process_linux(l_0_0) == false then
  bm.add_threat_file(l_0_0)
end
return mp.INFECTED
