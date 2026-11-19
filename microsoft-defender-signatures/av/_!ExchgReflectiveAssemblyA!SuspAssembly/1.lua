-- Threat: \x84!ExchgReflectiveAssembly.A!SuspAssembly
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & Lua:IsDotNetAMSIScan_Exchg & Lua:MSIL.PublicKeyNull & !AGGR:ExcludeModules

local l_0_0 = mp.enum_mpattributesubstring("Lua:PeOriginalName!")
if l_0_0 == nil then
  return mp.CLEAN
end
if #l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if not l_0_1 or not l_0_2 then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(l_0_0) do
  if #l_0_4 == 31 and (mp.get_mpattribute("LUA:PeFileVersion!15.0.0.0") or mp.get_mpattribute("LUA:PeFileVersion!0.0.0.0") or mp.get_mpattribute("LUA:PeFileVersion!10.0.0.0") or mp.get_mpattribute("LUA:PeFileVersion!4.8.4084.0")) then
    return mp.CLEAN
  elseif #l_0_4 == 39 and string.find(l_0_4, "!app_web_", -21, true) ~= nil then
    return mp.CLEAN
  elseif #l_0_4 == 42 and string.find(l_0_4, "!app_web_", -24, true) ~= nil then
    return mp.CLEAN
  else
    TT_SendBMSigTrigger(l_0_2, "SuspModuleName", l_0_4, 2)
  end
end
return mp.INFECTED
