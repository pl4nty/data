-- Threat: !InfrastructureShared
-- Name: !#ALF:LLXLoader.A
-- Type: 24
-- MpAttributes: HSTR:LLXLoader.Emot & BM_MZ_DLL

local l_0_0 = {
  ["excel.exe"] = "",
  ["windword.exe"] = ""
}
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0[l_0_1] then
  return mp.INFECTED
end
return mp.CLEAN
