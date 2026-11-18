-- Threat: !#ALF:Trojan:Linux/SamDust.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & SCRIPT:Has_C_code.A & LUA:FileSizeLE10000.A

if #mp.enum_mpattributesubstring("SCPT:SSHPatchSamDustDiff") >= 3 and #mp.enum_mpattributesubstring("SCPT:SSHPatchSamDustCode") >= 5 then
  return mp.INFECTED
end
return mp.CLEAN
