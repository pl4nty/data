-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1729f65c019c\1.luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("scpt:WebShellObf_") < 3 then
  return mp.CLEAN
end
return mp.INFECTED

