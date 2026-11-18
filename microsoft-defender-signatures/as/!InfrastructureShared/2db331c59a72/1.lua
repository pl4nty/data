-- Threat: !InfrastructureShared
-- Name: 2db331c59a72
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 then
  if string.find(l_0_0, "lmud1o4z.exe", 1, true) then
    return mp.CLEAN
  end
  if MpCommon.QueryPersistContext(l_0_0, "MasqSuspRenameTargetL2") or MpCommon.QueryPersistContext(l_0_0, "MasqSuspCopyTargetL2") then
    return mp.INFECTED
  end
end
return mp.CLEAN
