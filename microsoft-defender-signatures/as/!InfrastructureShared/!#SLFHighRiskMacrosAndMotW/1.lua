-- Threat: !InfrastructureShared
-- Name: !#SLF:HighRiskMacrosAndMotW
-- Type: 13
-- MpAttributes: MHSTR:MacroInside & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  if versioning.IsBeta() then
    return mp.INFECTED
  else
    local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME) or ""
    if l_0_1 ~= "" then
      l_0_1 = l_0_1:lower()
      local l_0_2 = {
        ["winword.exe"] = true,
        ["excel.exe"] = true
      }
      if l_0_2[l_0_1] then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
