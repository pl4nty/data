-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\134789d99\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 4 then
  (mp.set_mpattribute)("HSTR:Win32/Emotet")
end
return mp.INFECTED

