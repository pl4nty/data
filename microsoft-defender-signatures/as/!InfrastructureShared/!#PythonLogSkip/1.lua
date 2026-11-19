-- Threat: !InfrastructureShared
-- Name: !#PythonLogSkip
-- Type: 26

local l_0_0 = skip.get_contextdata(skip.CONTEXT_DATA_SCANREASON)
if l_0_0 == skip.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(skip.get_contextdata(skip.CONTEXT_DATA_PROCESSNAME))
  if l_0_1 == "python.exe" then
    local l_0_2 = string.lower(skip.get_contextdata(skip.CONTEXT_DATA_PROCESSDEVICEPATH))
    if string.find(l_0_2, "\\attackiq", 1, true) == nil then
      return 1
    end
  end
end
return 0
