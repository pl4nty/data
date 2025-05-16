-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFBackdoorWin32SuspIISInMemoryModuleA\0x000006e7_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattributesubstring)("ALF:Exploit:Script/SuspIISAssembly.") then
  return mp.CLEAN
end
local l_0_0 = (mp.enum_mpattributesubstring)("Lua:PeOriginalName!")
if l_0_0 == nil then
  return mp.CLEAN
end
if #l_0_0 == 0 then
  return mp.CLEAN
end
for l_0_4,l_0_5 in ipairs(l_0_0) do
  if (string.find)(l_0_5, "!app_web_", 1, true) ~= nil then
    return mp.CLEAN
  end
  if #l_0_5 == 31 and (mp.get_mpattribute)("LUA:PeFileVersion!0.0.0.0") then
    return mp.CLEAN
  end
end
return mp.INFECTED

