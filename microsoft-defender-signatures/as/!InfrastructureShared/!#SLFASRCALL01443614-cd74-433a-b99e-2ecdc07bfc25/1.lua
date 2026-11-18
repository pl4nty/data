-- Threat: !InfrastructureShared
-- Name: !#SLF:ASRCALL01443614-cd74-433a-b99e-2ecdc07bfc25
-- Type: 10
-- MpAttributes: pea_isdll & !pea_msil_ngenimage & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.IsHipsRuleEnabled("01443614-cd74-433a-b99e-2ecdc07bfc25") then
  return mp.CLEAN
end
local l_0_1 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_1) then
  return mp.CLEAN
end
if l_0_0 == mp.SCANREASON_ONOPEN then
  local l_0_2 = {
    ["rundll32.exe"] = true,
    ["regsvr32.exe"] = true
  }
  local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  if l_0_2[string.lower(l_0_3)] == true then
    if mp.get_mpattribute("MpDisableCaching") then
      mp.clear_mpattribute("MpDisableCaching")
    end
    local l_0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
    if l_0_4 ~= nil and l_0_4 ~= "" then
      l_0_4 = string.lower(MpCommon.PathToWin32Path(l_0_4))
      if mp.IsPathExcludedForHipsRule(l_0_4, "01443614-cd74-433a-b99e-2ecdc07bfc25") then
        return mp.CLEAN
      end
      if string.find(l_0_4, ".:\\windows\\installer\\[^\\]+%.tmp$") then
        return mp.CLEAN
      end
      if string.find(l_0_4, ".:\\windows\\installer\\[^%.]+%.tmp%-\\installercustomactions%.dll$") then
        return mp.CLEAN
      end
    end
    local l_0_5, l_0_6 = mp.IsTrustedFile(false)
    if l_0_5 == false then
      return mp.INFECTED
    end
  end
else
  local l_0_7, l_0_8 = mp.IsTrustedFile(false)
  if l_0_7 == false then
    mp.set_mpattribute("MpDisableCaching")
  end
end
return mp.CLEAN
