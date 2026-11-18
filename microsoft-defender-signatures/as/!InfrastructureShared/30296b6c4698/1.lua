-- Threat: !InfrastructureShared
-- Name: 30296b6c4698
-- Type: 21

local l_0_0 = tostring(headerpage):lower()
local l_0_1 = l_0_0:match("add%-mppreference%s+%-exclusionpath%s+([^%c%s]+)")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.len(l_0_1)
if l_0_2 ~= 2 and l_0_2 ~= 3 then
  return mp.CLEAN
end
if mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_3 then
    local l_0_4 = mp.GetParentProcInfo(l_0_3)
    if l_0_4 ~= nil and not mp.IsKnownFriendlyFile(l_0_4.image_path, true, false) then
      mp.ReportLowfi(l_0_4.image_path, 4223781442)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
