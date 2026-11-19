-- Threat: !InfrastructureShared
-- Name: !#Lua:ShortcutfileNormalize.A
-- Type: 13
-- MpAttributes: SCRIPT:StringCmdExe & //AGGR:LinkFile & !RPF:TopLevelFile & !Lua:LnkExclusions

if mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  local l_0_0 = tostring(headerpage)
  local l_0_1 = 10
  local l_0_2 = string.find(l_0_0, "\000\000", 1, true)
  if l_0_2 == nil or l_0_1 >= l_0_2 then
    return mp.CLEAN
  end
  l_0_0 = l_0_0:sub(0, l_0_2)
  local l_0_3
  local l_0_4 = false
  if string.find(l_0_0, "\"", 1, true) ~= nil then
    local l_0_5 = 0
    l_0_3, l_0_5 = l_0_0:gsub("\"", "")
    if l_0_0 and l_0_1 < l_0_5 then
      l_0_4 = true
    end
  end
  if string.find(l_0_0, "^", 1, true) ~= nil then
    local l_0_6 = 0
    l_0_3, l_0_6 = l_0_0:gsub("^", "")
    if l_0_0 and l_0_1 < l_0_6 then
      l_0_4 = true
    end
  end
  if l_0_4 == true and l_0_3 ~= nil and l_0_1 < #l_0_3 then
    mp.vfo_add_buffer(l_0_3, "[CMDEmbeddedNorm]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.INFECTED
  end
end
return mp.CLEAN
