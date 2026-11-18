-- Threat: \xac!WPADAbuse.A
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename()
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_1 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if not mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
    return mp.CLEAN
  end
  if string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) ~= "svchost.exe" then
    return mp.CLEAN
  end
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  local l_0_3 = mp.GetProcessCommandLine(l_0_2)
  local l_0_4 = string.len(l_0_3)
  if l_0_4 < 60 or 120 < l_0_4 then
    return mp.CLEAN
  end
  if string.find(string.lower(l_0_3), "winhttpautoproxysvc", 1, true) == nil then
    return mp.CLEAN
  end
  if not MpCommon.QueryPersistContext(l_0_0, "DroppedByWPADService") then
    MpCommon.AppendPersistContext(l_0_0, "DroppedByWPADService", 0)
  end
  local l_0_5 = mp.enum_mpattributesubstring("PreAgent:")
  if l_0_5 == nil then
    mp.ReportLowfi(l_0_0, 1486841132)
  end
  if #l_0_5 == 0 then
    mp.ReportLowfi(l_0_0, 1486841132)
  end
elseif l_0_1 == mp.SCANREASON_ONOPEN then
  if not mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
    return mp.CLEAN
  end
  if not MpCommon.QueryPersistContext(l_0_0, "DroppedByWPADService") then
    return mp.CLEAN
  end
  local l_0_6 = mp.enum_mpattributesubstring("PreAgent:")
  if l_0_6 == nil then
    return mp.CLEAN
  end
  if #l_0_6 == 0 then
    return mp.CLEAN
  end
  local l_0_7 = 0
  local l_0_8 = 0
  for l_0_9, l_0_10 in ipairs(l_0_6) do
    local l_0_11, l_0_12 = string.match(l_0_10, "PreAgent:V(%d+)V(%d+)$")
    if l_0_11 ~= nil then
      local l_0_13 = tonumber(l_0_11)
      if l_0_7 < l_0_13 then
        l_0_7 = l_0_13
      end
    end
    if l_0_12 ~= nil then
      local l_0_14 = tonumber(l_0_12)
      if l_0_8 < l_0_14 then
        l_0_8 = l_0_14
      end
    end
  end
  if l_0_7 < 362514 or 362529 < l_0_7 or l_0_8 < 362514 or 377514 < l_0_8 then
    return mp.CLEAN
  end
  l_0_7 = l_0_7 - 362514
  l_0_8 = l_0_8 - 362514
  if l_0_7 <= 1 and l_0_8 <= 100 then
    return mp.INFECTED
  end
end
return mp.CLEAN
