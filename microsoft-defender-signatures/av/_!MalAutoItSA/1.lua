-- Threat: \xac!MalAutoIt.SA
-- Type: 24
-- MpAttributes: BM_AutoitExe & (Lua:AbsentExtension | Lua:PIFExt | Lua:COMExt | Lua:SRCExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1 ~= nil and string.find(l_0_1, "\\appdata\\local\\", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
