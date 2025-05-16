-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41078cdf2c498\0x000047e9_luac 

-- params : ...
-- function num : 0
if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN

