-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\871d_luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections >= 4 and (pesecs[4]).Name == ".newimp" and (mp.bitand)((pesecs[4]).Characteristics, 2147483648) == 2147483648 then
  return mp.INFECTED
end
return mp.CLEAN

