-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/WinTempSysFileBlock
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
if l_0_1 == nil or l_0_1 ~= nil and 3600 < l_0_1 then
  return mp.CLEAN
end
if string.lower(string.sub(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME), -4)) ~= ".sys" then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if string.lower(string.sub(l_0_2, -13)) ~= "\\windows\\temp" then
  return mp.CLEAN
end
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if not mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_3 ~= "ntoskrnl.exe" then
  return mp.CLEAN
end
return mp.INFECTED
