-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3d7825c96e0f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if CheckVulnerableUEFIImage(l_0_0, "!#TEL:Trojan:UEFI/InsyVul.J") then
  return mp.INFECTED
end
return mp.CLEAN

