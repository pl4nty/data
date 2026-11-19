-- Threat: !InfrastructureShared
-- Name: 98b307151eef
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = MpCommon.GetPersistContextNoPath("EmailCollection")
if l_0_0 == nil then
  l_0_0 = {}
  table.insert(l_0_0, "1")
  MpCommon.SetPersistContextNoPath("EmailCollection", l_0_0, 60)
  return mp.CLEAN
end
local l_0_1
for l_0_2, l_0_3 in ipairs(l_0_0) do
  l_0_1 = tonumber(l_0_3)
end
l_0_1 = l_0_1 + 1
if l_0_1 == 9 then
  add_parents()
  return mp.INFECTED
else
  l_0_0[1] = l_0_1
  MpCommon.OverwritePersistContextNoPath("EmailCollection", l_0_0, 60)
  return mp.CLEAN
end
return mp.CLEAN
