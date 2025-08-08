-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SuspReuseOldCert_S001\1.luac 

-- params : ...
-- function num : 0
if peattributes.x86_image == false then
  return mp.INFECTED
end
if pehdr.TimeDateStamp ~= 0 and 1577836800 < pehdr.TimeDateStamp then
  return mp.INFECTED
end
return mp.CLEAN

