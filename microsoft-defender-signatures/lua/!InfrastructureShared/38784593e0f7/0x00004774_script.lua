-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\38784593e0f7\0x00004774_luac 

-- params : ...
-- function num : 0
if checkIfCertificateHit() then
  return mp.INFECTED
end
return mp.CLEAN

