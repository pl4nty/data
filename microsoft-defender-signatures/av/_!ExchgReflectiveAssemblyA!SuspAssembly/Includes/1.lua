-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!ExchgReflectiveAssemblyA!SuspAssembly\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("Lua:PeOriginalName!")
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
for l_0_6,l_0_7 in ipairs(l_0_0) do
  if #l_0_7 == 31 and ((mp.get_mpattribute)("LUA:PeFileVersion!15.0.0.0") or (mp.get_mpattribute)("LUA:PeFileVersion!0.0.0.0") or (mp.get_mpattribute)("LUA:PeFileVersion!10.0.0.0") or (mp.get_mpattribute)("LUA:PeFileVersion!4.8.4084.0")) then
    return mp.CLEAN
  else
    if #l_0_7 == 39 and (string.find)(l_0_7, "!app_web_", -21, true) ~= nil then
      return mp.CLEAN
    else
      if #l_0_7 == 42 and (string.find)(l_0_7, "!app_web_", -24, true) ~= nil then
        return mp.CLEAN
      else
        TT_SendBMSigTrigger(l_0_2, "SuspModuleName", l_0_7, 2)
      end
    end
  end
end
return mp.INFECTED

