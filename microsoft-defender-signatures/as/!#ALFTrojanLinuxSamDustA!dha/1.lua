-- Threat: !#ALF:Trojan:Linux/SamDust.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & SCRIPT:Has_C_code.A & Lua:FileSizeLT2000

if #mp.enum_mpattributesubstring("SCPT:SamMatserBackdoor") >= 4 then
  return mp.INFECTED
end
return mp.CLEAN
