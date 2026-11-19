-- Threat: !InfrastructureShared
-- Name: 6dd7b789f258
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 ~= nil and l_0_0 ~= "" then
  local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
  if l_0_1 ~= nil and l_0_1 ~= "" then
    mp.set_mpattribute(string.format("MpInternal_researchdata=fullcmd=%s", l_0_1))
  end
end
return mp.INFECTED
