-- Threat: !InfrastructureShared
-- Name: !#TEL:Ransom:Win32/Roxstage!file
-- Type: 13
-- MpAttributes: !BM_MZ_FILE & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2 .. "\\" .. l_0_0
if not MpCommon.QueryPersistContext(l_0_2, "CLOUD:RoxstageBlockAccess") then
  return mp.CLEAN
end
return mp.INFECTED
