-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2b78465d1\1.luac 

-- params : ...
-- function num : 0
if peattributes.suspicious_image_version and peattributes.suspicious_timestamp and peattributes.isdll and (mp.getfilesize)() < 319488 and ((pesecs[3]).Name == ".ydata" or (pesecs[3]).Name == ".hdata" or (pesecs[3]).Name == ".idata") then
  return mp.SUSPICIOUS
end
return mp.LOWFI

