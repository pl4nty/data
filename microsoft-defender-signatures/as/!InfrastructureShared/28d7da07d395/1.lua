-- Threat: !InfrastructureShared
-- Name: 28d7da07d395
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) then
  local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
  if not isnull(l_0_1) then
    local l_0_2 = string.match(l_0_1, "%-EncodedCommand%s+([A-Za-z0-9+/=]+)") or string.match(l_0_1, "%-Enc%s+([A-Za-z0-9+/=]+)")
    if l_0_2 == nil then
      return mp.CLEAN
    end
    local l_0_3 = MpCommon.Base64Decode(l_0_2)
    if l_0_3 == nil then
      return mp.CLEAN
    end
    l_0_3 = string.lower(l_0_3)
    local l_0_4 = {
      "invoke-webrequest",
      "invoke-expression",
      "| invoke-expression",
      "|iex",
      "| iex",
      "iwr "
    }
    if contains(l_0_3, l_0_4) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
