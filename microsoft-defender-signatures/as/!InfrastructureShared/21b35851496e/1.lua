-- Threat: !InfrastructureShared
-- Name: 21b35851496e
-- Type: 21

local l_0_0 = this_sigattrlog[1]
if not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_0.utf8p1
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_0.ppid
if not l_0_3 then
  return mp.CLEAN
end
if MpCommon.IsFriendlyProcess(l_0_3) then
  return mp.CLEAN
end
bm.add_related_string("vm_sz", l_0_2, bm.RelatedStringBMReport)
return mp.INFECTED
