-- Threat: !InfrastructureShared
-- Name: !#SLF:Backdoor:Win32/SQLReflectiveAssembly.A!SuspAssembly
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & Sigattr:SQLModule

local l_0_0 = mp.enum_mpattributesubstring("SLF:Backdoor:MSIL/SuspSQLAssembly.")
if l_0_0 == nil or #l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("Lua:PeOriginalName!")
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_2 == "sqlservr.exe" then
  local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_3 ~= nil then
    for l_0_4, l_0_5 in ipairs(l_0_1) do
      TT_SendBMSigTrigger(l_0_3, "SuspSQLModuleName", l_0_5)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
