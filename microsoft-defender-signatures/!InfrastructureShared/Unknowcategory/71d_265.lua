-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\71d_265.luac 

-- params : ...
-- function num : 0
if (mp.ispackedwith)("AutoIt_+") and (mp.getfilesize)() >= 4194304 and not peattributes.isreported then
  return mp.INFECTED
end
return mp.CLEAN

