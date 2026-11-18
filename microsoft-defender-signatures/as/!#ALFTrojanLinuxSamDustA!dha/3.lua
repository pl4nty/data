-- Threat: !#ALF:Trojan:Linux/SamDust.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (SCPT:Linux/ShellScript | LUA:FileSizeLE20000.A)

local l_0_0 = mp.enum_mpattributesubstring("SCPT:SamDust")
if 3 <= #l_0_0 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
