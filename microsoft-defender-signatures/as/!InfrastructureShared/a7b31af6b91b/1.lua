-- Threat: !InfrastructureShared
-- Name: a7b31af6b91b
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = {}
if this_sigattrlog[2].matched then
  local l_0_1 = this_sigattrlog[2].utf8p1
  local l_0_2 = this_sigattrlog[2].utf8p2
  table.insert(l_0_0, {
    Event = "ProcessCreate_0",
    ImagePath = l_0_1,
    P2 = l_0_2
  })
end
if this_sigattrlog[3].matched then
  local l_0_3 = this_sigattrlog[3].utf8p1
  local l_0_4 = this_sigattrlog[3].utf8p2
  table.insert(l_0_0, {
    Event = "OpenProc_0",
    ImagePath = l_0_3,
    P2 = l_0_4
  })
end
if this_sigattrlog[4].matched then
  local l_0_5 = this_sigattrlog[4].utf8p1
  local l_0_6 = this_sigattrlog[4].utf8p2
  table.insert(l_0_0, {
    Event = "ProcessCreate_1",
    ImagePath = l_0_5,
    P2 = l_0_6
  })
end
bm.add_related_string("AdditionalInfo", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
