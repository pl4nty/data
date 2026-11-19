-- Threat: !InfrastructureShared
-- Name: 19b3d7546e5a
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "printisolationhost.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p1
end
if l_0_1 then
  if string.find(l_0_1, "lmud1o4z.exe", 1, true) then
    return mp.CLEAN
  end
  if MpCommon.QueryPersistContext(l_0_1, "MasqSuspRenameTarget") or MpCommon.QueryPersistContext(l_0_1, "MasqSuspCopyTarget") then
    return mp.INFECTED
  end
end
return mp.CLEAN
