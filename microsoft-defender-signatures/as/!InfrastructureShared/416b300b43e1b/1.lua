-- Threat: !InfrastructureShared
-- Name: 416b300b43e1b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = isTamperProtectionOn(false)
if not l_0_0 then
  return mp.CLEAN
end
if (this_sigattrlog[24].matched or this_sigattrlog[25].matched) and not versioning.IsSeville() then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_1 then
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if l_0_4.ppid and l_0_4.reason_ex and mp.bitand(l_0_4.reason_ex, 1) == 1 then
      bm.add_related_process(l_0_4.ppid)
    end
  end
end
bm.add_related_string("TpState", tostring(l_0_0), bm.RelatedStringBMReport)
return mp.INFECTED
