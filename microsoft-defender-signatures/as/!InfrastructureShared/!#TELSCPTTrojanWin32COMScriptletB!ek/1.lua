-- Threat: !InfrastructureShared
-- Name: !#TEL:SCPT:Trojan:Win32/COMScriptlet.B!ek
-- Type: 13
-- MpAttributes: TEL:SCPT:Trojan:Win32/COMScriptlet.B

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if string.find(l_0_1, "%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x") then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_2 == "regsvr32.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
