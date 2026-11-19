-- Threat: !InfrastructureShared
-- Name: !#SLFPER:ContextualTadymet.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "my.dat" then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if l_0_2:len() > 7 and string.sub(l_0_2, -5) == "\\temp" then
      local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
      if l_0_3 == "mediaget.exe" then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
