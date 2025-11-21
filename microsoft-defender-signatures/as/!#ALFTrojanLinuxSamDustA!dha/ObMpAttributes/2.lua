-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!#ALFTrojanLinuxSamDustA!dha\ObMpAttributes\2.luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("SCPT:SSHPatchSamDustDiff") >= 3 and #(mp.enum_mpattributesubstring)("SCPT:SSHPatchSamDustCode") >= 5 then
  return mp.INFECTED
end
return mp.CLEAN

