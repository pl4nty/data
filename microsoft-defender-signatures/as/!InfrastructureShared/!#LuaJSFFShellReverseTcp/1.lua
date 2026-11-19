-- Threat: !InfrastructureShared
-- Name: !#Lua:JS/FFShellReverseTcp
-- Type: 13
-- MpAttributes: TEL:JS/FFShellReverseTcp

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.find(l_0_1, "\\temp", 1, true) then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_2 == "firefox.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
