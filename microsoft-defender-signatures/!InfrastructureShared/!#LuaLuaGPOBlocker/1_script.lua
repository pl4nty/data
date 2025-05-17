-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLuaGPOBlocker\1_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = l_0_0:lower()
if not l_0_1:find("svchost", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_2:lower()
local l_0_4 = "^\\device\\mup\\.+\\sysvol\\.+\\policies\\{(%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x)}\\gpt.ini$"
local l_0_5 = l_0_3:match(l_0_4)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = tostring(headerpage)
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = l_0_6:match("Version%s*=%s*(%d+)")
if not l_0_7 then
  (mp.set_mpattribute)("Lua:GptIniMissingVersion")
  return mp.INFECTED
end
local l_0_8, l_0_9 = pcall(MpCommon.RollingQueueQueryKey, "gpo_block", l_0_5)
if l_0_8 and l_0_9 then
  return mp.INFECTED
end
local l_0_10, l_0_11 = pcall(MpCommon.RollingQueueQueryKey, "gpo_applied", l_0_5)
if l_0_10 and l_0_11 and l_0_11.value and l_0_11.value == l_0_7 then
  return mp.CLEAN
end
local l_0_12 = tonumber(l_0_7)
;
(mp.set_mpattributeex)("Lua:GPOVersion", l_0_12)
;
(mp.set_mpattribute)("Lua:GPOBlockerFilter")
return mp.CLEAN

