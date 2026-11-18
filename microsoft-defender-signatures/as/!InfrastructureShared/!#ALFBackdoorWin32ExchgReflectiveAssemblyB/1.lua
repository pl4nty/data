-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win32/ExchgReflectiveAssembly.B
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:IsDotNetAMSIScan_Exchg & Lua:MSIL.PublicKeyNull

if not mp.get_mpattribute("LUA:PeFileVersion!0.0.0.0") and not mp.get_mpattribute("LUA:PeFileVersion!1.0.0.0") then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:PeOriginalName!microsoft.generatedcode.dll") then
  return mp.CLEAN
end
local l_0_0 = mp.enum_mpattributesubstring("Lua:PeOriginalName!")
if l_0_0 == nil then
  return mp.CLEAN
end
if #l_0_0 == 0 then
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if string.find(l_0_2, "!app_web_", 1, true) ~= nil then
    return mp.CLEAN
  end
  if #l_0_2 == 31 and mp.get_mpattribute("LUA:PeFileVersion!0.0.0.0") then
    return mp.CLEAN
  end
end
return mp.INFECTED
