-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFRansomAESRSACryptoAlgoInUseA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("MpContentDetected") and (mp.get_mpattributesubstring)("Detection:Ransom:") then
  return mp.INFECTED
end
return mp.CLEAN

