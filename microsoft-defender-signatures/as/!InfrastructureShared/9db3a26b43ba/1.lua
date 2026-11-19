-- Threat: !InfrastructureShared
-- Name: 9db3a26b43ba
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\miiserver.exe", -14, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.INFECTED
