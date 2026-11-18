-- Threat: !InfrastructureShared
-- Name: dbb39b890bfc
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "BMLowfiTrigger")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = MpCommon.GetPersistContext(l_0_0)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_4, "^SLF:") or string.find(l_0_4, "^ALF:") or string.find(l_0_4, "^TEL:") then
    bm.trigger_sig("BMLowfiTrigger", l_0_4)
  end
end
return mp.CLEAN
