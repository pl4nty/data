-- Threat: !InfrastructureShared
-- Name: 167b3ffd9cd25
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = string.match(this_sigattrlog[1].utf8p2, ";vmbaseaddress:(%d+)")
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = mp.bitand(mp.shr64(l_0_0, 24), 16777215)
  if l_0_1 == nil or l_0_1 == 0 then
    return mp.CLEAN
  end
  local l_0_2 = this_sigattrlog[1].utf8p1
  local l_0_3, l_0_4 = string.match(l_0_2, "targetprocessppid:(%d+):(%d+)")
  if not l_0_3 or not l_0_4 then
    return mp.CLEAN
  end
  local l_0_5 = string.format("pid:%s,ProcessStart:%s", l_0_3, l_0_4)
  local l_0_6, l_0_7 = bm.get_process_relationships()
  l_0_7 = table_ipairs_filter(l_0_7, {
    "reason",
    bm.RELATIONSHIP_CREATED,
    "ppid",
    l_0_5
  })
  if isnull(l_0_7) or l_0_7 == 0 then
    return mp.CLEAN
  end
  local l_0_8, l_0_9 = pcall(bm.GetModAddress, l_0_5, "ntdll.dll")
  if not l_0_8 or isnull(l_0_9) then
    return mp.CLEAN
  end
  local l_0_10 = mp.bitand(mp.shr64(l_0_9, 24), 16777215)
  if l_0_10 == nil or l_0_10 == 0 then
    return mp.CLEAN
  end
  if l_0_1 == l_0_10 then
    bm.trigger_sig("BMGenericCodeInjector.A", "Behavior:Win32/GenCodeInjector.F", l_0_5)
    return mp.INFECTED
  end
end
return mp.CLEAN
