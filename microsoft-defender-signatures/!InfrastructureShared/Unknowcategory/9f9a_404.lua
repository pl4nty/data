-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9f9a_404.luac 

-- params : ...
-- function num : 0
endswith = function(l_1_0, l_1_1)
  -- function num : 0_0
  do return l_1_0:sub(-#l_1_1) == l_1_1 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

if peattributes.isdll and not peattributes.hasexports and endswith((string.lower)((mp.getfilename)()), "magentloc.dll") then
  return mp.INFECTED
end
return mp.CLEAN

