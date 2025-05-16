-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3878c5bf4156\0x0000477e_luac 

-- params : ...
-- function num : 0
if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN

