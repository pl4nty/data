-- Threat: !InfrastructureShared
-- Name: !#TELPER:SuspTamper.J
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & (Lua:PS1Ext | MpIsPowerShellAMSIScan)

local l_0_0 = mp.enum_mpattributesubstring("SCPT:SuspTamper.J")
if 3 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
