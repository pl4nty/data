-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8b78be8da\1.luac 

-- params : ...
-- function num : 0
if peattributes.isexe and peattributes.is_delphi and (pesecs[8]).Name == ".rsrc" and (pesecs[8]).SizeOfRawData >= 3145728 then
  return mp.SUSPICIOUS
end
return mp.CLEAN

