-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f378922d2570\0x0000478e_luac 

-- params : ...
-- function num : 0
if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN

